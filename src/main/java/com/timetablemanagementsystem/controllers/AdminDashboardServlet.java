package com.timetablemanagementsystem.controllers;

import com.timetablemanagementsystem.dao.*;

import com.timetablemanagementsystem.dao.ModuleDAO;
import com.timetablemanagementsystem.model.*;
import com.timetablemanagementsystem.model.Module;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Time;
import java.util.List;

/**
 * Controller for the Admin Dashboard and its various management views.
 */
@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private TeacherDAO teacherDAO = new TeacherDAO();
    private TimetableDAO timetableDAO = new TimetableDAO();
    private UserDAO userDAO = new UserDAO();
    private AnnouncementDAO announcementDAO = new AnnouncementDAO();
    private ModuleDAO moduleDAO = new ModuleDAO();
    private SectionDAO sectionDAO = new SectionDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DEBUG: AdminDashboardServlet.doGet() reached.");
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                System.out.println("DEBUG: No session/user in AdminDashboardServlet.");
                response.sendRedirect("login");
                return;
            }
            User user = (User) session.getAttribute("user");
            String role = user.getRole();
            System.out.println("DEBUG: User " + user.getName() + " with role " + role + " accessing admin dashboard.");
            if (!"Admin".equalsIgnoreCase(role)) {
                // ... (logic remains same)
                if ("Student".equalsIgnoreCase(role)) {
                    response.sendRedirect("student-dashboard");
                } else if ("Teacher".equalsIgnoreCase(role)) {
                    response.sendRedirect("teacher-dashboard");
                } else {
                    response.sendRedirect("portal");
                }
                return;
            }

            String view = request.getParameter("view");
            if (view == null) view = "dashboard";
            System.out.println("DEBUG: Admin view requested: " + view);

            if ("dashboard".equals(view)) {
                request.setAttribute("totalUsers", userDAO.getUserCount());
                request.setAttribute("totalStudents", userDAO.getCountByRole("Student"));
                request.setAttribute("totalTeachers", userDAO.getCountByRole("Teacher"));
                request.setAttribute("totalClasses", timetableDAO.getClassCount());
                request.setAttribute("users", userDAO.getAllUsers());
                
                System.out.println("DEBUG: Forwarding to /WEB-INF/pages/admin-dashboard.jsp");
                request.getRequestDispatcher("/WEB-INF/pages/admin-dashboard.jsp").forward(request, response);
            } else if ("schedule".equals(view)) {
                request.setAttribute("teachers", teacherDAO.getAllTeachers());
                request.setAttribute("modules", moduleDAO.getAllModules());
                request.setAttribute("sections", sectionDAO.getAllSections());
                request.setAttribute("timetable", timetableDAO.getTimetable());
                request.getRequestDispatcher("/WEB-INF/pages/manage-schedule.jsp").forward(request, response);
            } else if ("teachers".equals(view)) {
                request.setAttribute("teachers", teacherDAO.getAllTeachers());
                request.getRequestDispatcher("/WEB-INF/pages/manage-teachers.jsp").forward(request, response);
            } else if ("announcements".equals(view)) {
                request.setAttribute("announcements", announcementDAO.getAllAnnouncements());
                request.getRequestDispatcher("/WEB-INF/pages/manage-announcements.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.err.println("Admin Dashboard Error: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DEBUG: AdminDashboardServlet.doPost() reached.");
        // ... (rest of the code)
        String action = request.getParameter("action");
        System.out.println("DEBUG: Admin action: " + action);
        // ... (rest of the code)
        String redirectView = "dashboard";
        
        if (action == null) {
            response.sendRedirect("admin-dashboard");
            return;
        }

        switch (action) {
            case "addTeacher":
                User newUser = new User();
                newUser.setName(request.getParameter("teacherName"));
                newUser.setEmail(request.getParameter("teacherEmail"));
                newUser.setPassword("password123"); // Default password
                newUser.setRole("Teacher");
                userDAO.register(newUser);
                redirectView = "teachers";
                break;
            case "deleteTeacher":
                teacherDAO.deleteTeacher(Integer.parseInt(request.getParameter("id")));
                redirectView = "teachers";
                break;
            case "addTimetable":
                TimetableEntry entry = new TimetableEntry();
                entry.setSectionId(Integer.parseInt(request.getParameter("sectionId")));
                entry.setModuleCode(request.getParameter("moduleCode"));
                entry.setClassType(request.getParameter("classType"));
                entry.setLecturerId(Integer.parseInt(request.getParameter("teacherId")));
                entry.setBlock(request.getParameter("block"));
                entry.setRoom(request.getParameter("room"));
                entry.setDay(request.getParameter("day"));
                
                String timeStr = request.getParameter("startTime");
                String endTimeStr = request.getParameter("endTime");
                if (timeStr != null && !timeStr.isEmpty()) entry.setStartTime(Time.valueOf(timeStr + ":00"));
                if (endTimeStr != null && !endTimeStr.isEmpty()) entry.setEndTime(Time.valueOf(endTimeStr + ":00"));
                
                timetableDAO.addEntry(entry);
                redirectView = "schedule";
                break;
            case "deleteTimetable":
                timetableDAO.deleteEntry(Integer.parseInt(request.getParameter("id")));
                redirectView = "schedule";
                break;
            case "addAnnouncement":
                announcementDAO.addAnnouncement(request.getParameter("title"), request.getParameter("content"));
                redirectView = "announcements";
                break;
            case "updateAnnouncement":
                // Handle announcement update
                try {
                    int announcementId = Integer.parseInt(request.getParameter("id"));
                    String title = request.getParameter("title");
                    String content = request.getParameter("content");
                    
                    HttpSession session = request.getSession(false);
                    User admin = (User) session.getAttribute("user");
                    int adminId = admin.getUserId();
                    java.sql.Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());

                    if (title != null && !title.trim().isEmpty() && content != null && !content.trim().isEmpty()) {
                        boolean success = announcementDAO.updateAnnouncement(announcementId, title, content);
                        if (success) {
                            System.out.println(String.format("[%s] SUCCESS: Admin %d updated Announcement %d", now, adminId, announcementId));
                        } else {
                            System.err.println(String.format("[%s] FAILURE: Admin %d failed to update Announcement %d (DB error or invalid ID)", now, adminId, announcementId));
                        }
                    } else {
                        System.err.println(String.format("[%s] FAILURE: Admin %d attempted update with empty fields for Announcement %d", now, adminId, announcementId));
                    }
                } catch (Exception e) {
                    System.err.println("DEBUG ERROR: Error processing updateAnnouncement: " + e.getMessage());
                }
                redirectView = "announcements";
                break;
            case "deleteAnnouncement":
                announcementDAO.deleteAnnouncement(Integer.parseInt(request.getParameter("id")));
                redirectView = "announcements";
                break;
        }
        response.sendRedirect("admin-dashboard?view=" + redirectView);
    }
}
