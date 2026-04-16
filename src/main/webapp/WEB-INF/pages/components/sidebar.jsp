<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String sidePath = request.getContextPath(); %>
<aside class="admin-sidebar">
    <div class="sidebar-title">
        Academic Management
    </div>

    <nav class="sidebar-nav">

        <a href="<%= sidePath %>/admin-dashboard" class="sidebar-link active">
            <span class="material-symbols-outlined">calendar_today</span>
            <span>Schedule</span>
        </a>

        <a href="<%= sidePath %>/admin-dashboard" class="sidebar-link">
            <span class="material-symbols-outlined">edit_calendar</span>
            <span>Manage Timetable</span>
        </a>

        <a href="<%= sidePath %>/admin-dashboard" class="sidebar-link">
            <span class="material-symbols-outlined">school</span>
            <span>Teachers</span>
        </a>

        <a href="<%= sidePath %>/admin-dashboard" class="sidebar-link">
            <span class="material-symbols-outlined">campaign</span>
            <span>Announcements</span>
        </a>

    </nav>

    <div class="sidebar-status">
        <div class="status-header">
            <span>Server Status</span>
            <span class="status-dot"></span>
        </div>

        <div class="status-bar">
            <div class="status-fill"></div>
        </div>

        <p class="status-text">Operational: 99.9% uptime</p>
    </div>
</aside>
