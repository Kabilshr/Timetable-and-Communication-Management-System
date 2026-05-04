package com.timetablemanagementsystem.controllers;

import com.timetablemanagementsystem.dao.*;
import com.timetablemanagementsystem.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.*;

@WebServlet("/student-dashboard")
public class StudentDashboardServlet extends HttpServlet {
    private TimetableDAO timetableDAO = new TimetableDAO();
    private AnnouncementDAO announcementDAO = new AnnouncementDAO();
    private TeacherDAO teacherDAO = new TeacherDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String role = user.getRole();
        if (!"Student".equalsIgnoreCase(role)) {
            if ("Admin".equalsIgnoreCase(role)) {
                response.sendRedirect(request.getContextPath() + "/admin-dashboard");
            } else if ("Teacher".equalsIgnoreCase(role)) {
                response.sendRedirect(request.getContextPath() + "/teacher-dashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/portal");
            }
            return;
        }

        String requestedDay = request.getParameter("day");
        String view = request.getParameter("view");
        if (view == null) view = "dashboard";
        request.setAttribute("view", view);

        try {
            if ("dashboard".equals(view)) {
                String today = LocalDate.now().getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH);
                String filterDay = (requestedDay != null) ? requestedDay : today;
                List<TimetableEntry> timetable = timetableDAO.getTimetable();
                
                List<Announcement> allAnnouncements = announcementDAO.getAllAnnouncements();
                List<Announcement> recent = allAnnouncements.size() > 3 ? allAnnouncements.subList(0, 3) : allAnnouncements;

                request.setAttribute("todayClasses", timetable);
                request.setAttribute("announcements", recent);
                request.setAttribute("todayDay", filterDay);

            } else if ("schedule".equals(view)) {
                request.setAttribute("timetable", timetableDAO.getTimetable());

            } else if ("announcements".equals(view)) {
                request.setAttribute("announcements", announcementDAO.getAllAnnouncements());

            } else if ("teachers".equals(view)) {
                String teacherIdParam = request.getParameter("teacherId");
                List<String> days = Arrays.asList("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday");
                List<String> allSlots = Arrays.asList("08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00");
                
                if (teacherIdParam != null && !teacherIdParam.isEmpty()) {
                    int tId = Integer.parseInt(teacherIdParam);
                    Teacher teacher = null;
                    for(Teacher t : teacherDAO.getAllTeachers()) { if(t.getTeacherId() == tId) { teacher = t; break; } }
                    
                    if (teacher != null) {
                        List<TimetableEntry> teacherSchedule = timetableDAO.getTimetable();
                        Map<String, List<String>> freeSlotsByDay = new HashMap<>();
                        for (String day : days) {
                            List<String> freeSlots = new ArrayList<>(allSlots);
                            for (TimetableEntry entry : teacherSchedule) {
                                if (entry.getDay().equalsIgnoreCase(day) && entry.getLecturer().equalsIgnoreCase(teacher.getTeacherName())) {
                                    String entryTime = entry.getStartTime().toString().substring(0, 5);
                                    freeSlots.remove(entryTime);
                                }
                            }
                            freeSlotsByDay.put(day, freeSlots);
                        }
                        request.setAttribute("selectedTeacher", teacher);
                        request.setAttribute("freeSlotsByDay", freeSlotsByDay);
                    }
                }
                request.setAttribute("teachers", teacherDAO.getAllTeachers());
                request.setAttribute("days", days);
            }
            
            request.getRequestDispatcher("/WEB-INF/pages/student-dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}
