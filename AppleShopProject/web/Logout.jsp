<%-- 
    Document   : Logout
    Created on : Jun 8, 2024, 3:08:20 PM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    if (session != null) {
        session.invalidate();
    }

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }

    response.sendRedirect("LoginPage.jsp");
        %>
    </body>
</html>
