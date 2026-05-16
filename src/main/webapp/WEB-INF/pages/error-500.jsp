<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" isELIgnored="false"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 - Internal Server Error | Class Sync</title>
    <link rel="stylesheet" type="text/css" href="<%= path %>/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;700;800&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
</head>
<body>

<% 
    // Log the error to server logs
    if (exception != null) {
        System.err.println("--- 500 ERROR LOG ---");
        System.err.println("Message: " + exception.getMessage());
        exception.printStackTrace();
        System.err.println("----------------------");
    } else {
        System.err.println("500 Error occurred, but no exception object was found.");
    }
%>

<header class="navbar">
    <div class="nav-container">
        <a href="<%= path %>/" class="logo-wrapper" style="text-decoration: none; color: inherit;">
            <div class="logo-icon">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">school</span>
            </div>
            <span class="logo-text">Class Sync</span>
        </a>
    </div>
</header>

<main class="main">
    <div class="error-page-container">
        <div class="error-code">500</div>
        <h1 class="error-message">Internal Server Error.</h1>
        <p class="error-description">
            Something went wrong on our end. We are working on fixing it. Please try again later.
        </p>
        <div class="error-actions">
            <a href="<%= path %>/" class="btn-primary">Back to Home</a>
        </div>
    </div>
</main>

<footer class="footer">
    <div class="footer-divider" style="justify-content: center; border: none; padding: 2rem 0;">
        <p class="copyright-small">© 2026 Class Sync. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
