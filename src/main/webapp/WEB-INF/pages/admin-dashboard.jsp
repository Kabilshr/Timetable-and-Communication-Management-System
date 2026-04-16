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
            
            <!-- Subject Management -->
            <div class="admin-section" id="subjects">
                <div class="section-header" style="margin-bottom: 1.5rem;">
                    <h2>Manage Subjects</h2>
                </div>
                
                <form action="admin-dashboard" method="POST" class="add-form">
                    <input type="hidden" name="action" value="addSubject">
                    <div class="form-group" style="margin-bottom:0">
                        <label class="form-label">Code</label>
                        <input type="text" name="code" class="form-input" style="width: 100px" placeholder="CS101" required>
                    </div>
                    <div class="form-group" style="margin-bottom:0">
                        <label class="form-label">Name</label>
                        <input type="text" name="name" class="form-input" placeholder="Introduction to Java" required>
                    </div>
                    <button type="submit" class="btn-primary" style="width: auto; padding: 0.75rem 1.5rem">Add</button>
                </form>

                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Code</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${subjects}" var="s">
                            <tr>
                                <td><strong>${s.subjectCode}</strong></td>
                                <td>${s.subjectName}</td>
                                <td>
                                    <form action="admin-dashboard" method="POST" style="display:inline">
                                        <input type="hidden" name="action" value="deleteSubject">
                                        <input type="hidden" name="code" value="${s.subjectCode}">
                                        <button type="submit" class="btn-delete">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Teacher Management -->
            <div class="admin-section" id="teachers">
                <div class="section-header" style="margin-bottom: 1.5rem;">
                    <h2>Manage Teachers</h2>
                </div>

                <form action="admin-dashboard" method="POST" class="add-form">
                    <input type="hidden" name="action" value="addTeacher">
                    <div class="form-group" style="margin-bottom:0">
                        <label class="form-label">User</label>
                        <select name="userId" class="form-select" required>
                            <c:forEach items="${teacherUsers}" var="u">
                                <option value="${u.userId}">${u.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group" style="margin-bottom:0">
                        <label class="form-label">Subject</label>
                        <select name="subjectId" class="form-select" required>
                            <c:forEach items="${subjects}" var="s">
                                <option value="${s.subjectCode}">${s.subjectName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn-primary" style="width: auto; padding: 0.75rem 1.5rem">Assign</button>
                </form>

                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Teacher Name</th>
                            <th>Subject</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${teachers}" var="t">
                            <tr>
                                <td>${t.teacherName}</td>
                                <td>${t.subjectId}</td>
                                <td>
                                    <form action="admin-dashboard" method="POST" style="display:inline">
                                        <input type="hidden" name="action" value="deleteTeacher">
                                        <input type="hidden" name="id" value="${t.teacherId}">
                                        <button type="submit" class="btn-delete">Remove</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Timetable Management -->
            <div class="admin-section" id="timetable">
                <div class="section-header" style="margin-bottom: 1.5rem;">
                    <h2>Manage Timetable</h2>
                </div>

                <form action="admin-dashboard" method="POST" class="add-form">
                    <input type="hidden" name="action" value="addTimetable">
                    <div class="form-group" style="margin-bottom:0">
                        <label class="form-label">Subject</label>
                        <select name="subjectId" class="form-select" required>
                            <c:forEach items="${subjects}" var="s">
                                <option value="${s.subjectCode}">${s.subjectCode}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group" style="margin-bottom:0">
                        <label class="form-label">Teacher</label>
                        <select name="teacherId" class="form-select" required>
                            <c:forEach items="${teachers}" var="t">
                                <option value="${t.teacherId}">${t.teacherName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group" style="margin-bottom:0">
                        <label class="form-label">Day</label>
                        <select name="day" class="form-select" required>
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
                        <input type="text" name="room" class="form-input" style="width: 80px" placeholder="101" required>
                    </div>
                    <button type="submit" class="btn-primary" style="width: auto; padding: 0.75rem 1.5rem">Add</button>
                </form>

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

            <!-- Announcement Management -->
            <div class="admin-section" id="announcements">
                <div class="section-header" style="margin-bottom: 1.5rem;">
                    <h2>Manage Announcements</h2>
                </div>

                <form action="admin-dashboard" method="POST" class="add-form" style="display:block">
                    <input type="hidden" name="action" value="addAnnouncement">
                    <div class="form-group">
                        <label class="form-label">Title</label>
                        <input type="text" name="title" class="form-input" placeholder="Holiday Notice" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Content</label>
                        <textarea name="content" class="form-input" style="height: 80px; resize: vertical;" placeholder="Details..." required></textarea>
                    </div>
                    <button type="submit" class="btn-primary" style="width: auto; padding: 0.75rem 1.5rem">Post</button>
                </form>

                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Title</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${announcements}" var="a">
                            <tr>
                                <td>${a.createdAt}</td>
                                <td><strong>${a.title}</strong></td>
                                <td>
                                    <form action="admin-dashboard" method="POST" style="display:inline">
                                        <input type="hidden" name="action" value="deleteAnnouncement">
                                        <input type="hidden" name="id" value="${a.id}">
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
