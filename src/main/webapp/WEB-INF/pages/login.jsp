<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Login | Class Sync</title>
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
    <!-- Background Artistic Elements -->
    <div class="bg-art-layer">
        <div class="blob-1"></div>
        <div class="blob-2"></div>
    </div>
    
    <div class="login-wrapper">
        <!-- Brand Header -->
        <div class="brand-header">
            <h1 class="brand-name">Class Sync</h1>
            <p class="brand-motto">Institutional Timetable Management</p>
        </div>

        <!-- Login Card -->
        <div class="login-card">
            <div class="intent-header">
                <h2>Welcome back</h2>
                <p>Please enter your institutional credentials.</p>
            </div>

            <%-- Success Message --%>
            <% if(request.getParameter("registered") != null) { %>
            <div class="alert-box alert-success">
                <span class="material-symbols-outlined" style="font-size: 20px;">check_circle</span>
                <div>
                    <p class="alert-title">Success</p>
                    <p>Registration successful! Please log in.</p>
                </div>
            </div>
            <% } %>

            <%-- Error Message --%>
            <% if(request.getAttribute("error") != null) { %>
            <div class="alert-box alert-error">
                <span class="material-symbols-outlined" style="font-size: 20px;">error</span>
                <div>
                    <p class="alert-title">Access Denied</p>
                    <p><%= request.getAttribute("error") %></p>
                </div>
            </div>
            <% } %>

            <form action="login" method="POST" class="form-stack">
                <div>
                    <label class="field-label" for="email">Username or Email</label>
                    <div class="input-rel">
                        <span class="material-symbols-outlined input-icon-left">person</span>
                        <input class="field-input" id="email" name="email" 
                               placeholder="e.g. j.smith@classsync.edu" type="email" 
                               value="${rememberedEmail != null ? rememberedEmail : ''}" required/>
                    </div>
                </div>

                <div>
                    <div class="pass-header">
                        <label class="field-label" for="password">Password</label>
                        <a class="forgot-link" href="#">Forgot Password?</a>
                    </div>
                    <div class="input-rel">
                        <span class="material-symbols-outlined input-icon-left">lock</span>
                        <input class="field-input" id="password" name="password" 
                               placeholder="••••••••" type="password" required/>
                    </div>
                </div>

                <div class="checkbox-group">
                    <input type="checkbox" id="remember" name="remember" ${rememberedEmail != null ? 'checked' : ''}>
                    <label for="remember">Remember Me</label>
                </div>

                <div class="submit-area">
                    <button class="btn-gradient" type="submit">
                        Login
                    </button>
                </div>
            </form>

            <div class="alt-action">
                <p>
                    Don't have an account? <a class="register-link" href="register">Register here</a>
                </p>
            </div>
        </div>
    </div>
</main>

<footer class="footer">
    <div class="footer-divider" style="justify-content: center; border: none; padding: 2rem 0;">
        <p class="copyright-small">© 2026 Class Sync. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
