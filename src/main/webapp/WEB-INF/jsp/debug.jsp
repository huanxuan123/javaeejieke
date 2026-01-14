<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Debug Information</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Courier New', monospace;
            background: #1e1e1e;
            color: #d4d4d4;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
        }
        h1 {
            color: #61dafb;
            text-align: center;
            margin-bottom: 30px;
        }
        .section {
            background: #2d2d2d;
            border: 1px solid #444;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .section h2 {
            color: #98c379;
            margin-top: 0;
            margin-bottom: 15px;
            border-bottom: 1px solid #444;
            padding-bottom: 10px;
        }
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 15px;
        }
        .info-item {
            background: #3d3d3d;
            padding: 15px;
            border-radius: 3px;
            border-left: 3px solid #61dafb;
        }
        .info-item strong {
            color: #61dafb;
            display: block;
            margin-bottom: 5px;
        }
        .info-item span {
            color: #e0e0e0;
            font-size: 14px;
        }
        .highlight {
            background: #4a4a4a;
            border-left-color: #f1c40f;
        }
        .success {
            border-left-color: #2ecc71;
        }
        .warning {
            border-left-color: #f39c12;
        }
        .links {
            margin-top: 30px;
            text-align: center;
        }
        .links a {
            display: inline-block;
            margin: 10px;
            padding: 15px 25px;
            background: #61dafb;
            color: #1e1e1e;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .links a:hover {
            background: #98c379;
        }
        .code {
            background: #1e1e1e;
            padding: 2px 6px;
            border-radius: 3px;
            font-family: 'Courier New', monospace;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔍 Debug Information</h1>
        
        <div class="section">
            <h2>📊 Request Information</h2>
            <div class="info-grid">
                <div class="info-item highlight">
                    <strong>Request URL:</strong>
                    <span>${requestURL}</span>
                </div>
                <div class="info-item">
                    <strong>Request URI:</strong>
                    <span>${requestURI}</span>
                </div>
                <div class="info-item highlight">
                    <strong>Context Path:</strong>
                    <span>${contextPath}</span>
                </div>
                <div class="info-item">
                    <strong>Servlet Path:</strong>
                    <span>${servletPath}</span>
                </div>
                <div class="info-item">
                    <strong>Query String:</strong>
                    <span>${queryString != null ? 'N/A' : queryString}</span>
                </div>
                <div class="info-item">
                    <strong>Method:</strong>
                    <span>${method}</span>
                </div>
                <div class="info-item">
                    <strong>Remote Address:</strong>
                    <span>${remoteAddr}</span>
                </div>
                <div class="info-item">
                    <strong>Server Name:</strong>
                    <span>${serverName}</span>
                </div>
                <div class="info-item">
                    <strong>Server Port:</strong>
                    <span>${serverPort}</span>
                </div>
                <div class="info-item">
                    <strong>Timestamp:</strong>
                    <span>${timestamp}</span>
                </div>
            </div>
        </div>
        
        <div class="section">
            <h2>💡 How to Use This Information</h2>
            <div class="info-grid">
                <div class="info-item success">
                    <strong>Context Path:</strong>
                    <span>This is your application context path. Use it to construct correct URLs.</span>
                </div>
                <div class="info-item warning">
                    <strong>If Context Path is /javaeejieke:</strong>
                    <span>Access via: http://localhost:8080/javaeejieke/</span>
                </div>
                <div class="info-item warning">
                    <strong>If Context Path is /:</strong>
                    <span>Access via: http://localhost:8080/</span>
                </div>
            </div>
        </div>
        
        <div class="section">
            <h2>🔗 Quick Access Links</h2>
            <div class="links">
                <a href="${pageContext.request.contextPath}/">🏠 Home</a>
                <a href="${pageContext.request.contextPath}/admin/login">🔐 Login</a>
                <a href="${pageContext.request.contextPath}/book/list">📖 Books</a>
                <a href="${pageContext.request.contextPath}/reader/list">👥 Readers</a>
                <a href="${pageContext.request.contextPath}/borrow/list">📚 Borrows</a>
                <a href="${pageContext.request.contextPath}/diagnostic">🔍 Diagnostic</a>
                <a href="${pageContext.request.contextPath}/test">🧪 Test</a>
            </div>
        </div>
        
        <div class="section">
            <h2>📝 Example URLs</h2>
            <div class="info-grid">
                <div class="info-item">
                    <strong>Home:</strong>
                    <span class="code">${pageContext.request.contextPath}/</span>
                </div>
                <div class="info-item">
                    <strong>Login:</strong>
                    <span class="code">${pageContext.request.contextPath}/admin/login</span>
                </div>
                <div class="info-item">
                    <strong>Book List:</strong>
                    <span class="code">${pageContext.request.contextPath}/book/list</span>
                </div>
                <div class="info-item">
                    <strong>Reader List:</strong>
                    <span class="code">${pageContext.request.contextPath}/reader/list</span>
                </div>
                <div class="info-item">
                    <strong>Borrow List:</strong>
                    <span class="code">${pageContext.request.contextPath}/borrow/list</span>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
