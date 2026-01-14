<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', 'Microsoft YaHei', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            max-width: 600px;
            width: 100%;
        }
        .container h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .menu {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .menu-item {
            padding: 15px 20px;
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            text-decoration: none;
            color: #333;
            transition: all 0.3s ease;
        }
        .menu-item:hover {
            background: #667eea;
            color: white;
            transform: translateX(10px);
        }
        .menu-item.primary {
            background: #667eea;
            color: white;
            font-weight: bold;
        }
        .menu-item.primary:hover {
            background: #764ba2;
        }
        .info {
            margin-top: 30px;
            padding: 15px;
            background: #e9ecef;
            border-radius: 5px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📚 Library Management System</h1>
        
        <div class="menu">
            <a href="${pageContext.request.contextPath}/admin/login" class="menu-item primary">
                🔐 Admin Login
            </a>
            <a href="${pageContext.request.contextPath}/" class="menu-item">
                🏠 Home Page
            </a>
            <a href="${pageContext.request.contextPath}/book/list" class="menu-item">
                📖 Book Management
            </a>
            <a href="${pageContext.request.contextPath}/reader/list" class="menu-item">
                👥 Reader Management
            </a>
            <a href="${pageContext.request.contextPath}/borrow/list" class="menu-item">
                📚 Borrow Management
            </a>
            <a href="${pageContext.request.contextPath}/test" class="menu-item">
                🧪 Test Page
            </a>
            <a href="${pageContext.request.contextPath}/diagnostic" class="menu-item">
                🔍 Diagnostic Page
            </a>
        </div>
        
        <div class="info">
            <strong>💡 Tips:</strong><br>
            • First time? Click "Admin Login" to log in<br>
            • Default admin account: <strong>admin / admin123</strong><br>
            • Make sure MySQL is running before accessing the system<br>
            • Click "Diagnostic Page" to check your Context Path
        </div>
    </div>
</body>
</html>
