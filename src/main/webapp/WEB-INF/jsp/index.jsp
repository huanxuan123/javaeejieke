<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            font-family: 'Arial', sans-serif;
            background: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            background: #667eea;
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 {
            margin: 0;
        }
        .header .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }
        .menu-item {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-decoration: none;
            color: #333;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        }
        .menu-item h3 {
            margin: 0 0 10px 0;
            color: #667eea;
        }
        .menu-item p {
            margin: 0;
            color: #666;
        }
        .logout-btn {
            background: #ff6b6b;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .logout-btn:hover {
            background: #ee5a52;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Library Management System</h1>
            <div class="user-info">
                <span>Welcome, ${sessionScope.admin.name}</span>
                <a href="${pageContext.request.contextPath}/admin/logout" class="logout-btn">Logout</a>
            </div>
        </div>
        
        <div class="menu">
            <a href="${pageContext.request.contextPath}/book/list" class="menu-item">
                <h3>Book Management</h3>
                <p>Manage books, add new books, update book information</p>
            </a>
            <a href="${pageContext.request.contextPath}/reader/list" class="menu-item">
                <h3>Reader Management</h3>
                <p>Manage readers, add new readers, update reader information</p>
            </a>
            <a href="${pageContext.request.contextPath}/borrow/list" class="menu-item">
                <h3>Borrow Management</h3>
                <p>Manage borrow records, borrow and return books</p>
            </a>
        </div>
    </div>
</body>
</html>
