<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Admin Dashboard | Class Sync</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<%= path %>/css/style.css">
</head>
<body>

<div class="admin-layout">
    <jsp:include page="components/sidebar.jsp" />

    <div class="admin-main">
        <jsp:include page="components/topbar.jsp" />

        <div class="admin-content">
            <c:set var="view" value="${param.view == null ? 'dashboard' : param.view}" />
            
            <c:choose>
                <c:when test="${view == 'dashboard'}">
                    <div class="section-header">
                        <h1>System Overview</h1>
                        <p class="text-secondary">Track institutional growth and user activity</p>
                    </div>

                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-icon" style="background: #e7f3ff; color: var(--primary);">
                                <span class="material-symbols-outlined">group</span>
                            </div>
                            <div class="stat-info">
                                <p>Total Users</p>
                                <h2>${totalUsers}</h2>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon" style="background: #fdf2e9; color: #f39c12;">
                                <span class="material-symbols-outlined">school</span>
                            </div>
                            <div class="stat-info">
                                <p>Students</p>
                                <h2>${totalStudents}</h2>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon" style="background: #eafaf1; color: #2ecc71;">
                                <span class="material-symbols-outlined">person_book</span>
                            </div>
                            <div class="stat-info">
                                <p>Teachers</p>
                                <h2>${totalTeachers}</h2>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon" style="background: #f5eef8; color: #9b59b6;">
                                <span class="material-symbols-outlined">calendar_month</span>
                            </div>
                            <div class="stat-info">
                                <p>Classes</p>
                                <h2>${totalClasses}</h2>
                            </div>
                        </div>
                    </div>

                    <div class="admin-section">
                        <div class="section-header">
                            <h2>User Management</h2>
                            <button class="btn-primary" style="width: auto; padding: 0.6rem 1.2rem;" onclick="alert('Use registration page to add users')">Add New User</button>
                        </div>
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>User ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${users}" var="u">
                                    <tr>
                                        <td>#${u.userId}</td>
                                        <td style="font-weight: 700;">${u.name}</td>
                                        <td>${u.email}</td>
                                        <td>
                                            <span class="badge" style="background: ${u.role == 'Admin' ? '#fee2e2' : (u.role == 'Teacher' ? '#dcfce7' : '#e0f2fe')}; color: ${u.role == 'Admin' ? '#991b1b' : (u.role == 'Teacher' ? '#166534' : '#0369a1')}">
                                                ${u.role}
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <jsp:include page="manage-${view}.jsp" />
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

</body>
</html>
