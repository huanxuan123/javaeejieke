<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>System Diagnostic</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .info-box {
            background: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .info-box h2 {
            color: #667eea;
            margin-top: 0;
        }
        .info-item {
            margin: 10px 0;
            padding: 10px;
            background: #f8f9fa;
            border-left: 4px solid #667eea;
        }
        .info-item strong {
            color: #333;
        }
        .links {
            margin-top: 20px;
        }
        .links a {
            display: block;
            padding: 10px 15px;
            margin: 5px 0;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .links a:hover {
            background: #764ba2;
        }
        .warning {
            background: #fff3cd;
            border-left-color: #ffc107;
        }
        .success {
            background: #d4edda;
            border-left-color: #28a745;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔍 System Diagnostic Page</h1>
        
        <div class="info-box">
            <h2>📊 System Information</h2>
            <div class="info-item">
                <strong>Context Path:</strong> ${pageContext.request.contextPath}
            </div>
            <div class="info-item">
                <strong>Request URI:</strong> ${pageContext.request.requestURI}
            </div>
            <div class="info-item">
                <strong>Server Info:</strong> ${pageContext.servletContext.serverInfo}
            </div>
            <div class="info-item">
                <strong>Real Path:</strong> ${pageContext.servletContext.getRealPath("/")}
            </div>
        </div>
        
        <div class="info-box warning">
            <h2>⚠️ Important Notice</h2>
            <div class="info-item">
                <strong>Current Access:</strong> You are accessing this page via <code>${pageContext.request.requestURL}</code>
            </div>
            <div class="info-item">
                <strong>Context Path:</strong> <code>${pageContext.request.contextPath}</code>
            </div>
            <div class="info-item">
                <strong>Correct Access:</strong> If Context Path is <code>/javaeejieke</code>, you should access via <code>http://localhost:8080/javaeejieke/</code>
            </div>
            <div class="info-item">
                <strong>Alternative:</strong> If Context Path is <code>/</code>, you can access directly via <code>http://localhost:8080/</code>
            </div>
        </div>
        
        <div class="links">
            <h2>🔗 Quick Links</h2>
            <a href="${pageContext.request.contextPath}/">🏠 Home Page</a>
            <a href="${pageContext.request.contextPath}/admin/login">🔐 Admin Login</a>
            <a href="${pageContext.request.contextPath}/book/list">📖 Book List</a>
            <a href="${pageContext.request.contextPath}/reader/list">👥 Reader List</a>
            <a href="${pageContext.request.contextPath}/borrow/list">📚 Borrow List</a>
            <a href="${pageContext.request.contextPath}/test">🧪 Test Page</a>
        </div>
    </div>
</body>
</html>
