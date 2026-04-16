<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Register | Class Sync</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%= path %>/css/style.css">
</head>
<body>

<header class="navbar">
    <div class="nav-container">
        <a href="<%= path %>/" class="logo-wrapper" style="text-decoration: none; color: inherit;">
            <div class="logo-icon">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">school</span>
            </div>
            <span class="logo-text">Class Sync</span>
        </a>
        <div class="nav-actions">
            <button class="btn-text" onclick="location.href='<%= path %>/login'">Login</button>
            <button class="btn-primary" onclick="location.href='<%= path %>/register'">Register</button>
        </div>
    </div>
</header>

<main>
    <!-- Abstract Shapes for UI Depth -->
    <div class="shape-1"></div>
    <div class="shape-2"></div>

    <div class="glass-card">
        <div class="text-center" style="margin-bottom: 2.5rem; text-align: center;">
            <h1 class="card-title">Create your account</h1>
            <p class="card-subtitle">Join the next generation of academic management.</p>
        </div>

        <%-- Error Message Display --%>
        <% if(request.getAttribute("error") != null) { %>
            <div class="error-block">
                <span class="material-symbols-outlined" style="font-size: 20px;">error</span>
                <div>
                    <p class="error-title">Error</p>
                    <p class="error-desc"><%= request.getAttribute("error") %></p>
                </div>
            </div>
        <% } %>

        <form action="register" method="POST">
            <div class="form-group">
                <label class="form-label" for="name">Full Name</label>
                <input class="form-input" id="name" name="name" placeholder="Professor Jane Doe" type="text" required/>
            </div>

            <div class="form-group">
                <label class="form-label" for="email">Institutional Email</label>
                <input class="form-input" id="email" name="email" placeholder="j.doe@university.edu" type="email" required/>
            </div>

            <div class="form-group">
                <label class="form-label" for="role">Role Selection</label>
                <div class="input-wrapper">
                    <select class="form-select" id="role" name="role" required>
                        <option disabled selected value="">Select your role</option>
                        <option value="Teacher">Teacher</option>
                        <option value="Student">Student</option>
                    </select>
                    <div class="select-icon">
                        <span class="material-symbols-outlined">expand_more</span>
                    </div>
                </div>
            </div>

            <div class="form-grid two-cols">
                <div class="form-group">
                    <label class="form-label" for="password">Password</label>
                    <input class="form-input" id="password" name="password" placeholder="••••••••" type="password" required/>
                </div>
                <div class="form-group">
                    <label class="form-label" for="confirm_password">Confirm Password</label>
                    <input class="form-input" id="confirm_password" name="confirm_password" placeholder="••••••••" type="password" required/>
                </div>
            </div>

            <div class="pt-4" style="margin-top: 1rem;">
                <button class="btn-primary" type="submit">
                    Create Account
                </button>
            </div>

            <div class="text-center pt-4" style="text-align: center; margin-top: 1rem;">
                <p class="auth-link">
                    Already have an account? 
                    <a href="login">Log in here</a>
                </p>
            </div>
        </form>
    </div>
</main>

<footer class="footer">
    <div class="footer-divider" style="justify-content: center; border: none; padding: 2rem 0;">
        <p class="copyright-small">© 2026 Class Sync. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
