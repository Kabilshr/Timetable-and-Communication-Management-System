<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Teacher Dashboard | Class Sync</title>
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
                                                    <div style="color: #2e7d32; font-weight: 800; font-size: 0.9rem; margin-bottom: 0.5rem;">${fn:substring(tc.startTime, 0, 5)}</div>
                                                    <h3 style="font-size: 1.1rem; margin-bottom: 0.5rem;">${tc.moduleTitle}</h3>
                                                    <div style="display: align-items: center; gap: 0.5rem; color: #64748b; font-size: 0.85rem;">
                                                        <span class="material-symbols-outlined" style="font-size: 16px;">location_on</span>
                                                        Room ${tc.room}
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
                                <div class="timetable-container">
                                    <div class="timetable-scroll">
                                        <div class="timetable-wrapper">
                                            <div class="timetable-grid">
                                                <div class="grid-time" style="height: 56px;"></div>
                                                <div class="day-header">SUN</div><div class="day-header">MON</div><div class="day-header">TUE</div><div class="day-header">WED</div><div class="day-header">THU</div><div class="day-header">FRI</div>
                                                
                                                <c:forEach begin="6" end="17" var="hour">
                                                    <div class="grid-time">${hour}:00</div>
                                                    <c:forEach begin="1" end="6"><div class="grid-cell"></div></c:forEach>
                                                </c:forEach>
                                            </div>
                                            <div class="overlay-layer">
                                                <c:set var="days" value="${fn:split('SUN,MON,TUE,WED,THU,FRI', ',')}" />
                                                <c:forEach items="${days}" var="day">
                                                    <div class="day-column">
                                                        <c:forEach items="${timetable}" var="e">
                                                            <c:if test="${e.day == day}">
                                                                <c:set var="startMinutes" value="${(e.startTime.hours * 60) + e.startTime.minutes}" />
                                                                <c:set var="endMinutes" value="${(e.endTime.hours * 60) + e.endTime.minutes}" />
                                                                
                                                                <%-- Overlap Detection --%>
                                                                <c:set var="overlapCount" value="0" />
                                                                <c:set var="colIndex" value="0" />
                                                                <c:forEach items="${timetable}" var="e2">
                                                                    <c:if test="${e2.day == day && e2.entryId != e.entryId}">
                                                                        <c:set var="s2" value="${(e2.startTime.hours * 60) + e2.startTime.minutes}" />
                                                                        <c:set var="n2" value="${(e2.endTime.hours * 60) + e2.endTime.minutes}" />
                                                                        <c:if test="${s2 < endMinutes && n2 > startMinutes}">
                                                                            <c:set var="overlapCount" value="${overlapCount + 1}" />
                                                                            <c:if test="${e2.entryId < e.entryId}">
                                                                                <c:set var="colIndex" value="${colIndex + 1}" />
                                                                            </c:if>
                                                                        </c:if>
                                                                    </c:if>
                                                                </c:forEach>
                                                                
                                                                <c:set var="width" value="${100 / (overlapCount + 1)}" />
                                                                <c:set var="left" value="${colIndex * width}" />
                                                                
                                                                <c:set var="minutesFromStart" value="${startMinutes - 360}" />
                                                                <c:set var="top" value="${(minutesFromStart * 2) + 56}" />
                                                                <c:set var="height" value="${(endMinutes - startMinutes) * 2}" />
                                                                
                                                                <%-- Step 5: Debug logs for positioning --%>
                                                                <% System.out.println("DEBUG: Class " + ((com.timetablemanagementsystem.model.TimetableEntry)pageContext.getAttribute("e")).getModuleCode() + 
                                                                    ", top=" + pageContext.getAttribute("top") + "px, height=" + pageContext.getAttribute("height") + "px, left=" + pageContext.getAttribute("left") + "%, width=" + pageContext.getAttribute("width") + "%"); %>
                                                                
                                                                <div class="class-block" style="top: ${top}px; height: ${height}px; left: ${left}%; width: calc(${width}% - 4px); margin-left: 2px;">
                                                                    <div class="block-module">${e.moduleCode}</div>
                                                                    <div class="block-lecturer">${e.lecturerName}</div>
                                                                    <div class="block-time">
                                                                        <fmt:formatDate value="${e.startTime}" pattern="hh:mm a" /> - 
                                                                        <fmt:formatDate value="${e.endTime}" pattern="hh:mm a" />
                                                                    </div>
                                                                    <div class="block-room">Room ${e.room}</div>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    </div>
                </c:when>

                <c:when test="${view == 'announcements'}">
                    <div class="admin-section">
                        <div class="section-header">
                            <h2>Post New Announcement</h2>
                        </div>
                        <form action="teacher-dashboard" method="POST" class="add-form" style="display: block; padding: 1rem; background-color: #f9fafb; border-radius: 12px; box-shadow: 0 2px 6px rgba(0,0,0,0.05); margin-bottom: 2rem;">
						    <input type="hidden" name="action" value="addAnnouncement">
						    
						    <div class="form-group" style="margin-bottom: 1rem;">
						        <label class="form-label" style="font-weight: 600; display: block; margin-bottom: 0.5rem;">Title</label>
						        <input type="text" name="title" class="form-input" placeholder="Holiday Notice" required style="width: 100%; padding: 0.5rem 0.75rem; border: 1px solid #d1d5db; border-radius: 8px; font-size: 0.95rem;">
						    </div>
						    
						    <div class="form-group" style="margin-bottom: 1rem;">
						        <label class="form-label" style="font-weight: 600; display: block; margin-bottom: 0.5rem;">Content</label>
						        <textarea name="content" class="form-input" placeholder="Enter announcement details here..." required style="width: 100%; padding: 0.5rem 0.75rem; border: 1px solid #d1d5db; border-radius: 8px; font-size: 0.95rem; height: 120px; resize: vertical;"></textarea>
						    </div>
						    
						    <button type="submit" class="btn-primary" style="padding: 0.75rem 2rem; border-radius: 8px; background-color: #0f5cc0; color: #fff; font-weight: 600; border: none; cursor: pointer;">Post Announcement</button>
						</form>
                    </div>
                        <div style="margin-top: 2rem;">
						    <div class="section-header"><h2>Past Announcements</h2></div>
						    <c:forEach items="${announcements}" var="a">
						        <div class="announcement-card" style="margin-bottom: 1.5rem; padding: 1rem; border-radius: 12px; background-color: #f9fafb; box-shadow: 0 2px 6px rgba(0,0,0,0.05);">
						            <h3 style="margin-bottom: 0.5rem; font-weight: 600; font-size: 1rem;">${a.title}</h3>
						            <div style="font-size: 0.75rem; color: #94a3b8; margin-bottom: 0.75rem;">Posted on: ${a.createdAt}</div>
						            <p style="color: #64748b; font-size: 0.95rem; line-height: 1.5;">${a.content}</p>
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
                                    <c:if test="${t.teacherId != teacherId}">
                                        <label style="display: flex; align-items: center; gap: 0.5rem; background: #f8fafc; padding: 0.5rem 1rem; border-radius: 0.5rem; border: 1px solid #e2e8f0; font-size: 0.85rem; cursor: pointer;">
                                            <input type="checkbox" name="teachers" value="${t.teacherId}" <c:forEach items="${selectedTeachers}" var="sel"><c:if test="${sel == t.teacherId}">checked</c:if></c:forEach>>
                                            ${t.teacherName}
                                        </label>
                                    </c:if>
                                </c:forEach>
                                <button type="submit" class="btn-primary" style="width: auto; background: #2e7d32;">Compare Schedules</button>
                            </form>
                        </div>
                        <div class="calendar-grid" style="display: grid; grid-template-columns: 100px repeat(6, 1fr); gap: 1px; background: #e2e8f0; border: 1px solid #e2e8f0; border-radius: 1rem; overflow: hidden;">
                            <div class="calendar-header" style="background: #f1f5f9; padding: 1rem; text-align: center; font-weight: 700; font-size: 0.85rem; color: #64748b;"></div>
                            <div class="calendar-header" style="background: #f1f5f9; padding: 1rem; text-align: center; font-weight: 700; font-size: 0.85rem; color: #64748b;">SUN</div>
                            <div class="calendar-header" style="background: #f1f5f9; padding: 1rem; text-align: center; font-weight: 700; font-size: 0.85rem; color: #64748b;">MON</div>
                            <div class="calendar-header" style="background: #f1f5f9; padding: 1rem; text-align: center; font-weight: 700; font-size: 0.85rem; color: #64748b;">TUE</div>
                            <div class="calendar-header" style="background: #f1f5f9; padding: 1rem; text-align: center; font-weight: 700; font-size: 0.85rem; color: #64748b;">WED</div>
                            <div class="calendar-header" style="background: #f1f5f9; padding: 1rem; text-align: center; font-weight: 700; font-size: 0.85rem; color: #64748b;">THU</div>
                            <div class="calendar-header" style="background: #f1f5f9; padding: 1rem; text-align: center; font-weight: 700; font-size: 0.85rem; color: #64748b;">FRI</div>
                            
                            <c:set var="days" value="${fn:split('SUN,MON,TUE,WED,THU,FRI', ',')}" />
                            <c:set var="times" value="${fn:split('08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00', ',')}" />
                            <c:forEach items="${times}" var="time">
                                <div class="time-label" style="background: white; padding: 1.5rem 0.75rem; text-align: right; font-weight: 600; font-size: 0.75rem; color: #94a3b8; border-right: 1px solid #e2e8f0;">${time}</div>
                                <c:forEach items="${days}" var="day">
                                    <c:set var="count" value="0" /><c:forEach items="${combinedEntries}" var="e"><c:if test="${e.day == day && fn:substring(e.startTime, 0, 5) == time}"><c:set var="count" value="${count + 1}" /></c:if></c:forEach>
                                    <div class="calendar-cell ${count > 1 ? 'overlap-alert' : ''}" style="background: white; min-height: 110px; padding: 0.5rem; position: relative;">
                                        <c:if test="${count > 1}"><div class="overlap-badge" style="background: #ff4d4d; color: white; padding: 2px 8px; border-radius: 99px; font-size: 0.6rem; position: absolute; top: 5px; right: 5px; z-index: 10;">OVERLAP</div></c:if>
                                        <c:forEach items="${combinedEntries}" var="e">
                                            <c:if test="${e.day == day && fn:substring(e.startTime, 0, 5) == time}">
                                                <div class="event-card ${e.lecturerId == teacherId ? 'my-event' : 'compare-event'}" style="padding: 0.5rem; border-radius: 0.5rem; font-size: 0.7rem; margin-bottom: 0.25rem; border-left: 3px solid var(--primary); background: #f0f7ff;"><strong>${e.moduleTitle}</strong><br><small>${e.lecturerName}</small></div>
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
