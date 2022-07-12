<%-- 
    Document   : logout
    Created on : May 12, 2019, 5:26:00 PM
    Author     : SEMAR
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
            session.setAttribute("usernameadmin", null);
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
