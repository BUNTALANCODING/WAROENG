<%-- 
    Document   : DeleteKaryawan
    Created on : Jul 11, 2022, 2:54:11 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 
 
<%
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/waroeng","root","");
        pst = con.prepareStatement("delete from karyawan where IDKaryawan = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
        
        %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="CSS/AdminMenu.css" rel="stylesheet" type="text/css"/>
    <title>Waroeng</title>
</head>

<body>
    <main>
        <section>
            <div  class="halamanutama">
                <header>
                    <h1>DATA TELAH TERHAPUS</h1>
                </header>
               
                </br>
                </br>
         
                        <a href="RegisterKaryawan.jsp"><button class="btncari">Kembali</button></a>
            
                
                 </br>
                </br>
                
                <footer>
            <h4>&copy; Waroeng 2022</h4>
            </footer>

            </div>
        </section>
    </main>
</body>

</html>

