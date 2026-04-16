package com.timetablemanagementsystem.controllers;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        // We don't necessarily clear the 'userEmail' cookie here 
        // as that's for 'Remember Me' on the NEXT login.
        response.sendRedirect("login");
    }
}
