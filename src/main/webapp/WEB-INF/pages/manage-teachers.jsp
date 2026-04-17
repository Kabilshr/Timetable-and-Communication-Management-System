<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Manage Teachers | Class Sync</title>
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
                    <h2>Add New Teacher</h2>
                </div>

                <form action="admin-dashboard" method="POST" class="add-form">
                    <input type="hidden" name="action" value="addTeacher">
                    <div style="display: flex; gap: 1rem; align-items: flex-end; flex-wrap: wrap;">
                        <div class="form-group" style="margin-bottom:0; flex: 1; min-width: 200px;">
                            <label class="form-label">Teacher Name</label>
                            <input type="text" name="teacherName" class="form-input" placeholder="e.g. John Doe" required>
                        </div>
                        <div class="form-group" style="margin-bottom:0; flex: 1; min-width: 200px;">
                            <label class="form-label">Teacher Email</label>
                            <input type="email" name="teacherEmail" class="form-input" placeholder="e.g. john@example.com" required>
                        </div>
                        <div class="form-group" style="margin-bottom:0; flex: 1; min-width: 200px;">
                            <label class="form-label">Primary Subject</label>
                            <select name="subjectId" class="form-select" required>
                                <option value="" disabled selected>Select Subject</option>
                                <c:forEach items="${subjects}" var="s">
                                    <option value="${s.subjectCode}">${s.subjectName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn-primary" style="width: auto; padding: 0.75rem 2rem">Add Teacher</button>
                    </div>
                </form>

                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Teacher Name</th>
                            <th>Email</th>
                            <th>Subject</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${teachers}" var="t">
                            <tr>
                                <td><strong>${t.teacherName}</strong></td>
                                <td>${t.teacherEmail}</td>
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

        </div>
    </div>
</div>

</body>
</html>
