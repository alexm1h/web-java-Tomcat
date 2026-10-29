<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Форма студента 4324</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
        h1 { color: #2c3e50; }
        form { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); max-width: 500px; }
        label { display: block; margin-top: 15px; margin-bottom: 5px; color: #34495e; font-weight: bold; }
        input[type="text"], select, textarea { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; box-sizing: border-box; }
        .radio-group, .checkbox-group { margin-top: 5px; }
        .radio-group label, .checkbox-group label { display: inline-block; margin-right: 15px; font-weight: normal; }
        button { margin-top: 20px; padding: 10px 20px; background: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        button:hover { background: #2980b9; }
    </style>
</head>
<body>
    <h1>Форма студента взвода 4324</h1>
    <form method="post" action="StudentResult.jsp">
        
        <label>ФИО (для поиска):</label>
        <input type="text" name="fio" placeholder="Введите часть ФИО" />
        
        <label>Факультет:</label>
        <select name="faculty">
            <option value="">Все</option>
            <option value="ФЭА">ФЭА</option>
            <option value="ФКТИ">ФКТИ</option>
            <option value="ИСГЭО">ИСГЭО</option>
        </select>
        
        <label>Пол:</label>
        <div class="radio-group">
            <label><input type="radio" name="gender" value="male" checked /> Мужской</label>
            <label><input type="radio" name="gender" value="female" /> Женский</label>
        </div>
        
        <label>Интересы:</label>
        <div class="checkbox-group">
            <label><input type="checkbox" name="hobby" value="Спорт" /> Спорт</label>
            <label><input type="checkbox" name="hobby" value="Музыка" /> Музыка</label>
            <label><input type="checkbox" name="hobby" value="Зал" /> Зал</label>
            <label><input type="checkbox" name="hobby" value="Программирование" /> Программирование</label>
            <label><input type="checkbox" name="hobby" value="Готовка" /> Готовка</label>
            <label><input type="checkbox" name="hobby" value="Сборка/разборка оружия" /> Сборка/разборка оружия</label>
            <label><input type="checkbox" name="hobby" value="Плавание" /> Плавание</label>
            <label><input type="checkbox" name="hobby" value="Чтение" /> Чтение</label>
            <label><input type="checkbox" name="hobby" value="Компьютерные игры" /> Компьютерные игры</label>
        </div>
        
        <label>Комментарий:</label>
        <textarea name="comment" rows="3" placeholder="Введите комментарий"></textarea>
        
        <input type="hidden" name="groupId" value="4324" />
        
        <button type="submit">Отправить</button>
    </form>
</body>
</html>