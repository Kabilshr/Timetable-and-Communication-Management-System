package com.timetablemanagementsystem.controllers;

import com.timetablemanagementsystem.dao.UserDAO;
import com.timetablemanagementsystem.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read cookies for Remember Me
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userEmail".equals(cookie.getName())) {
                    request.setAttribute("rememberedEmail", cookie.getValue());
                    break;
                }
            }
        }
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        User user = userDAO.login(email, password);

        if (user != null) {
            // Create Session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Handle Cookies for Remember Me
            if ("on".equals(remember)) {
                Cookie emailCookie = new Cookie("userEmail", email);
                emailCookie.setMaxAge(60 * 60 * 24 * 7); // 7 days
                response.addCookie(emailCookie);
            } else {
                // Clear existing cookie if not checked
                Cookie emailCookie = new Cookie("userEmail", "");
                emailCookie.setMaxAge(0);
                response.addCookie(emailCookie);
            }

            // Redirect based on role
            if ("Admin".equals(user.getRole())) {
                response.sendRedirect("admin-dashboard");
            } else {
                response.sendRedirect("portal");
            }
        } else {
            request.setAttribute("error", "Invalid email or password!");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
}
