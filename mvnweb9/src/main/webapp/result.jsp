<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
         import="javax.servlet.http.Cookie, java.util.Date, java.text.SimpleDateFormat" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    // Получаем имя и цвет из формы
    String userName = request.getParameter("userName");
    String bgColor = request.getParameter("bgColor");
    
    // Если пришли пустые — берём из Cookie
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("userName".equals(c.getName()) && (userName == null || userName.isEmpty())) {
                userName = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if ("bgColor".equals(c.getName()) && (bgColor == null || bgColor.isEmpty())) {
                bgColor = c.getValue();
            }
        }
    }
    
    if (userName == null) userName = "Гость";
    if (bgColor == null || bgColor.isEmpty()) bgColor = "#ffffff";
    
    // Сохраняем в Cookie (на 7 дней)
    Cookie nameCookie = new Cookie("userName", java.net.URLEncoder.encode(userName, "UTF-8"));
    nameCookie.setMaxAge(7 * 24 * 60 * 60);
    response.addCookie(nameCookie);
    
    Cookie colorCookie = new Cookie("bgColor", bgColor);
    colorCookie.setMaxAge(7 * 24 * 60 * 60);
    response.addCookie(colorCookie);
    
    // Работа с сессией: количество обращений и дата последнего обращения
    Integer visitCount = (Integer) session.getAttribute("visitCount");
    if (visitCount == null) visitCount = 1;
    else visitCount++;
    session.setAttribute("visitCount", visitCount);
    
    Date now = new Date();
    String lastVisit;
    SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
    if (session.getAttribute("lastVisit") != null) {
        lastVisit = (String) session.getAttribute("lastVisit");
    } else {
        lastVisit = "это первый визит";
    }
    session.setAttribute("lastVisit", sdf.format(now));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Результат</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: <%= bgColor %>; }
        h1 { color: #2c3e50; }
        .info-box { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); margin-bottom: 20px; max-width: 600px; }
        .info-box p { margin: 8px 0; }
        .label { font-weight: bold; color: #34495e; }
        .back-btn { display: inline-block; margin-top: 20px; padding: 10px 20px; background: #3498db; color: white; text-decoration: none; border-radius: 4px; }
        .back-btn:hover { background: #2980b9; }
    </style>
</head>
<body>
    <h1>Результат</h1>
    
    <div class="info-box">
        <p><span class="label">Имя пользователя (из Cookie):</span> <%= userName %></p>
        <p><span class="label">Цвет фона:</span> <%= bgColor %></p>
        <p><span class="label">Количество обращений (из сессии):</span> <%= visitCount %></p>
        <p><span class="label">Дата последнего обращения:</span> <%= lastVisit %></p>
        <p><span class="label">Текущее время:</span> <%= sdf.format(now) %></p>
    </div>
    
    <div class="info-box">
        <h2>Содержимое Cookie:</h2>
        <%
            if (cookies != null && cookies.length > 0) {
                for (Cookie c : cookies) {
                    out.println("<p><span class='label'>" + c.getName() + ":</span> " 
                            + java.net.URLDecoder.decode(c.getValue(), "UTF-8") + "</p>");
                }
            } else {
                out.println("<p>Cookie отсутствуют</p>");
            }
        %>
    </div>
    
    <div class="info-box">
        <h2>Идентификатор сессии:</h2>
        <p><%= session.getId() %></p>
    </div>
    
    <a href="index.jsp" class="back-btn">← Назад к форме</a>
</body>
</html>