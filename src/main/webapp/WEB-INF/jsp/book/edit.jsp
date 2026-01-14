<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
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
            width: 500px;
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
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        .form-group input:focus, .form-group select:focus, .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
        }
        .form-group textarea {
            height: 100px;
            resize: vertical;
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Book</h2>
        <form id="bookForm">
            <div class="form-group">
                <label for="bookId">ID:</label>
                <input type="number" id="bookId" name="bookId" value="${book.bookId}" readonly>
            </div>
            <div class="form-group">
                <label for="isbn">ISBN:</label>
                <input type="text" id="isbn" name="isbn" value="${book.isbn}">
            </div>
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${book.title}" required>
            </div>
            <div class="form-group">
                <label for="author">Author:</label>
                <input type="text" id="author" name="author" value="${book.author}" required>
            </div>
            <div class="form-group">
                <label for="publisher">Publisher:</label>
                <input type="text" id="publisher" name="publisher" value="${book.publisher}">
            </div>
            <div class="form-group">
                <label for="publishDate">Publish Date:</label>
                <input type="date" id="publishDate" name="publishDate" value="${book.publishDate}">
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" value="${book.category}">
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" step="0.01" min="0" value="${book.price}">
            </div>
            <div class="form-group">
                <label for="totalStock">Total Stock:</label>
                <input type="number" id="totalStock" name="totalStock" min="1" value="${book.totalStock}" required>
            </div>
            <div class="form-group">
                <label for="location">Location:</label>
                <input type="text" id="location" name="location" value="${book.location}">
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description">${book.description}</textarea>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status">
                    <option value="1" ${book.status == 1 ? 'selected' : ''}>Available</option>
                    <option value="0" ${book.status == 0 ? 'selected' : ''}>Unavailable</option>
                </select>
            </div>
            <button type="submit" class="btn">Update Book</button>
            <button type="button" class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/book/list'">Cancel</button>
        </form>
    </div>

    <script>
        document.getElementById('bookForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            const book = {};
            formData.forEach((value, key) => {
                book[key] = value;
            });

            fetch('${pageContext.request.contextPath}/book/edit', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(book)
            })
            .then(response => response.text())
            .then(data => {
                if (data === 'success') {
                    alert('Book updated successfully!');
                    window.location.href = '${pageContext.request.contextPath}/book/list';
                } else {
                    alert('Failed to update book: ' + data);
                }
            })
            .catch(error => {
                alert('Error: ' + error);
            });
        });
    </script>
</body>
</html>
