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
    private ModuleDAO moduleDAO = new ModuleDAO();
    private StudentDAO studentDAO = new StudentDAO();
    private SectionDAO sectionDAO = new SectionDAO();
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String role = user.getRole();
        if (!"Student".equalsIgnoreCase(role)) {
            response.sendRedirect(request.getContextPath() + "/portal");
            return;
        }

        String view = request.getParameter("view");
        if (view == null) view = "dashboard";
        request.setAttribute("view", view);

        // Date and Greeting Logic
        LocalDate now = LocalDate.now();
        String dayOfWeek = now.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH);
        String shortDay = now.getDayOfWeek().name().substring(0, 3); // SUN, MON, etc.
        
        int hour = java.time.LocalTime.now().getHour();
        String greeting = (hour < 12) ? "Good Morning" : (hour < 18) ? "Good Afternoon" : "Good Evening";

        request.setAttribute("todayDay", dayOfWeek);
        request.setAttribute("todayDate", now.format(java.time.format.DateTimeFormatter.ofPattern("MMMM d, yyyy")));
        request.setAttribute("greeting", greeting);

        try {
            if ("dashboard".equals(view)) {
                Student student = studentDAO.getStudentByUserId(user.getUserId());
                List<TimetableEntry> timetable = (student != null) ? timetableDAO.getTimetable(null, student.getSectionId(), shortDay) : new ArrayList<>();
                List<Announcement> announcements = announcementDAO.getAllAnnouncements();
                
                request.setAttribute("todayClasses", timetable);
                request.setAttribute("announcements", announcements.size() > 3 ? announcements.subList(0, 3) : announcements);
                request.setAttribute("student", student);

            } else if ("schedule".equals(view)) {
                Student student = studentDAO.getStudentByUserId(user.getUserId());
                System.out.println("DEBUG: Schedule view for User ID: " + user.getUserId() + ", Student Object: " + student);
                if (student != null) {
                    System.out.println("DEBUG: Fetching timetable for Section ID: " + student.getSectionId());
                    List<TimetableEntry> timetable = timetableDAO.getTimetable(null, student.getSectionId(), null);
                    System.out.println("DEBUG: Found " + timetable.size() + " timetable entries.");
                    request.setAttribute("timetable", timetable);
                } else {
                    request.setAttribute("timetable", new ArrayList<>());
                    System.out.println("DEBUG: No student record found, timetable is empty.");
                }

            } else if ("profile".equals(view)) {
                request.setAttribute("student", studentDAO.getStudentByUserId(user.getUserId()));
                request.setAttribute("sections", sectionDAO.getAllSections());

            } else if ("announcements".equals(view)) {
                request.setAttribute("announcements", announcementDAO.getAllAnnouncements());
            }
            
            request.getRequestDispatcher("/WEB-INF/pages/student-dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");

        if ("updateProfile".equals(action)) {
            System.out.println("DEBUG: Profile update request received for user ID: " + user.getUserId());
            try {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String sectionIdStr = request.getParameter("sectionId");

                System.out.println("DEBUG: Received parameters - Name: " + name + ", Email: " + email + ", SectionID: " + sectionIdStr);

                if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty() || sectionIdStr == null) {
                    System.out.println("DEBUG: Validation failed - Missing fields");
                    response.sendRedirect("student-dashboard?view=profile&error=true&msg=MissingFields");
                    return;
                }

                int sectionId = Integer.parseInt(sectionIdStr);

                // Update user object (name and email)
                user.setName(name.trim());
                user.setEmail(email.trim());

                System.out.println("DEBUG: Attempting to update User table...");
                boolean userUpdated = userDAO.updateProfile(user);
                System.out.println("DEBUG: User table update result: " + userUpdated);

                System.out.println("DEBUG: Attempting to update Student table (section)...");
                boolean studentUpdated = studentDAO.updateStudentSection(user.getUserId(), sectionId);
                System.out.println("DEBUG: Student table update result: " + studentUpdated);

                if (userUpdated && studentUpdated) {
                    System.out.println("DEBUG: Both updates successful. Synchronizing session...");
                    session.setAttribute("user", user);
                    response.sendRedirect("student-dashboard?view=profile&success=true");
                } else {
                    System.err.println("DEBUG ERROR: Profile Update Partial/Full Failure. User=" + userUpdated + ", Student=" + studentUpdated);
                    response.sendRedirect("student-dashboard?view=profile&error=true");
                }
            } catch (Exception e) {
                System.err.println("DEBUG CRITICAL ERROR in StudentDashboardServlet.doPost: " + e.getMessage());
                e.printStackTrace();
                response.sendRedirect("student-dashboard?view=profile&error=true");
            }
        }
    }
}
