<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Reader</title>
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
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        .form-group input:focus, .form-group select:focus {
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Reader</h2>
        <form id="readerForm">
            <div class="form-group">
                <label for="readerId">ID:</label>
                <input type="number" id="readerId" name="readerId" value="${reader.readerId}" readonly>
            </div>
            <div class="form-group">
                <label for="studentNo">Student No:</label>
                <input type="text" id="studentNo" name="studentNo" value="${reader.studentNo}" required>
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${reader.name}" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender">
                    <option value="Male" ${reader.gender == 'Male' ? 'selected' : ''}>Male</option>
                    <option value="Female" ${reader.gender == 'Female' ? 'selected' : ''}>Female</option>
                </select>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" value="${reader.phone}">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${reader.email}">
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <input type="text" id="department" name="department" value="${reader.department}">
            </div>
            <div class="form-group">
                <label for="borrowLimit">Borrow Limit:</label>
                <input type="number" id="borrowLimit" name="borrowLimit" min="1" max="10" value="${reader.borrowLimit}">
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status">
                    <option value="1" ${reader.status == 1 ? 'selected' : ''}>Active</option>
                    <option value="0" ${reader.status == 0 ? 'selected' : ''}>Inactive</option>
                </select>
            </div>
            <button type="submit" class="btn">Update Reader</button>
            <button type="button" class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/reader/list'">Cancel</button>
        </form>
    </div>

    <script>
        document.getElementById('readerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            const reader = {};
            formData.forEach((value, key) => {
                reader[key] = value;
            });

            fetch('${pageContext.request.contextPath}/reader/edit', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(reader)
            })
            .then(response => response.text())
            .then(data => {
                if (data === 'success') {
                    alert('Reader updated successfully!');
                    window.location.href = '${pageContext.request.contextPath}/reader/list';
                } else {
                    alert('Failed to update reader: ' + data);
                }
            })
            .catch(error => {
                alert('Error: ' + error);
            });
        });
    </script>
</body>
</html>
