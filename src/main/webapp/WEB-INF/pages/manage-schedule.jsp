<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Manage Schedule | Class Sync</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<%= path %>/css/style.css">
    <style>
        .manual-input-row { display: none; margin-top: 1rem; gap: 0.75rem; flex-wrap: wrap; }
    </style>
</head>
<body>

<div class="admin-layout">
    <jsp:include page="components/sidebar.jsp" />

    <div class="admin-main">
        <jsp:include page="components/topbar.jsp" />

        <div class="admin-content">
            <div class="admin-section" style="padding: 1.5rem;">
                <div class="section-header">
                    <h2>Create or Upload Schedule</h2>
                </div>

                <form action="admin-dashboard" method="POST" class="add-form" style="padding: 0; background: none; margin-bottom: 0;">
                    <input type="hidden" name="action" value="addTimetable">
                    
                    <div style="display: flex; flex-wrap: wrap; gap: 0.75rem; align-items: flex-end; margin-bottom: 1.25rem;">
                        <div class="form-group" style="margin: 0; flex: 1; min-width: 160px;">
                            <label class="form-label" style="font-size: 0.7rem;">Teacher</label>
                            <select name="teacherId" id="teacherSelect" class="form-select" onchange="toggleManualInput(this.value)" required>
                                <option value="" disabled selected>Select Teacher</option>
                                <c:forEach items="${teachers}" var="t">
                                    <option value="${t.teacherId}">${t.teacherName}</option>
                                </c:forEach>
                                <option value="manual" style="font-weight: bold; color: var(--primary);">+ Manual Entry</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin: 0; flex: 1; min-width: 140px;">
                            <label class="form-label" style="font-size: 0.7rem;">Subject</label>
                            <select name="subjectId" class="form-select" required>
                                <option value="" disabled selected>Subject</option>
                                <c:forEach items="${subjects}" var="s">
                                    <option value="${s.subjectCode}">${s.subjectName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group" style="margin: 0; flex: 1; min-width: 120px;">
                            <label class="form-label" style="font-size: 0.7rem;">Day</label>
                            <select name="day" class="form-select" required>
                                <option value="" disabled selected>Day</option>
                                <option value="Monday">Monday</option>
                                <option value="Tuesday">Tuesday</option>
                                <option value="Wednesday">Wednesday</option>
                                <option value="Thursday">Thursday</option>
                                <option value="Friday">Friday</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin: 0; width: 110px;">
                            <label class="form-label" style="font-size: 0.7rem;">Time</label>
                            <input type="time" name="time" class="form-input" style="padding: 0.5rem 0.75rem; font-size: 0.85rem;" required>
                        </div>
                        <div class="form-group" style="margin: 0; width: 90px;">
                            <label class="form-label" style="font-size: 0.7rem;">Room</label>
                            <input type="text" name="room" class="form-input" style="padding: 0.5rem 0.75rem; font-size: 0.85rem;" placeholder="101" required>
                        </div>
                    </div>

                    <div id="manualTeacherFields" class="manual-input-row">
                        <div class="form-group" style="flex: 1; min-width: 200px;">
                            <label class="form-label" style="font-size: 0.7rem;">New Teacher Name</label>
                            <input type="text" name="manualTeacherName" class="form-input" placeholder="Enter name">
                        </div>
                        <div class="form-group" style="flex: 1; min-width: 200px;">
                            <label class="form-label" style="font-size: 0.7rem;">New Teacher Email</label>
                            <input type="email" name="manualTeacherEmail" class="form-input" placeholder="Enter email">
                        </div>
                    </div>
                    
                    <div style="margin-top: 1rem; display: flex; flex-wrap: wrap; gap: 1rem; align-items: flex-end;">
                        <div class="form-group" style="margin: 0; flex: 1; min-width: 250px;">
                            <label class="form-label" style="font-size: 0.7rem;">Or Bulk Upload (CSV/Excel)</label>
                            <input type="file" name="scheduleFile" class="form-input" style="padding: 0.35rem 0.5rem; font-size: 0.8rem; background: var(--surface-container-high);">
                        </div>
                        <button type="submit" class="btn-primary" style="height: auto; padding: 0.6rem 2.5rem; border-radius: 0.5rem; font-size: 0.9rem; margin-bottom: 2px;">Add to Schedule</button>
                    </div>
                </form>
            </div>

            <div class="admin-section">
                <div class="section-header">
                    <h2>Current Timetable</h2>
                </div>
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Day</th>
                            <th>Time</th>
                            <th>Subject</th>
                            <th>Teacher</th>
                            <th>Room</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${timetable}" var="e">
                            <tr>
                                <td>${e.classDay}</td>
                                <td>${e.classTime}</td>
                                <td>${e.subjectName}</td>
                                <td>${e.teacherName}</td>
                                <td>${e.roomNumber}</td>
                                <td>
                                    <form action="admin-dashboard" method="POST" style="display:inline">
                                        <input type="hidden" name="action" value="deleteTimetable">
                                        <input type="hidden" name="id" value="${e.entryId}">
                                        <button type="submit" class="btn-delete">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
function toggleManualInput(val) {
    const manualFields = document.getElementById('manualTeacherFields');
    const nameInput = manualFields.querySelector('input[name="manualTeacherName"]');
    const emailInput = manualFields.querySelector('input[name="manualTeacherEmail"]');
    
    if (val === 'manual') {
        manualFields.style.display = 'flex';
        nameInput.required = true;
    } else {
        manualFields.style.display = 'none';
        nameInput.required = false;
    }
}
</script>

</body>
</html>
