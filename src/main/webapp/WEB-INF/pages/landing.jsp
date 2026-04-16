<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Sync | Timetable Management</title>
    
    <!-- CSS Path Fix using Context Path -->
    <link rel="stylesheet" type="text/css" href="<%= path %>/css/style.css">
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;700;800&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
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

<main class="main">

<section class="hero">
    <div class="hero-text">
        <span class="badge">Smart Scheduling</span>
        <h1>
            Simplify Academic <br>
            <span class="primary">Timetables</span>
        </h1>
        <p>
            Class Sync helps institutions manage schedules efficiently with real-time updates, 
            clean dashboards, and role-based access for students, teachers, and administrators.
        </p>
        <div class="hero-buttons">
            <button class="btn-primary large" onclick="location.href='register'">Explore Platform</button>
            <button class="btn-secondary large">View Demo</button>
        </div>
    </div>
    <div class="hero-image">
        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBR8FUEFefU29UtsMzlapat5tbymOEcZPiWrmjBZYEa_oGPyNxEwXgfepize7mBi-rhetMBEEWABlbXJ2bs_Ddi0zBaRWsXSK3lBKtwzTzagmwFQglQK2cGndvcHk1Apc7-YrJJmY7cHdYi9kNSr4vdZkkmoPjR0S7ExTR6QgQKiaJPlQZbirkqO650MPIuzCQiZpttpRxyHDvNq6KknPA9EW2B44KO6IlKOvGY-vwuONnPoYgFw3eaeqw7pMZnkAy1gNPFHhGzTnPP" 
             alt="dashboard preview">
    </div>
</section>

<section class="features">
    <h2>Key Features</h2>
    <div class="feature-grid">
        <div class="card">
            <h3>Real-time Updates</h3>
            <p>Instant timetable updates across all users.</p>
        </div>
        <div class="card highlight">
            <h3>Role-based Access</h3>
            <p>Admins, teachers, and students see what matters to them.</p>
        </div>
        <div class="card">
            <h3>Easy Integration</h3>
            <p>Works with existing systems and tools.</p>
        </div>
    </div>
</section>

</main>

<footer class="footer">
    <div class="footer-divider" style="justify-content: center; border: none; padding: 2rem 0;">
        <p class="copyright-small">© 2026 Class Sync. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
