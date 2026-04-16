<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Login | Class Sync</title>
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    
    <!-- CSS Path Fix using Context Path -->
    <link rel="stylesheet" type="text/css" href="<%= path %>/css/style.css">
</head>
<body>
<main class="main-container">
    <!-- Background Artistic Elements -->
    <div class="bg-art-layer">
        <div class="blob-1"></div>
        <div class="blob-2"></div>
    </div>
    
    <div class="login-wrapper">
        <!-- Brand Header -->
        <div class="brand-header">
            <div class="brand-logo-box">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1; font-size: 32px;">school</span>
            </div>
            <h1 class="brand-name">Class Sync</h1>
            <p class="brand-motto">Institutional Timetable Management</p>
        </div>

        <!-- Login Card -->
        <div class="login-card">
            <div class="intent-header">
                <h2>Welcome back</h2>
                <p>Please enter your institutional credentials.</p>
            </div>

            <%-- Success Message for Registration --%>
            <% if(request.getParameter("registered") != null) { %>
            <div class="alert-box alert-success">
                <span class="material-symbols-outlined" style="font-size: 20px;">check_circle</span>
                <div>
                    <p class="alert-title">Success</p>
                    <p>Registration successful! Please log in.</p>
                </div>
            </div>
            <% } %>

            <%-- Error Message Handling --%>
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
                <!-- Field: Email -->
                <div>
                    <label class="field-label" for="email">Username or Email</label>
                    <div class="input-rel">
                        <span class="material-symbols-outlined input-icon-left">person</span>
                        <input class="field-input" id="email" name="email" 
                               placeholder="e.g. j.smith@classsync.edu" type="email" 
                               value="${rememberedEmail != null ? rememberedEmail : ''}" required/>
                    </div>
                </div>

                <!-- Field: Password -->
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

                <!-- Remember Me -->
                <div class="checkbox-group">
                    <input type="checkbox" id="remember" name="remember" ${rememberedEmail != null ? 'checked' : ''}>
                    <label for="remember">Remember Me</label>
                </div>

                <!-- Action Button -->
                <div class="submit-area">
                    <button class="btn-gradient" type="submit">
                        Login
                        <span class="material-symbols-outlined" style="font-size: 18px;">arrow_forward</span>
                    </button>
                </div>
            </form>

            <!-- Card Footer -->
            <div class="alt-action">
                <p>
                    Don't have an account? <a class="register-link" href="register">Register here</a>
                </p>
            </div>
        </div>
    </div>
</main>

<footer class="page-footer">
    <p class="copyright-text">© 2026 Class Sync. All rights reserved.</p>
</footer>
</body>
</html>
