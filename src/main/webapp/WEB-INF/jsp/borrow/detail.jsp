<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>借阅记录详情</title>
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
        .btn-success {
            background: #28a745;
            color: white;
        }
        .btn-success:hover {
            background: #218838;
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
        .detail-header .record-id {
            color: #666;
            font-size: 14px;
        }
        .detail-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
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
        .book-info, .reader-info {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .info-title {
            color: #333;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .info-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }
        .info-content .detail-item {
            margin-bottom: 10px;
        }
        .status-badge {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: bold;
        }
        .status-borrowing {
            background: #ffc107;
            color: white;
        }
        .status-returned {
            background: #28a745;
            color: white;
        }
        .status-overdue {
            background: #dc3545;
            color: white;
        }
        .date-info {
            display: flex;
            gap: 20px;
            margin-top: 20px;
            padding: 15px;
            background: #e7f3ff;
            border-radius: 5px;
        }
        .date-info .date-item {
            flex: 1;
            text-align: center;
        }
        .date-info .date-item label {
            display: block;
            color: #666;
            font-size: 14px;
        }
        .date-info .date-item span {
            display: block;
            color: #333;
            font-size: 16px;
            font-weight: bold;
        }
        .remark {
            margin-top: 20px;
            padding: 15px;
            background: #fff3cd;
            border-radius: 5px;
            border-left: 4px solid #ffc107;
        }
        .remark h3 {
            color: #333;
            margin-bottom: 10px;
        }
        .remark p {
            color: #666;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>借阅记录详情</h1>
            <div>
                <a href="${pageContext.request.contextPath}/borrow/list" class="btn btn-secondary">返回列表</a>
            </div>
        </div>

        <div class="detail-card">
            <div class="detail-header">
                <h2>借阅记录 #${record.recordId}</h2>
            </div>

            <div class="detail-item">
                <label>状态:</label>
                <c:if test="${record.status == 1}">
                    <span class="status-badge status-borrowing">借阅中</span>
                </c:if>
                <c:if test="${record.status == 2}">
                    <span class="status-badge status-returned">已归还</span>
                </c:if>
                <c:if test="${record.status == 3}">
                    <span class="status-badge status-overdue">已逾期</span>
                </c:if>
            </div>

            <div class="book-info">
                <div class="info-title">图书信息</div>
                <div class="info-content">
                    <div class="detail-item">
                        <label>书名:</label>
                        <span>${record.book.title}</span>
                    </div>
                    <div class="detail-item">
                        <label>作者:</label>
                        <span>${record.book.author}</span>
                    </div>
                    <div class="detail-item">
                        <label>ISBN:</label>
                        <span>${record.book.isbn}</span>
                    </div>
                </div>
            </div>

            <div class="reader-info">
                <div class="info-title">读者信息</div>
                <div class="info-content">
                    <div class="detail-item">
                        <label>姓名:</label>
                        <span>${record.reader.name}</span>
                    </div>
                    <div class="detail-item">
                        <label>学号:</label>
                        <span>${record.reader.studentNo}</span>
                    </div>
                    <div class="detail-item">
                        <label>院系:</label>
                        <span>${record.reader.department}</span>
                    </div>
                </div>
            </div>

            <div class="date-info">
                <div class="date-item">
                    <label>借阅日期</label>
                    <span><fmt:formatDate value="${record.borrowDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                </div>
                <div class="date-item">
                    <label>应还日期</label>
                    <span><fmt:formatDate value="${record.dueDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                </div>
                <div class="date-item">
                    <label>归还日期</label>
                    <c:if test="${record.returnDate != null}">
                        <span><fmt:formatDate value="${record.returnDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                    </c:if>
                    <c:if test="${record.returnDate == null}">
                        <span style="color: #999;">未归还</span>
                    </c:if>
                </div>
            </div>

            <c:if test="${record.remark != null && !empty record.remark}">
                <div class="remark">
                    <h3>备注</h3>
                    <p>${record.remark}</p>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>