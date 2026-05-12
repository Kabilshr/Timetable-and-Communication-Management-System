package com.timetablemanagementsystem.controllers;

import com.google.gson.*;
import com.timetablemanagementsystem.dao.*;
import com.timetablemanagementsystem.dao.ModuleDAO;
import com.timetablemanagementsystem.model.*;
import com.timetablemanagementsystem.model.Module; // Avoid ambiguity
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Time;
import java.util.*;

@WebServlet("/upload-schedule")
@MultipartConfig
public class ScheduleUploadServlet extends HttpServlet {
    private TimetableDAO timetableDAO = new TimetableDAO();
    private ModuleDAO moduleDAO = new ModuleDAO();
    private TeacherDAO teacherDAO = new TeacherDAO();
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("admin-dashboard?view=schedule");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendRedirect("admin-dashboard?view=schedule&error=NoFile");
            return;
        }

        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(filePart.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) sb.append(line);
        }

        int successCount = 0;
        int failCount = 0;
        List<String> errorLogs = new ArrayList<>();

        try {
            JsonElement jsonElement = JsonParser.parseString(sb.toString());
            if (!jsonElement.isJsonArray()) {
                response.sendRedirect("admin-dashboard?view=schedule&error=InvalidJSONFormat");
                return;
            }

            // TRUNCATE timetable as requested for new upload
            try (java.sql.Connection conn = com.timetablemanagementsystem.config.DBConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement()) {
                stmt.execute("SET FOREIGN_KEY_CHECKS = 0");
                stmt.execute("TRUNCATE TABLE timetable");
                stmt.execute("SET FOREIGN_KEY_CHECKS = 1");
            }

            JsonArray entries = jsonElement.getAsJsonArray();
            for (JsonElement entryElement : entries) {
                if (!entryElement.isJsonObject()) continue;
                JsonObject obj = entryElement.getAsJsonObject();

                try {
                    // 1. Extract Data
                    String year = getAsString(obj, "year");
                    String section = getAsString(obj, "section");
                    String day = getAsString(obj, "day");
                    String startTimeStr = getAsString(obj, "start_time");
                    String endTimeStr = getAsString(obj, "end_time");
                    String classType = getAsString(obj, "class_type");
                    String moduleCode = getAsString(obj, "module_code");
                    String moduleTitle = getAsString(obj, "module_title");
                    String lecturerName = getAsString(obj, "lecturer");
                    String block = getAsString(obj, "block");
                    String room = getAsString(obj, "room");

                    if (year == null || section == null || day == null || startTimeStr == null || moduleCode == null || lecturerName == null) {
                        throw new Exception("Missing mandatory fields.");
                    }

                    // 2. Resolve Module
                    Module module = moduleDAO.getModuleByCode(moduleCode);
                    if (module == null) {
                        module = new Module(moduleCode, moduleTitle != null ? moduleTitle : moduleCode);
                        moduleDAO.addModule(module);
                    }

                    // 3. Resolve Teacher
                    Teacher teacher = teacherDAO.getTeacherByName(lecturerName);
                    if (teacher == null) {
                        // Check if a User exists with this name. If not, we might need a placeholder user.
                        // In a real system, lecturers should be pre-registered.
                        // For this implementation, we search for a user or log an error.
                        User user = userDAO.getUserByName(lecturerName);
                        if (user == null) {
                            // Create a placeholder teacher user if not exists
                            user = new User();
                            user.setName(lecturerName);
                            user.setEmail(lecturerName.toLowerCase().replace(" ", ".") + "@placeholder.com");
                            user.setPassword("password123");
                            user.setRole("Teacher");
                            userDAO.register(user);
                            user = userDAO.getUserByName(lecturerName);
                        }
                        
                        // Now check if they are in the teachers table
                        teacher = teacherDAO.getTeacherByUserId(user.getUserId());
                        if (teacher == null) {
                            teacher = new Teacher();
                            teacher.setUserId(user.getUserId());
                            teacher.setModuleCode(moduleCode);
                            int tId = teacherDAO.addTeacher(teacher);
                            teacher = teacherDAO.getTeacherById(tId);
                        }
                    }

                    // 4. Create Entry
                    TimetableEntry entry = new TimetableEntry();
                    entry.setYear(year);
                    entry.setSection(section);
                    entry.setDay(day);
                    entry.setStartTime(parseTime(startTimeStr));
                    entry.setEndTime(parseTime(endTimeStr));
                    entry.setClassType(classType);
                    entry.setModuleCode(module.getModuleCode());
                    entry.setLecturerId(teacher.getTeacherId());
                    entry.setBlock(block);
                    entry.setRoom(room);

                    if (timetableDAO.addEntry(entry)) {
                        successCount++;
                    } else {
                        throw new Exception("Database insertion failed.");
                    }
                } catch (Exception e) {
                    failCount++;
                    errorLogs.add("ID: " + getAsString(obj, "id") + " - " + e.getMessage());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-dashboard?view=schedule&error=GeneralProcessingError");
            return;
        }

        String redirectUrl = "admin-dashboard?view=schedule&success=" + successCount + "&failed=" + failCount;
        response.sendRedirect(redirectUrl);
    }

    private String getAsString(JsonObject obj, String key) {
        if (!obj.has(key) || obj.get(key).isJsonNull()) return null;
        JsonElement e = obj.get(key);
        return e.isJsonPrimitive() ? e.getAsString() : e.toString();
    }

    private Time parseTime(String timeStr) {
        if (timeStr == null || timeStr.isEmpty()) return null;
        try {
            if (timeStr.matches("\\d{3,4}")) {
                int val = Integer.parseInt(timeStr);
                return Time.valueOf(String.format("%02d:%02d:00", val / 100, val % 100));
            }
            if (timeStr.matches("\\d{1,2}:\\d{2}")) return Time.valueOf(timeStr + ":00");
            if (timeStr.matches("\\d{1,2}:\\d{2}:\\d{2}")) return Time.valueOf(timeStr);
            return null;
        } catch (Exception e) { return null; }
    }
}
