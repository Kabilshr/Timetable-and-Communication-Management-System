<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% String sidePath = request.getContextPath(); %>
<aside class="admin-sidebar">
    <div class="sidebar-title">
        <c:choose>
            <c:when test="${sessionScope.user.role == 'Admin'}">Admin Panel</c:when>
            <c:when test="${sessionScope.user.role == 'Teacher'}">Teacher Portal</c:when>
            <c:when test="${sessionScope.user.role == 'Student'}">Student Portal</c:when>
            <c:otherwise>Menu</c:otherwise>
        </c:choose>
    </div>

    <nav class="sidebar-nav">
        <c:if test="${sessionScope.user.role == 'Admin'}">
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
        </c:if>

        <c:if test="${sessionScope.user.role == 'Student'}">
            <a href="<%= sidePath %>/student-dashboard?view=dashboard" class="sidebar-link ${param.view == 'dashboard' || param.view == null ? 'active' : ''}">
                <span class="material-symbols-outlined">dashboard</span>
                <span>Dashboard</span>
            </a>
            <a href="<%= sidePath %>/student-dashboard?view=schedule" class="sidebar-link ${param.view == 'schedule' ? 'active' : ''}">
                <span class="material-symbols-outlined">calendar_month</span>
                <span>Full Schedule</span>
            </a>
            <a href="<%= sidePath %>/student-dashboard?view=compare" class="sidebar-link ${param.view == 'compare' ? 'active' : ''}">
                <span class="material-symbols-outlined">compare_arrows</span>
                <span>Compare</span>
            </a>
            <a href="<%= sidePath %>/student-dashboard?view=announcements" class="sidebar-link ${param.view == 'announcements' ? 'active' : ''}">
                <span class="material-symbols-outlined">campaign</span>
                <span>Announcements</span>
            </a>
            <a href="<%= sidePath %>/student-dashboard?view=teachers" class="sidebar-link ${param.view == 'teachers' ? 'active' : ''}">
                <span class="material-symbols-outlined">person_search</span>
                <span>Teachers</span>
            </a>
        </c:if>

        <c:if test="${sessionScope.user.role == 'Teacher'}">
            <a href="<%= sidePath %>/teacher-dashboard?view=dashboard" class="sidebar-link ${param.view == 'dashboard' || param.view == null ? 'active' : ''}">
                <span class="material-symbols-outlined">dashboard</span>
                <span>Dashboard</span>
            </a>
            <a href="<%= sidePath %>/teacher-dashboard?view=schedule" class="sidebar-link ${param.view == 'schedule' ? 'active' : ''}">
                <span class="material-symbols-outlined">calendar_today</span>
                <span>My Schedule</span>
            </a>
            <a href="<%= sidePath %>/teacher-dashboard?view=announcements" class="sidebar-link ${param.view == 'announcements' ? 'active' : ''}">
                <span class="material-symbols-outlined">campaign</span>
                <span>Announcements</span>
            </a>
            <a href="<%= sidePath %>/teacher-dashboard?view=collaboration" class="sidebar-link ${param.view == 'collaboration' ? 'active' : ''}">
                <span class="material-symbols-outlined">groups</span>
                <span>Collaboration</span>
            </a>
        </c:if>
    </nav>
</aside>
