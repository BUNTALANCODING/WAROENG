<%-- 
    Document   : indexutama
    Created on : Jul 10, 2022, 7:29:49 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 
    if(request.getParameter("submit")!=null)
    {
        String nama = request.getParameter("namakar");
        String HP = request.getParameter("HP");
        String alamat = request.getParameter("ADD");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/waroeng","root","");
        pst = con.prepareStatement("insert into karyawan(NamaKaryawan, NoHP, Alamat, Username, Password)values(?,?,?,?,?)");
        pst.setString(1, nama);
        pst.setString(2, HP);
        pst.setString(3, alamat);
        pst.setString(4, user);
         pst.setString(5, pass);
        pst.executeUpdate();  
        
        %>

<%            
    }
   %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="CSS/AdminMenu.css" rel="stylesheet" type="text/css" />
    <title>Waroeng</title>
</head>

<body>
    <main>
        <section>
            <div class="halamanutama">
                <header>
                    <h1>Welcome Admin <%=session.getAttribute("userid")%></h1>
                </header>

                </br>
                </br>
                <form>
                    <label class="form-label">Nama Karyawan</label>
                    <input type="text" class="form-control" placeholder="Nama Karyawan" name="namakar" id="namakar"
                        required></br>
                    <label class="form-label">No HP</label>
                    <input type="text" class="form-control" placeholder="No HP" name="HP" id="HP" required></br>
                    <label class="form-label">Alamat</label>
                    <input type="text" class="form-control" placeholder="Alamat" name="ADD" id="ADD" required></br>
                    <label class="form-label">Username</label>
                    <input type="text" class="form-control" placeholder="Username" name="user" id="user" required></br>
                    <label class="form-label">Password</label>
                    <input type="text" class="form-control" placeholder="Password" name="pass" id="pass" required></br>

                    <input type="submit" id="submit" value="submit" name="submit" class="btnlogout">
                </form>
                </br>
                </br>


                <div class="panel-body">
                    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Nama Karyawan</th>
                                <th>NoHP</th>
                                <th>Alamat</th>
                                <th>Username</th>
                                <th>Password</th>

                            </tr>

                            <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/waroeng","root","");
                                
                                  String query = "select * from karyawan";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("IDKaryawan");
                                   %>

                            <tr>
                                <td><%=rs.getString("NamaKaryawan") %></td>
                                <td><%=rs.getString("NoHP") %></td>
                                <td><%=rs.getString("Alamat") %></td>
                                <td><%=rs.getString("Username") %></td>
                                <td><%=rs.getString("Password") %></td>
                                <td><a href="EditKaryawan.jsp?id=<%=id%>">Edit</a></td>
                                <td><a href="DeleteKaryawan.jsp?id=<%=id%>">Delete</a></td>
                            </tr>


                            <%
                                
                                 }
                               %>

                    </table>
                </div>

         
          

            <footer>
                <a href="AdminMenu.jsp"><button class="btnlogout">Kembali</button></a>
            </footer>

            </div>
        </section>
    </main>
</body>

</html>