<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Book</title>
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
            width: 600px;
        }
        .container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #666;
            font-weight: bold;
        }
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        .form-group select:focus {
            outline: none;
            border-color: #667eea;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #764ba2;
        }
        .btn-secondary {
            background: #6c757d;
            margin-top: 10px;
        }
        .btn-secondary:hover {
            background: #5a6268;
        }
        .book-info {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .book-info p {
            margin: 5px 0;
            color: #666;
        }
        .book-info strong {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Borrow Book</h2>
        <form id="borrowForm">
            <div class="form-group">
                <label for="readerId">Select Reader:</label>
                <select id="readerId" name="readerId" required>
                    <option value="">-- Select Reader --</option>
                    <c:forEach items="${readerList}" var="reader">
                        <option value="${reader.readerId}">${reader.name} (${reader.studentNo}) - Borrowed: ${reader.borrowedCount}/${reader.borrowLimit}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="bookId">Select Book:</label>
                <select id="bookId" name="bookId" required>
                    <option value="">-- Select Book --</option>
                    <c:forEach items="${bookList}" var="book">
                        <option value="${book.bookId}" ${book.availableStock <= 0 ? 'disabled' : ''}>${book.title} by ${book.author} - Stock: ${book.availableStock}/${book.totalStock}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn">Borrow Book</button>
            <button type="button" class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/borrow/list'">Cancel</button>
        </form>
    </div>

    <script>
        $(document).ready(function() {
            $('#borrowForm').on('submit', function(e) {
                e.preventDefault();
                
                var readerId = $('#readerId').val();
                var bookId = $('#bookId').val();

                if (!readerId || !bookId) {
                    showMessage('Please select both reader and book', 'error');
                    return;
                }

                $.ajax({
                    url: contextPath + '/borrow/borrow',
                    type: 'POST',
                    data: {
                        readerId: readerId,
                        bookId: bookId
                    },
                    success: function(response) {
                        if (response === 'success') {
                            showMessage('Book borrowed successfully!', 'success');
                            setTimeout(function() {
                                window.location.href = contextPath + '/borrow/list';
                            }, 1000);
                        } else {
                            showMessage('Failed to borrow book: ' + response, 'error');
                        }
                    },
                    error: function(xhr, status, error) {
                        showMessage('Network error: ' + error, 'error');
                    }
                });
            });
        });
    </script>
</body>
</html>
