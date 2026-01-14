<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>借阅记录列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        var contextPath = '${pageContext.request.contextPath}';
    </script>
    <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
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
        .btn-success {
            background: #28a745;
            color: white;
        }
        .btn-success:hover {
            background: #218838;
        }
        .btn-warning {
            background: #ffc107;
            color: white;
        }
        .btn-warning:hover {
            background: #e0a800;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #667eea;
            color: white;
            font-weight: bold;
        }
        tr:hover {
            background: #f9f9f9;
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
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
    </style>
</head>
<body>
    <div class="alert-container"></div>
    <div class="container">
        <div class="header">
            <h1>借阅管理</h1>
            <div>
                <a href="${pageContext.request.contextPath}/" class="btn">返回首页</a>
                <a href="${pageContext.request.contextPath}/borrow/borrow" class="btn btn-primary">借书</a>
            </div>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>读者</th>
                    <th>图书</th>
                    <th>借阅日期</th>
                    <th>应还日期</th>
                    <th>归还日期</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty recordList}">
                    <tr>
                        <td colspan="8" class="empty-state">
                            <i>未找到借阅记录</i>
                            <p>点击"借书"创建您的第一条借阅记录</p>
                        </td>
                    </tr>
                </c:if>
                <c:forEach items="${recordList}" var="record">
                    <tr>
                        <td>${record.recordId}</td>
                        <td>${record.reader.name} (${record.reader.studentNo})</td>
                        <td>${record.book.title}</td>
                        <td>${record.borrowDate}</td>
                        <td>${record.dueDate}</td>
                        <td>${record.returnDate}</td>
                        <td>
                            <c:if test="${record.status == 1}">
                                <span class="status-badge status-borrowing">借阅中</span>
                            </c:if>
                            <c:if test="${record.status == 2}">
                                <span class="status-badge status-returned">已归还</span>
                            </c:if>
                            <c:if test="${record.status == 3}">
                                <span class="status-badge status-overdue">逾期</span>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${record.status == 1}">
                                <button onclick="returnBook(${record.recordId})" class="btn btn-success">还书</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            function returnBook(recordId) {
                if (confirmAction('确定要归还这本书吗？')) {
                    $.ajax({
                        url: contextPath + '/borrow/return/' + recordId,
                        type: 'POST',
                        success: function(response) {
                            if (response === 'success') {
                                showMessage('图书归还成功！', 'success');
                                setTimeout(function() {
                                    location.reload();
                                }, 1000);
                            } else {
                                showMessage('归还图书失败：' + response, 'error');
                            }
                        },
                        error: function(xhr, status, error) {
                            showMessage('网络错误：' + error, 'error');
                        }
                    });
                }
            }
            
            window.returnBook = returnBook;
        });
    </script>
</body>
</html>
