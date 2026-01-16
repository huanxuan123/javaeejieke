<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书详情</title>
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
        .detail-header .isbn {
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
        .description {
            margin-top: 20px;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 5px;
        }
        .description h3 {
            color: #333;
            margin-bottom: 10px;
        }
        .description p {
            color: #666;
            line-height: 1.6;
        }
        .stock-info {
            display: flex;
            gap: 20px;
            margin-top: 20px;
            padding: 15px;
            background: #e7f3ff;
            border-radius: 5px;
        }
        .stock-info .stock-item {
            flex: 1;
            text-align: center;
        }
        .stock-info .stock-item label {
            display: block;
            color: #666;
            font-size: 14px;
        }
        .stock-info .stock-item span {
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
        .status-available {
            background: #28a745;
            color: white;
        }
        .status-unavailable {
            background: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>图书详情</h1>
            <div>
                <a href="${pageContext.request.contextPath}/book/list" class="btn btn-secondary">返回列表</a>
                <a href="${pageContext.request.contextPath}/book/edit/${book.bookId}" class="btn btn-primary">编辑图书</a>
            </div>
        </div>

        <div class="detail-card">
            <div class="detail-header">
                <h2>${book.title}</h2>
                <div class="isbn">ISBN: ${book.isbn}</div>
            </div>

            <div class="detail-content">
                <div class="detail-item">
                    <label>作者:</label>
                    <span>${book.author}</span>
                </div>
                <div class="detail-item">
                    <label>出版社:</label>
                    <span>${book.publisher}</span>
                </div>
                <div class="detail-item">
                    <label>出版日期:</label>
                    <span>${book.publishDate}</span>
                </div>
                <div class="detail-item">
                    <label>分类:</label>
                    <span>${book.category}</span>
                </div>
                <div class="detail-item">
                    <label>价格:</label>
                    <span>¥${book.price}</span>
                </div>
                <div class="detail-item">
                    <label>位置:</label>
                    <span>${book.location}</span>
                </div>
                <div class="detail-item">
                    <label>状态:</label>
                    <c:if test="${book.status == 1}">
                        <span class="status-badge status-available">可借</span>
                    </c:if>
                    <c:if test="${book.status == 0}">
                        <span class="status-badge status-unavailable">不可借</span>
                    </c:if>
                </div>
            </div>

            <div class="stock-info">
                <div class="stock-item">
                    <label>总库存</label>
                    <span>${book.totalStock}</span>
                </div>
                <div class="stock-item">
                    <label>可借数量</label>
                    <span>${book.availableStock}</span>
                </div>
            </div>

            <div class="description">
                <h3>图书简介</h3>
                <p>${book.description}</p>
            </div>
        </div>
    </div>
</body>
</html>