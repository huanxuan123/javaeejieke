<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Simple Test</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            color: #333;
            padding: 20px;
        }
        h1 {
            color: #4CAF50;
        }
        .test-item {
            background: white;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .test-item a {
            color: #2196F3;
            text-decoration: none;
            font-weight: bold;
        }
        .test-item a:hover {
            text-decoration: underline;
        }
        .success {
            color: #4CAF50;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>✅ Simple Test Page</h1>
    
    <div class="test-item">
        <p>Context Path: <span class="success">${pageContext.request.contextPath}</span></p>
    </div>
    
    <div class="test-item">
        <p>Request URL: ${pageContext.request.requestURL}</p>
    </div>
    
    <div class="test-item">
        <p>Request URI: ${pageContext.request.requestURI}</p>
    </div>
    
    <div class="test-item">
        <h3>Quick Links (Try These):</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/login">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/book/list">Books</a></li>
            <li><a href="${pageContext.request.contextPath}/reader/list">Readers</a></li>
            <li><a href="${pageContext.request.contextPath}/borrow/list">Borrows</a></li>
        </ul>
    </div>
    
    <div class="test-item">
        <h3>Debug Links:</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/debug/info">Debug Info</a></li>
            <li><a href="${pageContext.request.contextPath}/debug/ping">Ping Test</a></li>
            <li><a href="${pageContext.request.contextPath}/debug/check">System Check</a></li>
            <li><a href="${pageContext.request.contextPath}/debug/routes">Route List</a></li>
        </ul>
    </div>
</body>
</html>
