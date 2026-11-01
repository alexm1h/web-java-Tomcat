<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Обработка ошибки</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
        h1 { color: #e74c3c; }
        .error-box { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); max-width: 500px; }
    </style>
</head>
<body>
    <h1>Ошибка</h1>
    <div class="error-box">
        <p>Необходимо заполнить форму.</p>
        <p>Вернитесь на <a href="StudentList.jsp">стартовую страницу</a> и отправьте форму.</p>
    </div>
</body>
</html>