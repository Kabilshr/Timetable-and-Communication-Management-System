package com.timetablemanagementsystem.controllers;

import com.timetablemanagementsystem.dao.*;
import com.timetablemanagementsystem.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/portal")
public class PortalServlet extends HttpServlet {
    private TimetableDAO timetableDAO = new TimetableDAO();
    private SubjectDAO subjectDAO = new SubjectDAO();
    private AnnouncementDAO announcementDAO = new AnnouncementDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String subjectCode = request.getParameter("subject");
        String day = request.getParameter("day");

        List<TimetableEntry> timetable = timetableDAO.getTimetable(subjectCode, day);
        List<Subject> subjects = subjectDAO.getAllSubjects();
        List<Announcement> announcements = announcementDAO.getAllAnnouncements();

        request.setAttribute("timetable", timetable);
        request.setAttribute("subjects", subjects);
        request.setAttribute("announcements", announcements);
        request.setAttribute("user", user);

        request.getRequestDispatcher("/WEB-INF/pages/portal.jsp").forward(request, response);
    }
}
