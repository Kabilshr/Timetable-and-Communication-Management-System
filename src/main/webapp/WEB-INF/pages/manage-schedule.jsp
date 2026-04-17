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
        .btn-delete { color: var(--error); background: none; border: none; cursor: pointer; font-weight: 700; }
        .add-form { background: var(--surface-container-low); padding: 1.5rem; border-radius: 0.75rem; margin-bottom: 2rem; }
        .admin-table { width: 100%; border-collapse: collapse; }
        .admin-table th { text-align: left; padding: 1rem; background: var(--surface-container-high); font-family: var(--font-headline); font-weight: 700; }
        .admin-table td { padding: 1rem; border-bottom: 1px solid var(--surface-container-high); }
        .admin-section { background: white; padding: 2rem; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0,0,0,0.03); margin-bottom: 2rem; }
        
        /* Styled Select Box */
        .form-select {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1.5px solid var(--surface-container-high);
            border-radius: 0.5rem;
            font-family: inherit;
            font-size: 1rem;
            background-color: white;
            cursor: pointer;
            appearance: auto; /* Use default indicator but with our styling */
            transition: border-color 0.2s;
        }
        .form-select:focus {
            outline: none;
            border-color: var(--primary);
        }
    </style>
</head>
<body>

<div class="admin-layout">
    <jsp:include page="components/sidebar.jsp" />
    <div class="admin-main">
        <jsp:include page="components/topbar.jsp" />
        <div class="admin-content">
            
            <div class="admin-section">
                <div class="section-header" style="margin-bottom: 1.5rem;">
                    <h2>Create or Upload Schedule</h2>
                </div>

                <form action="admin-dashboard" method="POST" class="add-form">
                    <input type="hidden" name="action" value="addTimetable">
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem; align-items: flex-end;">
                        <div class="form-group" style="margin-bottom:0">
                            <label class="form-label">Teacher</label>
                            <select name="teacherId" class="form-select" required>
                                <option value="" disabled selected>Select Teacher</option>
                                <c:forEach items="${teacherUsers}" var="u">
                                    <option value="${u.userId}">${u.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group" style="margin-bottom:0">
                            <label class="form-label">Subject</label>
                            <select name="subjectId" class="form-select" required>
                                <option value="" disabled selected>Select Subject</option>
                                <c:forEach items="${subjects}" var="s">
                                    <option value="${s.subjectCode}">${s.subjectName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group" style="margin-bottom:0">
                            <label class="form-label">Day</label>
                            <select name="day" class="form-select" required>
                                <option value="" disabled selected>Select Day</option>
                                <option value="Monday">Monday</option>
                                <option value="Tuesday">Tuesday</option>
                                <option value="Wednesday">Wednesday</option>
                                <option value="Thursday">Thursday</option>
                                <option value="Friday">Friday</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin-bottom:0">
                            <label class="form-label">Time</label>
                            <input type="time" name="time" class="form-input" required>
                        </div>
                        <div class="form-group" style="margin-bottom:0">
                            <label class="form-label">Room</label>
                            <input type="text" name="room" class="form-input" placeholder="Room 101" required>
                        </div>
                    </div>
                    
                    <div style="margin-top: 1.5rem; display: flex; gap: 1rem; align-items: flex-end;">
                        <div class="form-group" style="margin-bottom:0; flex: 1;">
                            <label class="form-label">Or Upload Schedule File (Optional)</label>
                            <input type="file" name="scheduleFile" class="form-input" style="padding: 0.5rem;">
                        </div>
                        <button type="submit" class="btn-primary" style="height: 48px; padding: 0 2rem;">Add to Schedule</button>
                    </div>
                </form>
            </div>

            <div class="admin-section">
                <div class="section-header" style="margin-bottom: 1.5rem;">
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

</body>
</html>
