package com.timetablemanagementsystem.controllers;

import com.timetablemanagementsystem.dao.*;
import com.timetablemanagementsystem.model.*;
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect("login");
                return;
            }
            User user = (User) session.getAttribute("user");
            String role = user.getRole();
            if (!"Admin".equalsIgnoreCase(role)) {
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

            if ("dashboard".equals(view)) {
                request.setAttribute("totalUsers", userDAO.getUserCount());
                request.setAttribute("totalStudents", userDAO.getCountByRole("Student"));
                request.setAttribute("totalTeachers", userDAO.getCountByRole("Teacher"));
                request.setAttribute("totalClasses", timetableDAO.getClassCount());
                request.setAttribute("users", userDAO.getAllUsers());
                request.getRequestDispatcher("/WEB-INF/pages/admin-dashboard.jsp").forward(request, response);
            } else if ("schedule".equals(view)) {
                List<TimetableEntry> timetable = timetableDAO.getTimetable();
                List<Teacher> teachers = teacherDAO.getAllTeachers();
                
                request.setAttribute("timetable", timetable);
                request.setAttribute("teachers", teachers);
                request.getRequestDispatcher("/WEB-INF/pages/manage-schedule.jsp").forward(request, response);
            } else if ("teachers".equals(view)) {
                List<Teacher> teachers = teacherDAO.getAllTeachers();
                
                request.setAttribute("teachers", teachers);
                request.getRequestDispatcher("/WEB-INF/pages/manage-teachers.jsp").forward(request, response);
            } else if ("announcements".equals(view)) {
                List<Announcement> announcements = announcementDAO.getAllAnnouncements();
                request.setAttribute("announcements", announcements);
                request.getRequestDispatcher("/WEB-INF/pages/manage-announcements.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.err.println("Admin Dashboard Error: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String redirectView = "dashboard";
        
        if (action == null) {
            response.sendRedirect("admin-dashboard");
            return;
        }

        switch (action) {
            case "addTeacher":
                Teacher teacher = new Teacher();
                teacher.setTeacherName(request.getParameter("teacherName"));
                teacher.setTeacherEmail(request.getParameter("teacherEmail"));
                teacherDAO.addTeacher(teacher);
                redirectView = "teachers";
                break;
            case "deleteTeacher":
                teacherDAO.deleteTeacher(Integer.parseInt(request.getParameter("id")));
                redirectView = "teachers";
                break;
            case "addTimetable":
                TimetableEntry entry = new TimetableEntry();
                entry.setYear(request.getParameter("year"));
                entry.setSection(request.getParameter("section"));
                entry.setModuleCode(request.getParameter("moduleCode"));
                entry.setModuleTitle(request.getParameter("moduleTitle"));
                entry.setClassType(request.getParameter("classType"));
                entry.setLecturer(request.getParameter("lecturer"));
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
            case "deleteAnnouncement":
                announcementDAO.deleteAnnouncement(Integer.parseInt(request.getParameter("id")));
                redirectView = "announcements";
                break;
        }
        response.sendRedirect("admin-dashboard?view=" + redirectView);
    }
}
