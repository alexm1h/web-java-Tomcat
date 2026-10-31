<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Лаба №7 — Cookie и Session</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
        h1 { color: #2c3e50; }
        form { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); max-width: 400px; }
        label { display: block; margin-top: 15px; margin-bottom: 5px; color: #34495e; font-weight: bold; }
        input[type="text"], select { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; box-sizing: border-box; }
        button { margin-top: 20px; padding: 10px 20px; background: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        button:hover { background: #2980b9; }
    </style>
</head>
<body>
    <h1>Введите имя и выберите цвет</h1>
    <%
        // Читаем Cookie, чтобы подставить прошлые значения
        String savedName = "";
        String savedColor = "#ffffff";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("userName".equals(c.getName())) savedName = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
                if ("bgColor".equals(c.getName())) savedColor = c.getValue();
            }
        }
    %>
    <form method="post" action="result.jsp">
        <label>Ваше имя:</label>
        <input type="text" name="userName" value="<%= savedName %>" placeholder="Введите имя" />
        
        <label>Цвет фона страницы:</label>
        <select name="bgColor">
            <option value="#ffffff" <%= "#ffffff".equals(savedColor) ? "selected" : "" %>>Белый</option>
            <option value="#ffe6e6" <%= "#ffe6e6".equals(savedColor) ? "selected" : "" %>>Розовый</option>
            <option value="#e6f2ff" <%= "#e6f2ff".equals(savedColor) ? "selected" : "" %>>Голубой</option>
            <option value="#e6ffe6" <%= "#e6ffe6".equals(savedColor) ? "selected" : "" %>>Салатовый</option>
            <option value="#fff9e6" <%= "#fff9e6".equals(savedColor) ? "selected" : "" %>>Кремовый</option>
        </select>
        
        <button type="submit">Перейти</button>
    </form>
</body>
</html>