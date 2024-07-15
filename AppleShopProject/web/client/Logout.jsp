<%-- 
    Document   : Logout.jsp
    Created on : Jul 15, 2024, 10:47:16 AM
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
    response.sendRedirect("index.jsp");
        %>
    </body>
</html>
