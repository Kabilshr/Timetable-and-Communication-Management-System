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

/**
 * Controller for the Teacher Dashboard and its various views.
 * Behaves like AdminDashboardServlet using the 'view' parameter.
 */
@WebServlet("/teacher-dashboard")
public class TeacherDashboardServlet extends HttpServlet {
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
        if (!"Teacher".equalsIgnoreCase(role)) {
            if ("Admin".equalsIgnoreCase(role)) {
                response.sendRedirect(request.getContextPath() + "/admin-dashboard");
            } else if ("Student".equalsIgnoreCase(role)) {
                response.sendRedirect(request.getContextPath() + "/student-dashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/portal");
            }
            return;
        }

        String view = request.getParameter("view");
        if (view == null) view = "dashboard";
        request.setAttribute("view", view);

        try {
            if ("dashboard".equals(view)) {
                // Fetch personal schedule
                List<TimetableEntry> timetable = timetableDAO.getTimetable(null, null, user.getName());
                
                // Get today's classes
                String today = LocalDate.now().getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH);
                List<TimetableEntry> todayClasses = new ArrayList<>();
                for (TimetableEntry entry : timetable) {
                    if (today.equalsIgnoreCase(entry.getClassDay())) {
                        todayClasses.add(entry);
                    }
                }
                
                // Fetch recent announcements
                List<Announcement> announcements = announcementDAO.getAllAnnouncements();
                List<Announcement> recent = announcements.size() > 3 ? announcements.subList(0, 3) : announcements;

                request.setAttribute("todayClasses", todayClasses);
                request.setAttribute("announcements", recent);
                request.setAttribute("todayDay", today);

            } else if ("schedule".equals(view)) {
                request.setAttribute("timetable", timetableDAO.getTimetable(null, null, user.getName()));

            } else if ("announcements".equals(view)) {
                request.setAttribute("announcements", announcementDAO.getAllAnnouncements());

            } else if ("collaboration".equals(view)) {
                String[] selectedTeachers = request.getParameterValues("teachers");
                List<TimetableEntry> combinedTimetable = new ArrayList<>();
                
                // Always include current teacher
                combinedTimetable.addAll(timetableDAO.getTimetable(null, null, user.getName()));

                if (selectedTeachers != null) {
                    for (String teacherName : selectedTeachers) {
                        if (!teacherName.equalsIgnoreCase(user.getName())) {
                            combinedTimetable.addAll(timetableDAO.getTimetable(null, null, teacherName));
                        }
                    }
                }

                request.setAttribute("allTeachers", teacherDAO.getAllTeachers());
                request.setAttribute("combinedTimetable", combinedTimetable);
                request.setAttribute("selectedTeachers", selectedTeachers != null ? Arrays.asList(selectedTeachers) : new ArrayList<>());
                request.setAttribute("currentUser", user.getName());
            }

            request.getRequestDispatcher("/WEB-INF/pages/teacher-dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        if ("addAnnouncement".equals(action)) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            if (title != null && content != null) {
                announcementDAO.addAnnouncement(title, content);
                response.sendRedirect("teacher-dashboard?view=announcements&success=true");
                return;
            }
        }
        response.sendRedirect("teacher-dashboard");
    }
}
