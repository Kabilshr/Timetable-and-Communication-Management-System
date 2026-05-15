<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Manage Announcements | Class Sync</title>
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
                <div class="section-header">
                    <h2>Post New Announcement</h2>
                </div>

                <form action="admin-dashboard" method="POST" class="add-form" style="display:block">
                    <input type="hidden" name="action" value="addAnnouncement">
                    <div class="form-group">
                        <label class="form-label">Title</label>
                        <input type="text" name="title" class="form-input" placeholder="Holiday Notice" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Content</label>
                        <textarea name="content" class="form-input" style="height: 120px; resize: vertical;" placeholder="Enter announcement details here..." required></textarea>
                    </div>
                    <button type="submit" class="btn-primary" style="width: auto; padding: 0.75rem 2rem">Post Announcement</button>
                </form>
            </div>

            <div class="admin-section">
                <div class="section-header">
                    <h2>Announcement History</h2>
                </div>
                <div class="table-responsive">
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
                                        <button type="button" class="btn-secondary" style="padding: 0.4rem 0.8rem; font-size: 0.8rem;" 
                                                onclick="openEditModal('${a.id}', `${a.title}`, `${a.content}`)">Edit</button>
                                        <form action="admin-dashboard" method="POST" style="display:inline">
                                            <input type="hidden" name="action" value="deleteAnnouncement">
                                            <input type="hidden" name="id" value="${a.id}">
                                            <button type="submit" class="btn-delete" style="padding: 0.4rem 0.8rem; font-size: 0.8rem;">Delete</button>
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
</div>

<!-- Edit Announcement Modal -->
<div id="editModal" class="modal-overlay" style="display:none;">
    <div class="modal-content">
        <div class="section-header">
            <h2>Edit Announcement</h2>
        </div>
        <form action="admin-dashboard" method="POST" class="add-form">
            <input type="hidden" name="action" value="updateAnnouncement">
            <input type="hidden" id="edit-id" name="id">
            <div class="form-group">
                <label class="form-label">Title</label>
                <input type="text" id="edit-title" name="title" class="form-input" required>
            </div>
            <div class="form-group">
                <label class="form-label">Content</label>
                <textarea id="edit-content" name="content" class="form-input" style="height: 150px; resize: vertical;" required></textarea>
            </div>
            <div style="display: flex; gap: 1rem; margin-top: 1.5rem;">
                <button type="submit" class="btn-primary" style="width: auto; padding: 0.75rem 2rem">Save Changes</button>
                <button type="button" class="btn-secondary" onclick="closeEditModal()" style="width: auto; padding: 0.75rem 2rem">Cancel</button>
            </div>
        </form>
    </div>
</div>

<script>
    function openEditModal(id, title, content) {
        document.getElementById('edit-id').value = id;
        document.getElementById('edit-title').value = title;
        document.getElementById('edit-content').value = content;
        document.getElementById('editModal').style.display = 'flex';
    }

    function closeEditModal() {
        document.getElementById('editModal').style.display = 'none';
    }

    // Close modal when clicking outside of it
    window.onclick = function(event) {
        let modal = document.getElementById('editModal');
        if (event.target == modal) {
            closeEditModal();
        }
    }
</script>

</body>
</html>
