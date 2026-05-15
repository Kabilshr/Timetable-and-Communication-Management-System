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
    <title>Student Dashboard | Class Sync</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<%= path %>/css/style.css">
    <style>
        /* Welcome Card */
        .welcome-card { background: linear-gradient(135deg, var(--primary), var(--primary-container)); color: white; padding: 2.5rem; border-radius: 1.5rem; margin-bottom: 2rem; }
        .welcome-card h1 { font-size: 2rem; margin-bottom: 0.5rem; color: white; }
        
        /* Calendar Grid */
        .calendar-grid { display: grid; grid-template-columns: 80px repeat(6, 1fr); gap: 1px; background: #e2e8f0; border: 1px solid #e2e8f0; border-radius: 1rem; overflow: hidden; }
        .calendar-header { background: #f1f5f9; padding: 1rem; text-align: center; font-weight: 700; font-size: 0.85rem; color: #64748b; }
        .time-label { background: white; padding: 1.5rem 0.75rem; text-align: right; font-weight: 600; font-size: 0.75rem; color: #94a3b8; border-right: 1px solid #e2e8f0; }
        .calendar-cell { background: white; min-height: 100px; padding: 0.5rem; position: relative; }
        
        .class-bubble { background: #e0f2fe; color: #0369a1; padding: 0.75rem; border-radius: 0.75rem; font-size: 0.75rem; border-left: 4px solid var(--primary); }
        
        /* Today's Schedule Cards */
        .today-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 1.5rem; }
        .today-card { padding: 1.5rem; background: #f0f7ff; border-radius: 1.25rem; border-left: 6px solid var(--primary); box-shadow: 0 4px 6px rgba(0,0,0,0.02); }

        .overlap-alert { background: #fff5f5 !important; border: 2px solid #ff4d4d; }
        .overlap-badge { background: #ff4d4d; color: white; padding: 2px 8px; border-radius: 99px; font-size: 0.6rem; position: absolute; top: 5px; right: 5px; }

        .announcement-card { background: white; padding: 1.5rem; border-radius: 0.75rem; box-shadow: 0 2px 8px rgba(0,0,0,0.02); border-left: 4px solid var(--primary); margin-bottom: 1.5rem; }
        
        .availability-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1.5rem; }
        .slot-item { display: flex; align-items: center; gap: 0.5rem; padding: 0.6rem 0.8rem; background: #f8fff9; border: 1px solid #d4edda; color: #155724; border-radius: 0.5rem; font-size: 0.85rem; margin-bottom: 0.5rem; }
    </style>
</head>
<body>

<div class="admin-layout">
    <jsp:include page="components/sidebar.jsp" />

    <div class="admin-main">
        <jsp:include page="components/topbar.jsp" />

        <div class="admin-content">
            <c:choose>
                <c:when test="${view == 'dashboard'}">
                    <div style="display: grid; grid-template-columns: 1fr 320px; gap: 2rem;">
                        <div>
                            <div class="welcome-card">
                                <h1>${greeting}, ${sessionScope.user.name}!</h1>
                                <p>${todayDay}, ${todayDate} | You have ${fn:length(todayClasses)} classes today.</p>
                            </div>
                            <div class="admin-section">
                                <h2 style="font-size: 1.25rem; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;">
                                    <span class="material-symbols-outlined" style="color: var(--primary)">event_upcoming</span>
                                    Today's Schedule
                                </h2>
                                <c:choose>
                                    <c:when test="${not empty todayClasses}">
									    <div class="today-grid">
									        <c:forEach items="${todayClasses}" var="tc">
									            <div class="today-card" style="padding: 1rem; border-radius: 12px; background-color: #f9fafb; box-shadow: 0 2px 6px rgba(0,0,0,0.05); margin-bottom: 1rem;">
									                <!-- Start time -->
									                <div style="color: var(--primary); font-weight: 800; font-size: 0.9rem; margin-bottom: 0.5rem;">
									                    ${fn:substring(tc.startTime, 0, 5)}
									                </div>
									                <!-- Module title -->
									                <h3 style="font-size: 1.1rem; margin-bottom: 0.5rem;">${tc.moduleTitle}</h3>
									                <!-- Lecturer and Room info -->
									                <div style="display: flex; flex-direction: column; gap: 0.4rem;">
									                    <span style="font-size: 0.85rem; color: #64748b; display: flex; align-items: center; gap: 0.5rem;">
									                        <span class="material-symbols-outlined" style="font-size: 16px;">person</span> ${tc.lecturerName}
									                    </span>
									                    <span style="font-size: 0.85rem; color: #64748b; display: flex; align-items: center; gap: 0.5rem;">
									                        <span class="material-symbols-outlined" style="font-size: 16px;">location_on</span> Room ${tc.room}
									                    </span>
									                </div>
									            </div>
									        </c:forEach>
									    </div>
									</c:when>
                                    <c:otherwise>
                                        <div style="text-align: center; padding: 3rem; color: #94a3b8;">
                                            <span class="material-symbols-outlined" style="font-size: 48px; margin-bottom: 1rem;">event_busy</span>
                                            <p>No classes scheduled for today.</p>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div>
                            <div class="admin-section" style="padding: 1.5rem;">
                                <h3 style="font-size: 1rem; margin-bottom: 1.25rem; display: flex; align-items: center; gap: 0.5rem;">
                                    <span class="material-symbols-outlined">campaign</span> Announcements
                                </h3>
                                <c:forEach items="${announcements}" var="a">
                                    <div style="margin-bottom: 1.25rem; border-bottom: 1px solid #f1f5f9; padding-bottom: 1rem;">
                                        <h4 style="font-size: 0.9rem; margin-bottom: 4px;">${a.title}</h4>
                                        <p style="font-size: 0.8rem; color: #64748b; line-height: 1.5;">${fn:substring(a.content, 0, 80)}...</p>
                                        <span style="font-size: 0.7rem; color: #94a3b8; margin-top: 4px; display: block;">${a.createdAt}</span>
                                    </div>
                                </c:forEach>
                                <a href="student-dashboard?view=announcements" style="color: var(--primary); font-size: 0.85rem; font-weight: 700; text-decoration: none; display: block; text-align: center; margin-top: 1rem;">View All</a>
                            </div>
                        </div>
                    </div>
                </c:when>

                <c:when test="${view == 'schedule'}">
                    <div class="admin-section">
                        <h1>Full Academic Timetable</h1>
                        <c:choose>
                            <c:when test="${not empty timetable}">
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
                                                            
                                                            <c:set var="minutesFromStart" value="${startMinutes - 360}" />
                                                            <c:set var="top" value="${(minutesFromStart * 2) + 56}" />
                                                            <c:set var="height" value="${(endMinutes - startMinutes) * 2}" />
                                                            
                                                            <div class="class-block" style="top: ${top}px; height: ${height}px;">
                                                                <div class="block-module">${e.moduleTitle}</div>
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
                            </c:when>
                            <c:otherwise>
                                <p>No schedule found.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:when>

                <c:when test="${view == 'compare'}">
                    <div class="admin-section">
                        <h1>Compare Section Schedules</h1>
                        <p class="text-secondary">Select multiple sections to view their combined timetables and identify overlaps.</p>
                        
                        <!-- Filter UI -->
                        <div style="background: #f8fafc; padding: 1.5rem; border-radius: 1rem; border: 1px solid #e2e8f0; margin: 1.5rem 0;">
                            <div style="display: flex; flex-direction: column; gap: 1rem;">
							    <form id="compareForm" action="student-dashboard" method="GET" style="display: flex; flex-direction: column; gap: 1rem;">
								    <input type="hidden" name="view" value="compare">
								    <input type="hidden" name="sectionIds" id="selectedSectionIds" value="${rawSelectedIds}">
								
								    <div style="display: flex; gap: 1rem; align-items: flex-end;">
								        <div class="form-group" style="flex: 1; margin: 0;">
								            <label class="form-label">Add Section to Compare</label>
								            <!-- Remove name attribute to prevent submission -->
								            <select id="sectionSelect" class="form-select">
								                <option value="" disabled selected>Choose a section...</option>
								                <c:forEach items="${sections}" var="s">
								                    <option value="${s.sectionId}">${s.year} - ${s.sectionName}</option>
								                </c:forEach>
								            </select>
								        </div>
								        <button type="button" class="btn-primary" style="width: auto; padding: 0.75rem 1.5rem;" onclick="addSectionChip()">Add Section</button>
								    </div>
								
								    <div id="chipsContainer" style="display: flex; flex-wrap: wrap; gap: 0.5rem; min-height: 40px; padding: 0.5rem; background: white; border-radius: 0.5rem; border: 1px solid #e2e8f0;">
								        <c:forEach items="${selectedSections}" var="ss">
								            <div class="chip" data-id="${ss.sectionId}">
								                ${ss.year} - ${ss.sectionName}
								                <span class="chip-remove" onclick="removeSectionChip('${ss.sectionId}', this.parentElement)">×</span>
								            </div>
								        </c:forEach>
								    </div>
								
								    <div style="display: flex; justify-content: flex-end;">
								        <button type="submit" class="btn-primary" style="width: auto; padding: 0.75rem 2rem;">Compare Schedules</button>
								    </div>
								</form>
                        </div>

                        <style>
                            .chip { background: var(--primary); color: white; padding: 0.4rem 0.8rem; border-radius: 999px; font-size: 0.85rem; display: flex; align-items: center; gap: 0.5rem; font-weight: 600; }
                            .chip-remove { cursor: pointer; opacity: 0.7; font-size: 1.2rem; line-height: 1; }
                            .chip-remove:hover { opacity: 1; }
                            .overlap-warning { background: #fef2f2 !important; border-left-color: #ef4444 !important; color: #991b1b !important; }
                        </style>

                        <script>
						    // Initialize selectedIds from server-side value
						    let selectedIds = [];
						    const rawIds = "${rawSelectedIds}";
						    if (rawIds && rawIds.trim().length > 0) {
						        selectedIds = rawIds.split(',').filter(id => id.trim().length > 0).map(id => id.trim());
						    }
						
						    function updateHiddenInput() {
						        const hiddenInput = document.getElementById('selectedSectionIds');
						        if (hiddenInput) {
						            hiddenInput.value = selectedIds.join(',');
						        }
						    }
						
						    function addSectionChip() {
						        const select = document.getElementById('sectionSelect');
						        if (!select || select.selectedIndex < 0) {
						            return;
						        }
						
						        const option = select.options[select.selectedIndex];
						        const id = option.value;
						        const text = option.text;
						
						        if (!id || id === "" || selectedIds.includes(id.toString())) {
						            return;
						        }
						
						        selectedIds.push(id.toString());
						        updateHiddenInput();
						
						        const container = document.getElementById('chipsContainer');
						
						        // Create chip element
						        const chip = document.createElement('div');
						        chip.className = 'chip';
						        chip.setAttribute('data-id', id);
						
						        const textSpan = document.createElement('span');
						        textSpan.textContent = text;
						
						        const removeBtn = document.createElement('span');
						        removeBtn.className = 'chip-remove';
						        removeBtn.textContent = '×';
						        removeBtn.style.cursor = 'pointer';
						        removeBtn.onclick = function() { removeSectionChip(id, chip); };
						
						        chip.appendChild(textSpan);
						        chip.appendChild(removeBtn);
						        container.appendChild(chip);
						    }
						
						    function removeSectionChip(id, chipElement) {
						        selectedIds = selectedIds.filter(sid => sid !== id.toString());
						        updateHiddenInput();
						
						        if (chipElement) {
						            chipElement.remove();
						        }
						    }
						
						    // Prepopulate chips on page load
						    document.addEventListener('DOMContentLoaded', function() {
						        updateHiddenInput();
						
						        const container = document.getElementById('chipsContainer');
						        selectedIds.forEach(id => {
						            const option = document.querySelector(`#sectionSelect option[value='${id}']`);
						            if (option) {
						                const chip = document.createElement('div');
						                chip.className = 'chip';
						                chip.setAttribute('data-id', id);
						
						                const textSpan = document.createElement('span');
						                textSpan.textContent = option.text;
						
						                const removeBtn = document.createElement('span');
						                removeBtn.className = 'chip-remove';
						                removeBtn.textContent = '×';
						                removeBtn.style.cursor = 'pointer';
						                removeBtn.onclick = function() { removeSectionChip(id, chip); };
						
						                chip.appendChild(textSpan);
						                chip.appendChild(removeBtn);
						                container.appendChild(chip);
						            }
						        });
						    });
						    document.addEventListener('DOMContentLoaded', function() {
						        const container = document.getElementById('chipsContainer');
						        if (!container) return;

						        // Remove any placeholder chip that says "Choose a section..."
						        const chips = container.querySelectorAll('.chip');
						        chips.forEach(chip => {
						            const textSpan = chip.querySelector('span');
						            if (textSpan && textSpan.textContent.trim() === 'Choose a section...') {
						                chip.remove();
						            }
						        });
						    });
						</script>
                        <!-- Calendar Rendering -->
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
                                                <c:forEach items="${combinedTimetable}" var="e">
                                                    <c:if test="${e.day == day}">
                                                        <c:set var="startMinutes" value="${(e.startTime.hours * 60) + e.startTime.minutes}" />
                                                        <c:set var="endMinutes" value="${(e.endTime.hours * 60) + e.endTime.minutes}" />
                                                        <c:set var="minutesFromStart" value="${startMinutes - 360}" />
                                                        <c:set var="top" value="${(minutesFromStart * 2) + 56}" />
                                                        <c:set var="height" value="${(endMinutes - startMinutes) * 2}" />
                                                        
                                                        <%-- Define section-based colors --%>
                                                        <c:set var="colorIndex" value="${e.sectionId % 5}" />
                                                        <c:choose>
                                                            <c:when test="${colorIndex == 0}">
                                                                <c:set var="bgColor" value="#dcfce7" /><c:set var="borderColor" value="#166534" /><c:set var="textColor" value="#166534" />
                                                            </c:when>
                                                            <c:when test="${colorIndex == 1}">
                                                                <c:set var="bgColor" value="#dbeafe" /><c:set var="borderColor" value="#1e40af" /><c:set var="textColor" value="#1e40af" />
                                                            </c:when>
                                                            <c:when test="${colorIndex == 2}">
                                                                <c:set var="bgColor" value="#fef3c7" /><c:set var="borderColor" value="#92400e" /><c:set var="textColor" value="#92400e" />
                                                            </c:when>
                                                            <c:when test="${colorIndex == 3}">
                                                                <c:set var="bgColor" value="#ede9fe" /><c:set var="borderColor" value="#5b21b6" /><c:set var="textColor" value="#5b21b6" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="bgColor" value="#fce7f3" /><c:set var="borderColor" value="#9d174d" /><c:set var="textColor" value="#9d174d" />
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <%-- Check for overlaps --%>
                                                        <c:set var="isOverlap" value="false" />
                                                        <c:forEach items="${combinedTimetable}" var="e2">
                                                            <c:if test="${e2.day == day && e2.entryId != e.entryId}">
                                                                <c:set var="s2" value="${(e2.startTime.hours * 60) + e2.startTime.minutes}" />
                                                                <c:set var="n2" value="${(e2.endTime.hours * 60) + e2.endTime.minutes}" />
                                                                <c:if test="${s2 < endMinutes && n2 > startMinutes}">
                                                                    <c:set var="isOverlap" value="true" />
                                                                </c:if>
                                                            </c:if>
                                                        </c:forEach>

                                                        <div class="class-block ${isOverlap ? 'overlap-warning' : ''}" 
                                                             style="top: ${top}px; 
														       height: ${height}px; 
														       background: ${isOverlap ? '#fef2f2' : '#0f5cc0'} !important; 
														       color: ${isOverlap ? '#991b1b' : '#ffffff'} !important; 
														       border-left: 4px solid ${isOverlap ? '#ef4444' : '#0c46a0'};">
                                                            <div class="block-module">${e.moduleTitle}</div>
                                                            <div class="block-lecturer" style="font-size: 0.65rem;">Section: ${e.year} ${e.sectionName}</div>
                                                            <div class="block-time"><fmt:formatDate value="${e.startTime}" pattern="hh:mm a" /> - <fmt:formatDate value="${e.endTime}" pattern="hh:mm a" /></div>
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

                <c:when test="${view == 'profile'}">
                    <div class="admin-section" style="max-width: 600px;">
                        <div class="section-header">
                            <h1>My Profile</h1>
                            <p class="text-secondary">Update your personal information and section</p>
                        </div>

                        <c:if test="${param.success == 'true'}">
                            <div class="alert alert-success" style="padding: 1rem; background: #dcfce7; color: #166534; border-radius: 0.5rem; margin-bottom: 1.5rem;">
                                Profile updated successfully!
                            </div>
                        </c:if>
                        <c:if test="${param.error == 'true'}">
                            <div class="alert alert-danger" style="padding: 1rem; background: #fee2e2; color: #991b1b; border-radius: 0.5rem; margin-bottom: 1.5rem;">
                                Error updating profile. Please ensure inputs are valid.
                            </div>
                        </c:if>

                        <form id="profileForm" action="student-dashboard" method="POST" class="add-form" style="background: white; padding: 2rem; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0,0,0,0.05);">
                            <input type="hidden" name="action" value="updateProfile">
                            
                            <div class="form-group">
                                <label class="form-label">Full Name</label>
                                <input type="text" id="profileName" name="name" class="form-input" value="${sessionScope.user.name}" required readonly>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Email Address</label>
                                <input type="email" id="profileEmail" name="email" class="form-input" value="${sessionScope.user.email}" required disabled>
                                <small class="text-secondary" style="font-size: 0.75rem;">Email address cannot be changed.</small>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Current Section</label>
                                <select name="sectionId" class="form-select" required>
                                    <option value="" disabled ${student.sectionId == null ? 'selected' : ''}>Select your section</option>
                                    <c:forEach items="${sections}" var="sec">
                                        <option value="${sec.sectionId}" ${student.sectionId == sec.sectionId ? 'selected' : ''}>
                                            ${sec.year} - ${sec.sectionName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group" style="margin-top: 2rem; display: flex; gap: 1rem;">
                                <button type="button" id="editBtn" class="btn-secondary" style="flex: 1; padding: 1rem;" onclick="enableEditing()">Edit Profile</button>
                                <button type="submit" id="saveBtn" class="btn-primary" style="flex: 1; padding: 1rem; display: none;">Save Changes</button>
                            </div>
                        </form>
                    </div>

                    <script>
                    function enableEditing() {
                        document.getElementById('profileName').readOnly = false;
                        document.getElementById('profileName').focus();
                        
                        document.getElementById('editBtn').style.display = 'none';
                        document.getElementById('saveBtn').style.display = 'block';
                    }

                    document.getElementById('profileForm').onsubmit = function() {
                        const name = document.getElementById('profileName').value.trim();
                        // Email is disabled, browser will send current value but it's not editable. 
                        // To ensure it is sent, we can temporarily re-enable if needed or just use hidden input.
                        // For now, let's remove disabled and add readonly to email to ensure it's submitted.
                        document.getElementById('profileEmail').disabled = false;
                        
                        if (name === "") {
                            alert("Name cannot be empty");
                            return false;
                        }
                        return true;
                    };
                    </script>
                </c:when>

                <c:when test="${view == 'announcements'}">
                    <div class="admin-section">
                        <h1>University Announcements</h1>
                        <div style="margin-top: 2rem;">
                            <c:forEach items="${announcements}" var="a">
                                <div class="announcement-card">
                                    <h3 style="margin-bottom: 0.5rem;">${a.title}</h3>
                                    <div style="font-size: 0.75rem; color: #94a3b8; margin-bottom: 1rem;">Posted on: ${a.createdAt}</div>
                                    <p style="color: #64748b; font-size: 0.95rem; line-height: 1.6;">${a.content}</p>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:when>

                <c:when test="${view == 'teachers'}">
                    <div class="admin-section">
                        <h1>Teacher Availability</h1>
                        <div style="margin-top: 1.5rem;">
                            <form action="student-dashboard" method="GET" style="display: flex; gap: 1rem; align-items: flex-end;">
                                <input type="hidden" name="view" value="teachers">
                                <div class="form-group" style="flex: 1; margin: 0;">
                                    <label class="form-label">Select Teacher</label>
                                    <select name="teacherId" class="form-select" required>
                                        <option value="" disabled selected>Choose teacher...</option>
                                        <c:forEach items="${teachers}" var="t">
                                            <option value="${t.teacherId}" ${param.teacherId == t.teacherId ? 'selected' : ''}>${t.teacherName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="submit" class="btn-primary" style="width: auto;">Check Availability</button>
                            </form>
                        </div>
                    </div>

                    <c:if test="${not empty selectedTeacher}">
                        <div class="availability-grid">
                            <c:forEach items="${days}" var="day">
                                <div class="admin-section">
                                    <h3 style="color: var(--primary); margin-bottom: 1rem; border-bottom: 2px solid #f1f5f9; padding-bottom: 0.5rem; font-size: 1rem;">${day}</h3>
                                    <c:forEach items="${freeSlotsByDay[day]}" var="slot">
                                        <div class="slot-item"><span class="material-symbols-outlined" style="font-size: 16px;">check_circle</span> ${slot}</div>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </c:when>
            </c:choose>
        </div>
    </div>
</div>

</body>
</html>
