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
    <style>
        /* Specific page adjustments if any */
        .btn-delete {
            color: var(--error);
            background: none;
            border: none;
            cursor: pointer;
            font-weight: 700;
        }
        .add-form {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            background: var(--surface-container-low);
            padding: 1.5rem;
            border-radius: 0.75rem;
            margin-bottom: 2rem;
            align-items: flex-end;
        }
        .admin-table {
            width: 100%;
            border-collapse: collapse;
        }
        .admin-table th {
            text-align: left;
            padding: 1rem;
            background: var(--surface-container-high);
            font-family: var(--font-headline);
            font-weight: 700;
        }
        .admin-table td {
            padding: 1rem;
            border-bottom: 1px solid var(--surface-container-high);
        }
        .admin-section {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.03);
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>

<div class="admin-layout">

    <jsp:include page="components/sidebar.jsp" />

    <div class="admin-main">

        <jsp:include page="components/topbar.jsp" />

        <div class="admin-content">
            
            <div class="section-header" style="margin-bottom: 2rem;">
                <h1>Admin Dashboard Overview</h1>
                <p class="text-secondary">System statistics at a glance</p>
            </div>

            <div class="stats-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 1.5rem; margin-bottom: 2rem;">
                <div class="stat-card" style="background: white; padding: 2rem; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0,0,0,0.03); display: flex; align-items: center; gap: 1.5rem;">
                    <div class="stat-icon" style="background: var(--primary-container); color: white; width: 60px; height: 60px; border-radius: 1rem; display: flex; align-items: center; justify-content: center;">
                        <span class="material-symbols-outlined" style="font-size: 32px">group</span>
                    </div>
                    <div>
                        <p style="font-weight: 600; color: var(--light-text); margin-bottom: 0.25rem;">Total Users</p>
                        <h2 style="font-size: 2rem; font-weight: 800; margin: 0;">${totalUsers}</h2>
                    </div>
                </div>

                <div class="stat-card" style="background: white; padding: 2rem; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0,0,0,0.03); display: flex; align-items: center; gap: 1.5rem;">
                    <div class="stat-icon" style="background: #e3f2fd; color: #1976d2; width: 60px; height: 60px; border-radius: 1rem; display: flex; align-items: center; justify-content: center;">
                        <span class="material-symbols-outlined" style="font-size: 32px">school</span>
                    </div>
                    <div>
                        <p style="font-weight: 600; color: var(--light-text); margin-bottom: 0.25rem;">Students</p>
                        <h2 style="font-size: 2rem; font-weight: 800; margin: 0;">${totalStudents}</h2>
                    </div>
                </div>

                <div class="stat-card" style="background: white; padding: 2rem; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0,0,0,0.03); display: flex; align-items: center; gap: 1.5rem;">
                    <div class="stat-icon" style="background: #f1f8e9; color: #388e3c; width: 60px; height: 60px; border-radius: 1rem; display: flex; align-items: center; justify-content: center;">
                        <span class="material-symbols-outlined" style="font-size: 32px">person</span>
                    </div>
                    <div>
                        <p style="font-weight: 600; color: var(--light-text); margin-bottom: 0.25rem;">Teachers</p>
                        <h2 style="font-size: 2rem; font-weight: 800; margin: 0;">${totalTeachers}</h2>
                    </div>
                </div>

                <div class="stat-card" style="background: white; padding: 2rem; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0,0,0,0.03); display: flex; align-items: center; gap: 1.5rem;">
                    <div class="stat-icon" style="background: #fff3e0; color: #f57c00; width: 60px; height: 60px; border-radius: 1rem; display: flex; align-items: center; justify-content: center;">
                        <span class="material-symbols-outlined" style="font-size: 32px">event_note</span>
                    </div>
                    <div>
                        <p style="font-weight: 600; color: var(--light-text); margin-bottom: 0.25rem;">Classes</p>
                        <h2 style="font-size: 2rem; font-weight: 800; margin: 0;">${totalClasses}</h2>
                    </div>
                </div>
            </div>

            <div class="admin-section">
                <div class="section-header" style="margin-bottom: 1.5rem;">
                    <h2>Quick Actions</h2>
                </div>
                <div style="display: flex; gap: 1rem;">
                    <a href="admin-dashboard?view=schedule" class="btn-primary" style="text-decoration: none; display: inline-flex; align-items: center; gap: 0.5rem;">
                        <span class="material-symbols-outlined">add</span> Manage Schedule
                    </a>
                    <a href="admin-dashboard?view=announcements" class="btn-primary" style="text-decoration: none; background: var(--secondary); display: inline-flex; align-items: center; gap: 0.5rem;">
                        <span class="material-symbols-outlined">campaign</span> Post Announcement
                    </a>
                </div>
            </div>

            <!-- User List Table -->
            <div class="admin-section">
                <div class="section-header" style="margin-bottom: 1.5rem;">
                    <h2>System Users</h2>
                    <p class="text-secondary">Overview of all registered accounts and their roles</p>
                </div>
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${users}" var="u">
                            <tr>
                                <td><strong>${u.name}</strong></td>
                                <td>${u.email}</td>
                                <td>
                                    <span class="badge" style="background: ${u.role == 'Admin' ? '#fff9c4' : (u.role == 'Teacher' ? '#e8f5e9' : '#e3f2fd')}; color: ${u.role == 'Admin' ? '#f57f17' : (u.role == 'Teacher' ? '#2e7d32' : '#1565c0')}; padding: 4px 12px; border-radius: 999px; font-size: 0.75rem; font-weight: 700;">
                                        ${u.role}
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

</body>
</html>
