<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String topPath = request.getContextPath(); %>
<header class="admin-topbar">
    <div class="topbar-left">
        <span class="brand-name">Class Sync</span>
    </div>

    <div class="topbar-right">
        <div class="user-box">
            <img src="https://ui-avatars.com/api/?name=Admin+Portal&background=0059bb&color=fff" class="user-avatar">
            <span class="user-role">Admin Portal</span>
        </div>

        <button class="logout-btn" onclick="location.href='<%= topPath %>/logout'">
            <span class="material-symbols-outlined">logout</span>
        </button>
    </div>
</header>
