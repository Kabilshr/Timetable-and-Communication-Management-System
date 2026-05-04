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
            <c:if test="${not empty param.success}">
                <div class="alert alert-success" style="margin-bottom: 1rem; padding: 1rem; background: #d4edda; color: #155724; border-radius: 0.5rem;">
                    Upload successful! ${param.success} entries added, ${param.failed} failed, ${param.duplicates} duplicates skipped.
                    <c:if test="${not empty param.lastError}">
                        <br><small>Last Error: ${param.lastError}</small>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${not empty param.error}">
                <div class="alert alert-danger" style="margin-bottom: 1rem; padding: 1rem; background: #f8d7da; color: #721c24; border-radius: 0.5rem;">
                    Error: ${param.error}
                </div>
            </c:if>

            <div class="admin-section" style="padding: 1.5rem;">
                <div class="section-header">
                    <h2>Manual Entry</h2>
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
                        <div class="form-group" style="margin: 0; width: 80px;">
                            <label class="form-label" style="font-size: 0.7rem;">Section</label>
                            <input type="text" name="section" class="form-input" style="padding: 0.5rem 0.75rem; font-size: 0.85rem;" placeholder="A">
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
                        <div class="form-group" style="margin: 0; width: 100px;">
                            <label class="form-label" style="font-size: 0.7rem;">Start Time</label>
                            <input type="time" name="startTime" class="form-input" style="padding: 0.5rem 0.75rem; font-size: 0.85rem;" required>
                        </div>
                        <div class="form-group" style="margin: 0; width: 100px;">
                            <label class="form-label" style="font-size: 0.7rem;">End Time</label>
                            <input type="time" name="endTime" class="form-input" style="padding: 0.5rem 0.75rem; font-size: 0.85rem;" required>
                        </div>
                        <div class="form-group" style="margin: 0; width: 80px;">
                            <label class="form-label" style="font-size: 0.7rem;">Room</label>
                            <input type="text" name="room" class="form-input" style="padding: 0.5rem 0.75rem; font-size: 0.85rem;" placeholder="101" required>
                        </div>
                        <button type="submit" class="btn-primary" style="height: auto; padding: 0.6rem 1.5rem; border-radius: 0.5rem; font-size: 0.9rem; margin-bottom: 2px;">Add</button>
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
                </form>

                <hr style="margin: 2rem 0; border: 0; border-top: 1px solid var(--outline-variant);">

                <div class="section-header">
                    <h2>Bulk Upload (JSON)</h2>
                </div>
                <form action="<%= path %>/upload-schedule" method="POST" enctype="multipart/form-data" style="display: flex; gap: 1rem; align-items: flex-end;">
                    <div class="form-group" style="margin: 0; flex: 1;">
                        <label class="form-label" style="font-size: 0.7rem;">Select JSON File</label>
                        <input type="file" name="file" class="form-input" accept=".json" required>
                    </div>
                    <button type="submit" class="btn-primary" style="padding: 0.6rem 2rem;">Upload Schedule</button>
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
                            <th>Time Range</th>
                            <th>Subject</th>
                            <th>Section</th>
                            <th>Instructor</th>
                            <th>Room</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${timetable}" var="e">
                            <tr>
                                <td>${e.classDay}</td>
                                <td>${e.startTime} - ${e.endTime}</td>
                                <td>${e.subjectName}</td>
                                <td>${e.section}</td>
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
