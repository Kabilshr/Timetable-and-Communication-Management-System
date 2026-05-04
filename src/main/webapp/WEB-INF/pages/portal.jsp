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
</head>
<body>

<div class="admin-layout">
    <jsp:include page="components/sidebar.jsp" />

    <div class="admin-main">
        <jsp:include page="components/topbar.jsp" />

        <div class="admin-content">
            <div class="section-header">
                <h1>Academic Timetable</h1>
                <p class="text-secondary">View your classes and announcements</p>
            </div>

            <!-- Announcements -->
            <div class="admin-section">
                <h2>Latest Announcements</h2>
                <c:choose>
                    <c:when test="${not empty announcements}">
                        <c:forEach items="${announcements}" var="a">
                            <div style="background: var(--surface-container-low); padding: 1.5rem; border-radius: 0.5rem; margin-bottom: 1rem; border-left: 4px solid var(--primary);">
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

            <!-- Timetable Table -->
            <div class="admin-section">
                <h2>Your Schedule</h2>
                <table class="admin-table">
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
                                        <td>${entry.subjectName}</td>
                                        <td>${entry.teacherName}</td>
                                        <td><span style="background: var(--surface-container-high); padding: 0.25rem 0.5rem; border-radius: 4px; font-weight: 600;">${entry.roomNumber}</span></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" style="text-align: center; padding: 3rem; color: var(--outline);">
                                        No timetable entries found.
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
