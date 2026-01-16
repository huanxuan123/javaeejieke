<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>读者详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
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
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header h1 {
            color: #333;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary {
            background: #667eea;
            color: white;
        }
        .btn-primary:hover {
            background: #764ba2;
        }
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background: #5a6268;
        }
        .detail-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .detail-header {
            border-bottom: 2px solid #667eea;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        .detail-header h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .detail-header .student-no {
            color: #666;
            font-size: 14px;
        }
        .detail-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        .detail-item {
            margin-bottom: 15px;
        }
        .detail-item label {
            display: block;
            color: #666;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .detail-item span {
            color: #333;
            font-size: 16px;
        }
        .borrow-info {
            display: flex;
            gap: 20px;
            margin-top: 20px;
            padding: 15px;
            background: #e7f3ff;
            border-radius: 5px;
        }
        .borrow-info .info-item {
            flex: 1;
            text-align: center;
        }
        .borrow-info .info-item label {
            display: block;
            color: #666;
            font-size: 14px;
        }
        .borrow-info .info-item span {
            display: block;
            color: #333;
            font-size: 24px;
            font-weight: bold;
        }
        .status-badge {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: bold;
        }
        .status-active {
            background: #28a745;
            color: white;
        }
        .status-inactive {
            background: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>读者详情</h1>
            <div>
                <a href="${pageContext.request.contextPath}/reader/list" class="btn btn-secondary">返回列表</a>
                <a href="${pageContext.request.contextPath}/reader/edit/${reader.readerId}" class="btn btn-primary">编辑读者</a>
            </div>
        </div>

        <div class="detail-card">
            <div class="detail-header">
                <h2>${reader.name}</h2>
                <div class="student-no">学号: ${reader.studentNo}</div>
            </div>

            <div class="detail-content">
                <div class="detail-item">
                    <label>性别:</label>
                    <span>${reader.gender}</span>
                </div>
                <div class="detail-item">
                    <label>电话:</label>
                    <span>${reader.phone}</span>
                </div>
                <div class="detail-item">
                    <label>邮箱:</label>
                    <span>${reader.email}</span>
                </div>
                <div class="detail-item">
                    <label>院系:</label>
                    <span>${reader.department}</span>
                </div>
                <div class="detail-item">
                    <label>状态:</label>
                    <c:if test="${reader.status == 1}">
                        <span class="status-badge status-active">正常</span>
                    </c:if>
                    <c:if test="${reader.status == 0}">
                        <span class="status-badge status-inactive">禁用</span>
                    </c:if>
                </div>
            </div>

            <div class="borrow-info">
                <div class="info-item">
                    <label>借阅限额</label>
                    <span>${reader.borrowLimit}本</span>
                </div>
                <div class="info-item">
                    <label>已借数量</label>
                    <span>${reader.borrowedCount}本</span>
                </div>
                <div class="info-item">
                    <label>还可借</label>
                    <span>${reader.borrowLimit - reader.borrowedCount}本</span>
                </div>
            </div>
        </div>
    </div>
</body>
</html>