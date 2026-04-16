package com.timetablemanagementsystem.controllers;

import com.timetablemanagementsystem.dao.*;
import com.timetablemanagementsystem.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Time;
import java.util.List;

@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private SubjectDAO subjectDAO = new SubjectDAO();
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
            if (!"Admin".equals(user.getRole())) {
                response.sendRedirect("portal");
                return;
            }

            // Fetch all data for the dashboard
            List<Subject> subjects = subjectDAO.getAllSubjects();
            List<Teacher> teachers = teacherDAO.getAllTeachers();
            List<TimetableEntry> timetable = timetableDAO.getTimetable(null, null);
            List<User> teacherUsers = userDAO.getUsersByRole("Teacher");
            List<Announcement> announcements = announcementDAO.getAllAnnouncements();
            
            request.setAttribute("subjects", subjects);
            request.setAttribute("teachers", teachers);
            request.setAttribute("timetable", timetable);
            request.setAttribute("teacherUsers", teacherUsers);
            request.setAttribute("announcements", announcements);
            request.setAttribute("user", user);

            request.getRequestDispatcher("/WEB-INF/pages/admin-dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("Admin Dashboard Error: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("admin-dashboard");
            return;
        }

        switch (action) {
            case "addSubject":
                String code = request.getParameter("code");
                String name = request.getParameter("name");
                subjectDAO.addSubject(new Subject(code, name));
                break;
            case "deleteSubject":
                subjectDAO.deleteSubject(request.getParameter("code"));
                break;
            case "addTeacher":
                Teacher teacher = new Teacher();
                teacher.setUserId(Integer.parseInt(request.getParameter("userId")));
                teacher.setSubjectId(request.getParameter("subjectId"));
                teacherDAO.addTeacher(teacher);
                break;
            case "deleteTeacher":
                teacherDAO.deleteTeacher(Integer.parseInt(request.getParameter("id")));
                break;
            case "addTimetable":
                TimetableEntry entry = new TimetableEntry();
                entry.setSubjectId(request.getParameter("subjectId"));
                entry.setTeacherId(Integer.parseInt(request.getParameter("teacherId")));
                entry.setClassTime(Time.valueOf(request.getParameter("time") + ":00"));
                entry.setClassDay(request.getParameter("day"));
                entry.setRoomNumber(request.getParameter("room"));
                timetableDAO.addEntry(entry);
                break;
            case "deleteTimetable":
                timetableDAO.deleteEntry(Integer.parseInt(request.getParameter("id")));
                break;
            case "addAnnouncement":
                announcementDAO.addAnnouncement(request.getParameter("title"), request.getParameter("content"));
                break;
            case "deleteAnnouncement":
                announcementDAO.deleteAnnouncement(Integer.parseInt(request.getParameter("id")));
                break;
        }
        response.sendRedirect("admin-dashboard");
    }
}
