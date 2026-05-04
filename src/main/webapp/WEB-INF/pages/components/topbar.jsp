<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% String topPath = request.getContextPath(); %>
<header class="admin-topbar">
    <div class="topbar-container">
        <div class="topbar-left">
            <span class="brand-name">Class Sync</span>
        </div>

        <div class="topbar-right" style="display: flex; align-items: center; gap: 16px;">
            <div class="user-box" style="display: flex; align-items: center; gap: 8px; font-size: 0.9rem; font-weight: 600;">
                <img src="https://ui-avatars.com/api/?name=${sessionScope.user.name}&background=0059bb&color=fff" class="user-avatar" style="width: 32px; height: 32px; border-radius: 50%;">
                <span>${sessionScope.user.name} (${sessionScope.user.role})</span>
            </div>

            <button class="logout-btn" onclick="location.href='<%= topPath %>/logout'" style="background: none; border: none; cursor: pointer; color: var(--primary); display: flex; align-items: center;">
                <span class="material-symbols-outlined">logout</span>
            </button>
        </div>
    </div>
</header>
