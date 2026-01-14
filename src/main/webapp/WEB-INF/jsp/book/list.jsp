<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book List</title>
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
        .status-available {
            background: #28a745;
            color: white;
        }
        .status-unavailable {
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
            <h1>Book Management</h1>
            <div>
                <a href="${pageContext.request.contextPath}/" class="btn">Back to Home</a>
                <a href="${pageContext.request.contextPath}/book/add" class="btn btn-primary">Add Book</a>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/book/search" method="get" class="search-form">
            <input type="text" name="title" placeholder="Title" value="${title}">
            <input type="text" name="author" placeholder="Author" value="${author}">
            <input type="text" name="category" placeholder="Category" value="${category}">
            <select name="status">
                <option value="">All Status</option>
                <option value="1" ${status == 1 ? 'selected' : ''}>Available</option>
                <option value="0" ${status == 0 ? 'selected' : ''}>Unavailable</option>
            </select>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty bookList}">
                    <tr>
                        <td colspan="8" class="empty-state">
                            <i>No books found</i>
                            <p>Click "Add Book" to add your first book</p>
                        </td>
                    </tr>
                </c:if>
                <c:forEach items="${bookList}" var="book">
                    <tr>
                        <td>${book.bookId}</td>
                        <td>${book.title}</td>
                        <td>${book.author}</td>
                        <td>${book.category}</td>
                        <td>${book.price}</td>
                        <td>${book.availableStock}/${book.totalStock}</td>
                        <td>
                            <c:if test="${book.status == 1}">
                                <span class="status-badge status-available">Available</span>
                            </c:if>
                            <c:if test="${book.status == 0}">
                                <span class="status-badge status-unavailable">Unavailable</span>
                            </c:if>
                        </td>
                        <td class="actions">
                            <a href="${pageContext.request.contextPath}/book/detail/${book.bookId}" class="btn btn-success">View</a>
                            <a href="${pageContext.request.contextPath}/book/edit/${book.bookId}" class="btn btn-primary">Edit</a>
                            <button onclick="deleteBook(${book.bookId})" class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            function deleteBook(bookId) {
                if (confirmAction('Are you sure you want to delete this book?')) {
                    $.ajax({
                        url: contextPath + '/book/delete/' + bookId,
                        type: 'POST',
                        success: function(response) {
                            if (response === 'success') {
                                showMessage('Book deleted successfully!', 'success');
                                setTimeout(function() {
                                    location.reload();
                                }, 1000);
                            } else {
                                showMessage('Failed to delete book: ' + response, 'error');
                            }
                        },
                        error: function(xhr, status, error) {
                            showMessage('Network error: ' + error, 'error');
                        }
                    });
                }
            }
            
            window.deleteBook = deleteBook;
        });
    </script>
</body>
</html>
