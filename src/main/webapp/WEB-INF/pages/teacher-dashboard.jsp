<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Teacher Dashboard | Class Sync</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<%= path %>/css/style.css">
    <style>
        /* Calendar Grid */
        .calendar-grid { display: grid; grid-template-columns: 80px repeat(6, 1fr); gap: 1px; background: #e2e8f0; border: 1px solid #e2e8f0; border-radius: 1rem; overflow: hidden; }
        .calendar-header { background: #f1f5f9; padding: 1rem; text-align: center; font-weight: 700; font-size: 0.85rem; color: #64748b; }
        .time-label { background: white; padding: 1.5rem 0.75rem; text-align: right; font-weight: 600; font-size: 0.75rem; color: #94a3b8; border-right: 1px solid #e2e8f0; }
        .calendar-cell { background: white; min-height: 110px; padding: 0.5rem; position: relative; }
        
        .class-bubble { background: #f1f8e9; color: #2e7d32; padding: 0.75rem; border-radius: 0.75rem; font-size: 0.75rem; border-left: 4px solid #4caf50; }
        
        /* Today's Schedule Cards */
        .today-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 1.5rem; }
        .today-card { padding: 1.5rem; background: #f1f8e9; border-radius: 1.25rem; border-left: 6px solid #4caf50; box-shadow: 0 4px 6px rgba(0,0,0,0.02); }

        .overlap-alert { background: #fff5f5 !important; border: 2px solid #ff4d4d; }
        .overlap-badge { background: #ff4d4d; color: white; padding: 2px 8px; border-radius: 99px; font-size: 0.6rem; position: absolute; top: 5px; right: 5px; z-index: 10; }
        .event-card { padding: 0.5rem; border-radius: 0.5rem; font-size: 0.7rem; margin-bottom: 0.25rem; border-left: 3px solid var(--primary); background: #f0f7ff; }
        .my-event { border-left-color: #4caf50; background: #f1f8e9; }
    </style>
</head>
<body>

<div class="admin-layout">
    <jsp:include page="components/sidebar.jsp" />

    <div class="admin-main">
        <jsp:include page="components/topbar.jsp" />

        <div class="admin-content">
            <c:choose>
                <%-- MAIN DASHBOARD VIEW --%>
                <c:when test="${view == 'dashboard'}">
                    <div style="display: grid; grid-template-columns: 1fr 320px; gap: 2rem;">
                        <div>
                            <div class="admin-section" style="background: linear-gradient(135deg, #2e7d32, #4caf50); color: white; padding: 2.5rem; border-radius: 1.5rem;">
                                <h1 style="font-size: 2rem; margin-bottom: 0.5rem; color: white;">Welcome, Prof. ${sessionScope.user.name}</h1>
                                <p>You have ${fn:length(todayClasses)} lectures scheduled for today (${todayDay}).</p>
                            </div>
                            <div class="admin-section">
                                <h2 style="font-size: 1.25rem; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;">
                                    <span class="material-symbols-outlined" style="color: #2e7d32">history_edu</span>
                                    Today's Lectures
                                </h2>
                                <c:choose>
                                    <c:when test="${not empty todayClasses}">
                                        <div class="today-grid">
                                            <c:forEach items="${todayClasses}" var="tc">
                                                <div class="today-card">
                                                    <div style="color: #2e7d32; font-weight: 800; font-size: 0.9rem; margin-bottom: 0.5rem;">${fn:substring(tc.classTime, 0, 5)}</div>
                                                    <h3 style="font-size: 1.1rem; margin-bottom: 0.5rem;">${tc.subjectName}</h3>
                                                    <div style="display: flex; align-items: center; gap: 0.5rem; color: #64748b; font-size: 0.85rem;">
                                                        <span class="material-symbols-outlined" style="font-size: 16px;">location_on</span>
                                                        Room ${tc.roomNumber}
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="text-align: center; padding: 3rem; color: #94a3b8;">
                                            <span class="material-symbols-outlined" style="font-size: 48px; margin-bottom: 1rem;">event_available</span>
                                            <p>No lectures scheduled for today.</p>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div>
                            <div class="admin-section" style="padding: 1.5rem;">
                                <h3 style="font-size: 1rem; margin-bottom: 1.25rem; display: flex; align-items: center; gap: 0.5rem;">
                                    <span class="material-symbols-outlined">campaign</span> Recent Updates
                                </h3>
                                <c:forEach items="${announcements}" var="a">
                                    <div style="margin-bottom: 1.25rem; border-bottom: 1px solid #f1f5f9; padding-bottom: 1rem;">
                                        <h4 style="font-size: 0.9rem; margin-bottom: 4px;">${a.title}</h4>
                                        <p style="font-size: 0.8rem; color: #64748b; line-height: 1.5;">${fn:substring(a.content, 0, 80)}...</p>
                                        <span style="font-size: 0.7rem; color: #94a3b8; margin-top: 4px; display: block;">${a.createdAt}</span>
                                    </div>
                                </c:forEach>
                                <a href="teacher-dashboard?view=announcements" style="color: #2e7d32; font-size: 0.85rem; font-weight: 700; text-decoration: none; display: block; text-align: center; margin-top: 1rem;">Manage All</a>
                            </div>
                        </div>
                    </div>
                </c:when>

                <c:when test="${view == 'schedule'}">
                    <div class="admin-section">
                        <h1>Personal Teaching Timetable</h1>
                        <div class="calendar-grid" style="margin-top: 2rem; grid-template-columns: 100px repeat(6, 1fr);">
                            <div class="calendar-header" style="background: transparent;"></div>
                            <div class="calendar-header">Sunday</div><div class="calendar-header">Monday</div><div class="calendar-header">Tuesday</div><div class="calendar-header">Wednesday</div><div class="calendar-header">Thursday</div><div class="calendar-header">Friday</div>
                            <c:set var="days" value="${fn:split('Sunday,Monday,Tuesday,Wednesday,Thursday,Friday', ',')}" />
                            <c:set var="times" value="${fn:split('08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00', ',')}" />
                            <c:forEach items="${times}" var="time">
                                <div class="time-label">${time}</div>
                                <c:forEach items="${days}" var="day">
                                    <div class="calendar-cell" style="min-height: 120px;">
                                        <c:forEach items="${timetable}" var="entry">
                                            <c:if test="${entry.classDay == day && fn:substring(entry.classTime, 0, 5) == time}">
                                                <div class="class-bubble"><strong>${entry.subjectName}</strong><span>Room ${entry.roomNumber}</span></div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </c:forEach>
                        </div>
                    </div>
                </c:when>

                <c:when test="${view == 'announcements'}">
                    <div class="admin-section">
                        <h1>Manage Announcements</h1>
                        <div style="margin-top: 1.5rem;">
                            <h3 style="margin-bottom: 1rem;">Post New Announcement</h3>
                            <form action="teacher-dashboard" method="POST">
                                <input type="hidden" name="action" value="addAnnouncement">
                                <div class="form-group"><label class="form-label">Title</label><input type="text" name="title" class="form-input" required></div>
                                <div class="form-group"><label class="form-label">Content</label><textarea name="content" class="form-input" style="min-height: 100px;" required></textarea></div>
                                <button type="submit" class="btn-primary" style="width: auto; padding: 0.75rem 2rem; background: #2e7d32;">Post Announcement</button>
                            </form>
                        </div>
                    </div>
                    <div style="margin-top: 2rem;">
                        <c:forEach items="${announcements}" var="a">
                            <div class="admin-section" style="border-left: 5px solid #2e7d32;">
                                <h3 style="margin-bottom: 0.5rem;">${a.title}</h3>
                                <small style="color: #94a3b8; display: block; margin-bottom: 1rem;">${a.createdAt}</small>
                                <p style="color: #64748b;">${a.content}</p>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>

                <c:when test="${view == 'collaboration'}">
                    <div class="admin-section">
                        <h1>Teacher Collaboration</h1>
                        <div style="margin: 1.5rem 0;">
                            <form action="teacher-dashboard" method="GET" style="display: flex; flex-wrap: wrap; gap: 1rem;">
                                <input type="hidden" name="view" value="collaboration">
                                <c:forEach items="${allTeachers}" var="t">
                                    <c:if test="${t.teacherName != currentUser}">
                                        <label style="display: flex; align-items: center; gap: 0.5rem; background: #f8fafc; padding: 0.5rem 1rem; border-radius: 0.5rem; border: 1px solid #e2e8f0; font-size: 0.85rem; cursor: pointer;">
                                            <input type="checkbox" name="teachers" value="${t.teacherName}" <c:forEach items="${selectedTeachers}" var="sel"><c:if test="${sel == t.teacherName}">checked</c:if></c:forEach>>
                                            ${t.teacherName}
                                        </label>
                                    </c:if>
                                </c:forEach>
                                <button type="submit" class="btn-primary" style="width: auto; background: #2e7d32;">Compare Schedules</button>
                            </form>
                        </div>
                        <div class="calendar-grid" style="grid-template-columns: 100px repeat(6, 1fr);">
                            <div class="calendar-header" style="background: transparent;"></div>
                            <div class="calendar-header">Sun</div><div class="calendar-header">Mon</div><div class="calendar-header">Tue</div><div class="calendar-header">Wed</div><div class="calendar-header">Thu</div><div class="calendar-header">Fri</div>
                            <c:set var="days" value="${fn:split('Sunday,Monday,Tuesday,Wednesday,Thursday,Friday', ',')}" />
                            <c:set var="times" value="${fn:split('08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00', ',')}" />
                            <c:forEach items="${times}" var="time">
                                <div class="time-label">${time}</div>
                                <c:forEach items="${days}" var="day">
                                    <c:set var="count" value="0" /><c:forEach items="${combinedTimetable}" var="e"><c:if test="${e.classDay == day && fn:substring(e.classTime, 0, 5) == time}"><c:set var="count" value="${count + 1}" /></c:if></c:forEach>
                                    <div class="calendar-cell ${count > 1 ? 'overlap-alert' : ''}" style="min-height: 120px;">
                                        <c:if test="${count > 1}"><div class="overlap-badge">OVERLAP</div></c:if>
                                        <c:forEach items="${combinedTimetable}" var="e">
                                            <c:if test="${e.classDay == day && fn:substring(e.classTime, 0, 5) == time}">
                                                <div class="event-card ${e.teacherName == currentUser ? 'my-event' : ''}"><strong>${e.subjectName}</strong><br><small>${e.teacherName}</small></div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </c:forEach>
                        </div>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>
</div>

</body>
</html>
