<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String sidePath = request.getContextPath(); %>
<aside class="admin-sidebar">
    <div class="sidebar-title">
        Academic Management
    </div>

    <nav class="sidebar-nav">

        <a href="<%= sidePath %>/admin-dashboard?view=dashboard" class="sidebar-link ${param.view == 'dashboard' || param.view == null ? 'active' : ''}">
            <span class="material-symbols-outlined">dashboard</span>
            <span>Dashboard</span>
        </a>

        <a href="<%= sidePath %>/admin-dashboard?view=schedule" class="sidebar-link ${param.view == 'schedule' ? 'active' : ''}">
            <span class="material-symbols-outlined">calendar_today</span>
            <span>Schedule</span>
        </a>

        <a href="<%= sidePath %>/admin-dashboard?view=teachers" class="sidebar-link ${param.view == 'teachers' ? 'active' : ''}">
            <span class="material-symbols-outlined">school</span>
            <span>Teachers</span>
        </a>

        <a href="<%= sidePath %>/admin-dashboard?view=subjects" class="sidebar-link ${param.view == 'subjects' ? 'active' : ''}">
            <span class="material-symbols-outlined">menu_book</span>
            <span>Subjects</span>
        </a>

        <a href="<%= sidePath %>/admin-dashboard?view=announcements" class="sidebar-link ${param.view == 'announcements' ? 'active' : ''}">
            <span class="material-symbols-outlined">campaign</span>
            <span>Announcements</span>
        </a>

    </nav>
</aside>
