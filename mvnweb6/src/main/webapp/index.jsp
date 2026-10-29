<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Выбор языка / Language selection</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
        h1 { color: #2c3e50; }
        form { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); max-width: 400px; }
        label { display: block; margin-bottom: 10px; color: #34495e; font-weight: bold; }
        select { width: 100%; padding: 8px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; }
        button { padding: 10px 20px; background: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        button:hover { background: #2980b9; }
    </style>
</head>
<body>
    <h1>Выбор языка / Language selection</h1>
    <form method="get" action="StudentsList">
        <label>Язык / Language:</label>
        <select name="lang">
            <option value="ru">Русский</option>
            <option value="en">English</option>
        </select>
        <label>Факультет / Faculty:</label>
        <select name="faculty">
            <option value="">Все / All</option>
            <option value="ФЭА">ФЭА</option>
            <option value="ФКТИ">ФКТИ</option>
            <option value="ИСГЭО">ИСГЭО</option>
        </select>
        <button type="submit">Показать / Show</button>
    </form>
</body>
</html>