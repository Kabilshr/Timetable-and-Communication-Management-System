<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Member Portal | Class Sync</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .portal-container {
            max-width: 80rem;
            margin: 2rem auto;
            padding: 0 1.5rem;
            width: 100%;
        }
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        .filter-section {
            background: white;
            padding: 1.5rem;
            border-radius: 0.75rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            align-items: flex-end;
        }
        .timetable-card {
            background: white;
            border-radius: 0.75rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th {
            background-color: var(--surface-container-high);
            text-align: left;
            padding: 1rem;
            font-family: var(--font-headline);
            font-weight: 700;
            font-size: 0.875rem;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        td {
            padding: 1rem;
            border-bottom: 1px solid var(--surface-container-high);
            font-size: 0.875rem;
        }
        tr:last-child td {
            border-bottom: none;
        }
        .btn-filter {
            padding: 0.75rem 1.5rem;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-filter:hover {
            background-color: var(--primary-container);
        }
        .logout-link {
            color: var(--error);
            font-weight: 700;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }
    </style>
</head>
<body>
<header>
    <div class="nav-container">
        <a href="portal" class="logo-wrapper">
            <div class="logo-icon">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">school</span>
            </div>
            <span class="logo-text">Class Sync</span>
        </a>
        <div style="display: flex; align-items: center; gap: 1.5rem;">
            <span class="nav-link">Welcome, <strong>${user.name}</strong> (${user.role})</span>
            <a href="logout" class="logout-link">
                <span class="material-symbols-outlined" style="font-size: 18px;">logout</span>
                Logout
            </a>
        </div>
    </div>
</header>

<main style="display: block; overflow-y: auto;">
    <div class="portal-container">
        <!-- Announcements Section -->
        <div class="portal-container" style="margin-top: 0;">
            <div class="dashboard-header">
                <h1 class="card-title" style="text-align: left; margin: 0;">Latest Announcements</h1>
            </div>
            <div class="timetable-card" style="padding: 1.5rem; background: var(--surface-container-high);">
                <c:choose>
                    <c:when test="${not empty announcements}">
                        <c:forEach items="${announcements}" var="a">
                            <div style="background: white; padding: 1.5rem; border-radius: 0.5rem; margin-bottom: 1rem; border-left: 4px solid var(--primary);">
                                <h3 style="margin-bottom: 0.5rem;">${a.title}</h3>
                                <p style="font-size: 0.9rem; color: var(--light-text); margin-bottom: 0.5rem;">${a.content}</p>
                                <small style="color: var(--outline); font-weight: 600;">Posted on: ${a.createdAt}</small>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p style="text-align: center; color: var(--outline);">No announcements at this time.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="dashboard-header">
            <h1 class="card-title" style="text-align: left; margin: 0;">Academic Timetable</h1>
        </div>

        <!-- Filters -->
        <form action="portal" method="GET" class="filter-section">
            <div class="form-group" style="margin-bottom: 0;">
                <label class="form-label" for="subject">Filter by Subject</label>
                <select name="subject" id="subject" class="form-select" style="min-width: 200px;">
                    <option value="">All Subjects</option>
                    <c:forEach items="${subjects}" var="sub">
                        <option value="${sub.subjectCode}" ${param.subject == sub.subjectCode ? 'selected' : ''}>
                            ${sub.subjectName}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group" style="margin-bottom: 0;">
                <label class="form-label" for="day">Filter by Day</label>
                <select name="day" id="day" class="form-select" style="min-width: 150px;">
                    <option value="">All Days</option>
                    <option value="Monday" ${param.day == 'Monday' ? 'selected' : ''}>Monday</option>
                    <option value="Tuesday" ${param.day == 'Tuesday' ? 'selected' : ''}>Tuesday</option>
                    <option value="Wednesday" ${param.day == 'Wednesday' ? 'selected' : ''}>Wednesday</option>
                    <option value="Thursday" ${param.day == 'Thursday' ? 'selected' : ''}>Thursday</option>
                    <option value="Friday" ${param.day == 'Friday' ? 'selected' : ''}>Friday</option>
                </select>
            </div>
            <button type="submit" class="btn-filter">Apply Filters</button>
            <a href="portal" class="nav-link" style="padding: 0.75rem; border: 1px solid var(--outline-variant);">Clear</a>
        </form>

        <!-- Timetable Table -->
        <div class="timetable-card">
            <table>
                <thead>
                    <tr>
                        <th>Day</th>
                        <th>Time</th>
                        <th>Subject</th>
                        <th>Teacher</th>
                        <th>Room</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty timetable}">
                            <c:forEach items="${timetable}" var="entry">
                                <tr>
                                    <td><strong>${entry.classDay}</strong></td>
                                    <td>${entry.classTime}</td>
                                    <td>${entry.subjectName} (${entry.subjectId})</td>
                                    <td>${entry.teacherName}</td>
                                    <td><span style="background: var(--surface-container-high); padding: 0.25rem 0.5rem; border-radius: 4px; font-weight: 600;">${entry.roomNumber}</span></td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" style="text-align: center; padding: 3rem; color: var(--outline);">
                                    No timetable entries found for the selected filters.
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</main>

<footer>
    <div class="footer-divider" style="justify-content: center;">
        <p class="copyright-small">© 2026 Class Sync. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
