<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    // Чтение параметров из формы
    String fioFilter = request.getParameter("fio");
    String facultyFilter = request.getParameter("faculty");
    String gender = request.getParameter("gender");
    String comment = request.getParameter("comment");
    String groupId = request.getParameter("groupId");
    String[] hobbies = request.getParameterValues("hobby");
    
    // Если форма не отправлена (нет faculty) — на страницу ошибки
    if (facultyFilter == null) {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ErrorManager.jsp");
        dispatcher.forward(request, response);
        return;
    }
    
    // Данные студентов — 35 человек
    String[][] students = {
    {"Андреев Дмитрий Алексеевич", "10.08.2006", "ФЭА", "4324", "М", "Спорт,Программирование"},
    {"Беликов Иван Сергеевич", "05.10.2006", "ФЭА", "4324", "М", "Музыка,Чтение"},
    {"Березин Максим Антонович", "10.01.2006", "ФКТИ", "4324", "М", "Зал,Сборка/разборка оружия"},
    {"Богданов Никита Константинович", "18.09.2006", "ФКТИ", "4324", "М", "Программирование,Компьютерные игры"},
    {"Булгаков Павел Тимурович", "12.07.2006", "ФКТИ", "4324", "М", "Плавание,Чтение"},
    {"Бунегин Вадим Константинович", "02.09.2006", "ИСГЭО", "4324", "М", "Спорт,Музыка"},
    {"Бунегин Дмитрий Константинович", "02.09.2006", "ФЭА", "4324", "М", "Готовка,Программирование"},
    {"Ващенко Владимир Васильевич", "06.05.2006", "ФКТИ", "4324", "М", "Зал,Компьютерные игры"},
    {"Веселок Никита Николаевич", "30.09.2006", "ФКТИ", "4324", "М", "Спорт,Плавание"},
    {"Власов Иван Дмитриевич", "16.07.2006", "ФКТИ", "4324", "М", "Музыка,Программирование"},
    {"Годованюк Андрей Валерьевич", "16.08.2007", "ФКТИ", "4324", "М", "Сборка/разборка оружия,Зал"},
    {"Духов Никита Артемович", "25.04.2006", "ИСГЭО", "4324", "М", "Чтение,Компьютерные игры"},
    {"Зоря Ярослав Максимович", "13.09.2006", "ФЭА", "4324", "М", "Спорт,Зал"},
    {"Кладков Илья Анатольевич", "28.12.2006", "ФКТИ", "4324", "М", "Программирование,Плавание"},
    {"Корепов Кирилл Александрович", "14.04.2006", "ФКТИ", "4324", "М", "Музыка,Спорт"},
    {"Коробов Богдар Юрьевич", "14.01.2007", "ФЭА", "4324", "М", "Готовка,Чтение"},
    {"Кругляков Владислав Дмитриевич", "23.03.2006", "ФКТИ", "4324", "М", "Зал,Сборка/разборка оружия"},
    {"Ласков Сергей Владимирович", "22.09.2006", "ФКТИ", "4324", "М", "Компьютерные игры,Программирование"},
    {"Маргулис Иван Евгеньевич", "27.09.2006", "ФЭА", "4324", "М", "Спорт,Музыка"},
    {"Метельков Егор Алексеевич", "31.01.2006", "ФЭА", "4324", "М", "Плавание,Зал"},
    {"Михайлов Александр Олегович", "09.10.2006", "ФКТИ", "4324", "М", "Программирование,Чтение,Зал,Спорт"},
    {"Низкодубов Евгений Михайлович", "25.11.2006", "ФКТИ", "4324", "М", "Готовка,Компьютерные игры"},
    {"Новиков Георгий Викторович", "12.10.2006", "ФКТИ", "4324", "М", "Спорт,Зал"},
    {"Опаш Айдаш Буянович", "11.01.2007", "ФКТИ", "4324", "М", "Музыка,Сборка/разборка оружия"},
    {"Пазенко Никита Андреевич", "04.09.2006", "ФКТИ", "4324", "М", "Программирование,Плавание"},
    {"Пьянков Евгений Дмитриевич", "02.03.2006", "ФЭА", "4324", "М", "Чтение,Спорт"},
    {"Роговенко Иван Андреевич", "10.11.2006", "ФКТИ", "4324", "М", "Компьютерные игры,Музыка"},
    {"Рользинг Ярослав Андреевич", "27.02.2006", "ФКТИ", "4324", "М", "Зал,Готовка"},
    {"Сабуров Ярослав Андреевич", "20.09.2006", "ФКТИ", "4324", "М", "Спорт,Программирование"},
    {"Селезнев Данила Евгеньевич", "05.06.2006", "ФКТИ", "4324", "М", "Плавание,Чтение"},
    {"Стукалкин Михаил Михайлович", "10.09.2006", "ФКТИ", "4324", "М", "Сборка/разборка оружия,Зал"},
    {"Тавлеев Матвей Сергеевич", "25.12.2006", "ФКТИ", "4324", "М", "Музыка,Компьютерные игры"},
    {"Устинов Максим Дмитриевич", "14.02.2006", "ФКТИ", "4324", "М", "Спорт,Готовка"},
    {"Федюшкин Лев Владиславович", "04.11.2006", "ФКТИ", "4324", "М", "Программирование,Чтение"},
    {"Черных Дмитрий Александрович", "12.01.2007", "ФКТИ", "4324", "М", "Зал,Плавание"}
};
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Результат формы</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
        h1 { color: #2c3e50; }
        h2 { color: #34495e; font-weight: normal; }
        .info-box { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); margin-bottom: 20px; }
        .info-box p { margin: 5px 0; }
        table { border-collapse: collapse; width: 100%; background: white; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        th, td { border: 1px solid #ddd; padding: 8px 12px; text-align: left; }
        th { background: #34495e; color: white; }
        tr:nth-child(even) { background: #f9f9f9; }
        tr:hover { background: #eaf2f8; }
        .back-btn { display: inline-block; margin-top: 20px; padding: 10px 20px; background: #3498db; color: white; text-decoration: none; border-radius: 4px; }
        .back-btn:hover { background: #2980b9; }
    </style>
</head>
<body>
    <h1>Результат обработки формы</h1>
    
    <!-- Блок: данные из формы -->
    <div class="info-box">
        <h2>Данные из формы</h2>
        <p><b>ФИО (поиск):</b> <%= (fioFilter != null && !fioFilter.isEmpty()) ? fioFilter : "не указано" %></p>
        <p><b>Факультет:</b> <%= (facultyFilter != null && !facultyFilter.isEmpty()) ? facultyFilter : "все" %></p>
        <p><b>Пол:</b> <%= "male".equals(gender) ? "Мужской" : ("female".equals(gender) ? "Женский" : "не указан") %></p>
        <p><b>Интересы:</b> 
            <% 
                if (hobbies != null && hobbies.length > 0) {
                    for (int i = 0; i < hobbies.length; i++) {
                        out.print(hobbies[i]);
                        if (i < hobbies.length - 1) out.print(", ");
                    }
                } else {
                    out.print("не выбрано");
                }
            %>
        </p>
        <p><b>Комментарий:</b> <%= (comment != null && !comment.isEmpty()) ? comment : "нет" %></p>
        <p><b>Группа (скрытое поле):</b> <%= (groupId != null) ? groupId : "не указана" %></p>
    </div>
    
    <!-- Блок: таблица студентов -->
    <h2>Список студентов</h2>
    <table>
        <tr>
            <th>№</th>
            <th>ФИО</th>
            <th>Дата рождения</th>
            <th>Факультет</th>
            <th>Группа</th>
        </tr>
        <%
    int count = 1;
    for (String[] s : students) {
        // Фильтр по факультету
        if (facultyFilter != null && !facultyFilter.isEmpty()
                && !s[2].equals(facultyFilter)) {
            continue;
        }
        // Фильтр по ФИО
        if (fioFilter != null && !fioFilter.isEmpty()
                && !s[0].toLowerCase().contains(fioFilter.toLowerCase())) {
            continue;
        }
        // Фильтр по полу
        if (gender != null && !gender.isEmpty()) {
            String studentGender = s[4];  // "М" или "Ж"
            if ("male".equals(gender) && !"М".equals(studentGender)) continue;
            if ("female".equals(gender) && !"Ж".equals(studentGender)) continue;
        }
        // Фильтр по хобби (если выбрано хотя бы одно)
        if (hobbies != null && hobbies.length > 0) {
            boolean hasHobby = false;
            for (String hobby : hobbies) {
                if (s[5].contains(hobby)) {
                    hasHobby = true;
                    break;
                }
            }
            if (!hasHobby) continue;
        }
%>
<tr>
    <td><%= count++ %></td>
    <td><%= s[0] %></td>
    <td><%= s[1] %></td>
    <td><%= s[2] %></td>
    <td><%= s[3] %></td>
</tr>
<%
    }
%>
    </table>
    
    <a href="StudentList.jsp" class="back-btn">← Назад к форме</a>
</body>
</html>