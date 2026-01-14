<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test Page</title>
</head>
<body>
    <h1>Library Management System - Test Page</h1>
    <p>If you can see this page, the application is running correctly!</p>
    
    <h2>Quick Links:</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/">Home Page</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/login">Admin Login</a></li>
        <li><a href="${pageContext.request.contextPath}/book/list">Book List</a></li>
        <li><a href="${pageContext.request.contextPath}/reader/list">Reader List</a></li>
        <li><a href="${pageContext.request.contextPath}/borrow/list">Borrow List</a></li>
    </ul>
    
    <h2>System Information:</h2>
    <ul>
        <li>Context Path: ${pageContext.request.contextPath}</li>
        <li>Server Info: ${pageContext.servletContext.serverInfo}</li>
    </ul>
</body>
</html>
