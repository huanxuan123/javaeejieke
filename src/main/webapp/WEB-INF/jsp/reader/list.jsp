<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reader List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        .btn-danger {
            background: #dc3545;
            color: white;
        }
        .btn-danger:hover {
            background: #c82333;
        }
        .search-form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .search-form input, .search-form select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
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
        .status-active {
            background: #28a745;
            color: white;
        }
        .status-inactive {
            background: #dc3545;
            color: white;
        }
        .actions {
            display: flex;
            gap: 5px;
        }
    </style>
</head>
<body>
    <div class="alert-container"></div>
    <div class="container">
        <div class="header">
            <h1>Reader Management</h1>
            <div>
                <a href="${pageContext.request.contextPath}/" class="btn">Back to Home</a>
                <a href="${pageContext.request.contextPath}/reader/add" class="btn btn-primary">Add Reader</a>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/reader/search" method="get" class="search-form">
            <input type="text" name="name" placeholder="Name" value="${name}">
            <input type="text" name="studentNo" placeholder="Student No" value="${studentNo}">
            <input type="text" name="department" placeholder="Department" value="${department}">
            <button type="submit" class="btn btn-primary">Search</button>
        </form>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student No</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Department</th>
                    <th>Borrow Limit</th>
                    <th>Borrowed</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty readerList}">
                    <tr>
                        <td colspan="9" class="empty-state">
                            <i>No readers found</i>
                            <p>Click "Add Reader" to add your first reader</p>
                        </td>
                    </tr>
                </c:if>
                <c:forEach items="${readerList}" var="reader">
                    <tr>
                        <td>${reader.readerId}</td>
                        <td>${reader.studentNo}</td>
                        <td>${reader.name}</td>
                        <td>${reader.gender}</td>
                        <td>${reader.department}</td>
                        <td>${reader.borrowLimit}</td>
                        <td>${reader.borrowedCount}</td>
                        <td>
                            <c:if test="${reader.status == 1}">
                                <span class="status-badge status-active">Active</span>
                            </c:if>
                            <c:if test="${reader.status == 0}">
                                <span class="status-badge status-inactive">Inactive</span>
                            </c:if>
                        </td>
                        <td class="actions">
                            <a href="${pageContext.request.contextPath}/reader/detail/${reader.readerId}" class="btn btn-success">View</a>
                            <a href="${pageContext.request.contextPath}/reader/edit/${reader.readerId}" class="btn btn-primary">Edit</a>
                            <button onclick="deleteReader(${reader.readerId})" class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            function deleteReader(readerId) {
                if (confirmAction('Are you sure you want to delete this reader?')) {
                    $.ajax({
                        url: contextPath + '/reader/delete/' + readerId,
                        type: 'POST',
                        success: function(response) {
                            if (response === 'success') {
                                showMessage('Reader deleted successfully!', 'success');
                                setTimeout(function() {
                                    location.reload();
                                }, 1000);
                            } else {
                                showMessage('Failed to delete reader: ' + response, 'error');
                            }
                        },
                        error: function(xhr, status, error) {
                            showMessage('Network error: ' + error, 'error');
                        }
                    });
                }
            }
            
            window.deleteReader = deleteReader;
        });
    </script>
</body>
</html>
