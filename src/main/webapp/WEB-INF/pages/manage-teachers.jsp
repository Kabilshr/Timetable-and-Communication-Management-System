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
</head>
<body>

<div class="admin-layout">
    <jsp:include page="components/sidebar.jsp" />

    <div class="admin-main">
        <jsp:include page="components/topbar.jsp" />

        <div class="admin-content">
            <div class="admin-section">
                <div class="section-header" style="margin-bottom: 1.5rem;">
                    <h2>Manage Teachers</h2>
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
                        <button type="submit" class="btn-primary" style="width: auto; padding: 0.75rem 2rem">Add Teacher</button>
                    </div>
                </form>

                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Teacher Name</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${teachers}" var="t">
                            <tr>
                                <td><strong>${t.teacherName}</strong></td>
                                <td>${t.teacherEmail}</td>
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
