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
        System.out.println("DEBUG: TeacherDashboardServlet reached");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            System.out.println("DEBUG: No session or user found, redirecting to login");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String role = user.getRole();
        System.out.println("DEBUG: User role: " + role + ", user_id: " + user.getUserId());
        if (!"Teacher".equalsIgnoreCase(role)) {
            System.out.println("DEBUG: Role is not Teacher, redirecting based on role");
            if ("Admin".equalsIgnoreCase(role)) {
                response.sendRedirect(request.getContextPath() + "/admin-dashboard");
            } else if ("Student".equalsIgnoreCase(role)) {
                response.sendRedirect(request.getContextPath() + "/student-dashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/portal");
            }
            return;
        }

        // Get matching teacher record
        Teacher teacher = teacherDAO.getTeacherByUserId(user.getUserId());
        int teacherId = (teacher != null) ? teacher.getTeacherId() : -1;
        System.out.println("DEBUG: Logged in teacher user_id=" + user.getUserId() + ", teacher_id=" + teacherId);

        String view = request.getParameter("view");
        if (view == null) view = "dashboard";
        request.setAttribute("view", view);
        System.out.println("DEBUG: View parameter: " + view);

        try {
            System.out.println("DEBUG: Entering try block, view: " + view);
            if ("dashboard".equals(view)) {
                // Fetch personal schedule
                List<TimetableEntry> timetable = timetableDAO.getTimetable(teacherId, -1, null); 
                System.out.println("DEBUG: Timetable size: " + timetable.size());
                
                // Get today's classes
                String today = LocalDate.now().getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH);
                List<TimetableEntry> todayClasses = new ArrayList<>();
                for (TimetableEntry entry : timetable) {
                    if (today.equalsIgnoreCase(entry.getDay())) {
                        todayClasses.add(entry);
                    }
                }
                System.out.println("DEBUG: Today's classes count: " + todayClasses.size());
                
                // Fetch recent announcements
                List<Announcement> announcements = announcementDAO.getAllAnnouncements();
                List<Announcement> recent = announcements.size() > 3 ? announcements.subList(0, 3) : announcements;

                request.setAttribute("todayClasses", todayClasses);
                request.setAttribute("announcements", recent);
                request.setAttribute("todayDay", today);

            } else if ("schedule".equals(view)) {
                List<TimetableEntry> timetable = timetableDAO.getTimetable(teacherId, -1, null);
                System.out.println("DEBUG: Schedule view, teacher_id=" + teacherId + ", timetable size: " + timetable.size());
                request.setAttribute("timetable", timetable);

            } else if ("announcements".equals(view)) {
                List<Announcement> announcements = announcementDAO.getAllAnnouncements();
                System.out.println("DEBUG: Announcements view, count: " + announcements.size());
                request.setAttribute("announcements", announcements);

            } else if ("collaboration".equals(view)) {
                String[] selectedTeacherIds = request.getParameterValues("teachers");
                System.out.println("DEBUG: Logged in teacher_id = " + teacherId);
                System.out.println("DEBUG: Selected teacher_ids = " + (selectedTeacherIds != null ? Arrays.toString(selectedTeacherIds) : "none"));
                
                List<TimetableEntry> combinedTimetable = new ArrayList<>();
                
                // Fetch current teacher
                List<TimetableEntry> currentTeacherEntries = timetableDAO.getTimetable(teacherId, -1, null);
                combinedTimetable.addAll(currentTeacherEntries);
                System.out.println("DEBUG: Current teacher entries = " + currentTeacherEntries.size());

                if (selectedTeacherIds != null) {
                    for (String tIdStr : selectedTeacherIds) {
                        try {
                            int tId = Integer.parseInt(tIdStr);
                            if (tId != teacherId) {
                                List<TimetableEntry> selectedTeacherEntries = timetableDAO.getTimetable(tId, -1, null);
                                combinedTimetable.addAll(selectedTeacherEntries);
                                System.out.println("DEBUG: Selected teacher_id " + tId + " entries = " + selectedTeacherEntries.size());
                            }
                        } catch (NumberFormatException e) {
                            System.err.println("DEBUG: Invalid teacher ID: " + tIdStr);
                        }
                    }
                }
                
                System.out.println("DEBUG: Combined entries = " + combinedTimetable.size());

                request.setAttribute("allTeachers", teacherDAO.getAllTeachers());
                request.setAttribute("combinedTimetable", combinedTimetable);
                request.setAttribute("selectedTeachers", selectedTeacherIds != null ? Arrays.asList(selectedTeacherIds) : new ArrayList<>());
                request.setAttribute("currentUser", user.getName());
                request.setAttribute("teacherId", teacherId);
            }

            String jspPath = "/WEB-INF/pages/teacher-dashboard.jsp";
            System.out.println("DEBUG: Final check - Forwarding to: " + jspPath);
            request.getRequestDispatcher(jspPath).forward(request, response);
        } catch (Exception e) {
            System.err.println("DEBUG: Error in TeacherDashboardServlet: " + e.getMessage());
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
                response.sendRedirect(request.getContextPath() + "/teacher-dashboard?view=announcements&success=true");
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/teacher-dashboard");
    }
}
