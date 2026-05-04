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
                List<Subject> subjects = subjectDAO.getAllSubjects();
                List<TimetableEntry> timetable = timetableDAO.getTimetable(null, null);
                List<Teacher> teachers = teacherDAO.getAllTeachers();
                
                request.setAttribute("subjects", subjects);
                request.setAttribute("timetable", timetable);
                request.setAttribute("teachers", teachers);
                request.getRequestDispatcher("/WEB-INF/pages/manage-schedule.jsp").forward(request, response);
            } else if ("teachers".equals(view)) {
                List<Subject> subjects = subjectDAO.getAllSubjects();
                List<Teacher> teachers = teacherDAO.getAllTeachers();
                
                request.setAttribute("subjects", subjects);
                request.setAttribute("teachers", teachers);
                request.getRequestDispatcher("/WEB-INF/pages/manage-teachers.jsp").forward(request, response);
            } else if ("announcements".equals(view)) {
                List<Announcement> announcements = announcementDAO.getAllAnnouncements();
                request.setAttribute("announcements", announcements);
                request.getRequestDispatcher("/WEB-INF/pages/manage-announcements.jsp").forward(request, response);
            } else if ("subjects".equals(view)) {
                List<Subject> subjects = subjectDAO.getAllSubjects();
                request.setAttribute("subjects", subjects);
                request.getRequestDispatcher("/WEB-INF/pages/manage-subjects.jsp").forward(request, response);
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
            case "addSubject":
                String code = request.getParameter("code");
                String name = request.getParameter("name");
                subjectDAO.addSubject(new Subject(code, name));
                redirectView = "subjects";
                break;
            case "deleteSubject":
                subjectDAO.deleteSubject(request.getParameter("code"));
                redirectView = "subjects";
                break;
            case "addTeacher":
                Teacher teacher = new Teacher();
                teacher.setTeacherName(request.getParameter("teacherName"));
                teacher.setTeacherEmail(request.getParameter("teacherEmail"));
                teacher.setSubjectId(request.getParameter("subjectId"));
                teacherDAO.addTeacher(teacher);
                redirectView = "teachers";
                break;
            case "deleteTeacher":
                teacherDAO.deleteTeacher(Integer.parseInt(request.getParameter("id")));
                redirectView = "teachers";
                break;
            case "addTimetable":
                TimetableEntry entry = new TimetableEntry();
                entry.setSubjectId(request.getParameter("subjectId"));
                entry.setClassTime(Time.valueOf(request.getParameter("time") + ":00"));
                entry.setClassDay(request.getParameter("day"));
                entry.setRoomNumber(request.getParameter("room"));

                String teacherIdStr = request.getParameter("teacherId");
                if (teacherIdStr != null && !teacherIdStr.equals("manual")) {
                    int tId = Integer.parseInt(teacherIdStr);
                    // Fetch name from teachers list
                    List<Teacher> allT = teacherDAO.getAllTeachers();
                    for(Teacher t : allT) {
                        if(t.getTeacherId() == tId) {
                            entry.setTeacherName(t.getTeacherName());
                            break;
                        }
                    }
                } else {
                    // Manual entry
                    String manualName = request.getParameter("manualTeacherName");
                    String manualEmail = request.getParameter("manualTeacherEmail");
                    entry.setTeacherName(manualName);
                    
                    // Check if exists in teachers table
                    Teacher existing = teacherDAO.getTeacherByName(manualName);
                    if (existing == null) {
                        Teacher newT = new Teacher();
                        newT.setTeacherName(manualName);
                        newT.setTeacherEmail(manualEmail);
                        newT.setSubjectId(entry.getSubjectId());
                        teacherDAO.addTeacher(newT);
                    }
                }
                
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
