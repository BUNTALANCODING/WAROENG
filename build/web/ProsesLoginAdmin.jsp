<%-- 
    Document   : login
    Created on : May 12, 2019, 5:21:34 PM
    Author     : SEMAR
--%>
<%@page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            padding: 20%;
        }
        a{
            color: rosybrown;
            text-decoration: none;
            
        }
        p{
            color: #cd4c77;
            letter-spacing: 12px;
            
        }
        h3{
            text-align: center;
            background-image: linear-gradient(to bottom, #f1adad, #eabebe, #ffe2e2);
        }
    </style>
    <body>
        <%
    String userid = request.getParameter("usernameadmin");    
    String pwd = request.getParameter("passwordadmin");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/waroeng",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from admin where Username='" + userid + "' and Password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        out.println("welcome " + userid);
        out.println("<a href='Logout.jsp'>Log out</a>");
        response.sendRedirect("AdminMenu.jsp");
    }
    else {
        out.println("<h3><p>Password Salah!!!</p> <br> <a href='index.jsp'>Silahkan coba lagi???Click me!!</a><h3><hr>");
    }
%>
    </body>
</html>
