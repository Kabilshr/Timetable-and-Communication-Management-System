package com.timetablemanagementsystem.controllers;

import com.timetablemanagementsystem.dao.UserDAO;
import com.timetablemanagementsystem.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    // In-memory lockout tracking
    private static final Map<String, LoginAttempt> lockoutMap = new ConcurrentHashMap<>();
    private static final int MAX_ATTEMPTS = 3;
    private static final long LOCKOUT_DURATION = 30 * 1000; // 30 seconds

    private static class LoginAttempt {
        int attempts;
        long lastAttemptTime;

        LoginAttempt(int attempts, long lastAttemptTime) {
            this.attempts = attempts;
            this.lastAttemptTime = lastAttemptTime;
        }
    }

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

        System.out.println("DEBUG: Login attempt received for email: " + email);

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Email is required!");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            return;
        }

        // Check Lockout
        LoginAttempt attempt = lockoutMap.get(email);
        long currentTime = System.currentTimeMillis();

            if (attempt != null && attempt.attempts >= MAX_ATTEMPTS) {
                long timeSinceLastAttempt = currentTime - attempt.lastAttemptTime;
                if (timeSinceLastAttempt < LOCKOUT_DURATION) {
                    long remainingSeconds = (LOCKOUT_DURATION - timeSinceLastAttempt) / 1000;
                    System.out.println("DEBUG: User " + email + " is locked. Remaining: " + remainingSeconds + "s");
                    request.setAttribute("error", "Account locked. Try again in <span id='countdown'>" + remainingSeconds + "</span> seconds.");
                    request.setAttribute("remainingSeconds", remainingSeconds);
                    request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                    return;
                } else {
                System.out.println("DEBUG: User " + email + " lockout expired. Unlocking.");
                // Optionally reset here or just let it fall through
            }
        }

        User user = userDAO.login(email, password);

        if (user != null) {
            System.out.println("DEBUG: Successful login for user: " + email);
            lockoutMap.remove(email); // Reset on success

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
            String role = user.getRole();
            String redirectPath = "";
            if ("Admin".equalsIgnoreCase(role)) {
                redirectPath = request.getContextPath() + "/admin-dashboard";
            } else if ("Student".equalsIgnoreCase(role)) {
                redirectPath = request.getContextPath() + "/student-dashboard";
            } else if ("Teacher".equalsIgnoreCase(role)) {
                redirectPath = request.getContextPath() + "/teacher-dashboard";
            } else {
                redirectPath = request.getContextPath() + "/portal";
            }
            System.out.println("DEBUG: Redirecting to: " + redirectPath);
            response.sendRedirect(redirectPath);
        } else {
            System.out.println("DEBUG: Failed login attempt for user: " + email);
            
            // Increment failed attempts
            if (attempt == null || (currentTime - attempt.lastAttemptTime > LOCKOUT_DURATION)) {
                lockoutMap.put(email, new LoginAttempt(1, currentTime));
            } else {
                attempt.attempts++;
                attempt.lastAttemptTime = currentTime;
                System.out.println("DEBUG: Failed attempts for " + email + ": " + attempt.attempts);
            }

            request.setAttribute("error", "Invalid email or password!");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
}