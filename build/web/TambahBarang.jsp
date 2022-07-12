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
        String status= request.getParameter("sts");
        String nama = request.getParameter("namabar");
        String harga = request.getParameter("price");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/waroeng","root","");
        pst = con.prepareStatement("insert into produk(sts_produk, nm_produk, harga_produk)values(?,?,?)");
        pst.setString(1, status);
        pst.setString(2, nama);
        pst.setString(3, harga);
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

                    <label class="form-label">Status</label>
                    <input type="text" class="form-control" placeholder="Status" name="sts" id="sts" required></br>
                    <label class="form-label">Nama Barang</label>
                    <input type="text" class="form-control" placeholder="Nama Barang" name="namabar" id="namabar" required></br>
                    <label class="form-label">Harga</label>
                    <input type="text" class="form-control" placeholder="Harga" name="price" id="price" required></br>

                    <input type="submit" id="submit" value="submit" name="submit" class="btnlogout">
                </form>
                </br>
                </br>


                <div class="panel-body">
                    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Status Barang</th>
                                <th>Nama Barang</th>
                                <th>Harga</th>
                               

                            </tr>

                            <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/waroeng","root","");
                                
                                  String query = "select * from produk";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id_produk");
                                   %>

                            <tr>
                                <td><%=rs.getString("sts_produk") %></td>
                                <td><%=rs.getString("nm_produk") %></td>
                                <td><%=rs.getString("harga_produk") %></td>
                                <td><a href="EditBarang.jsp?id=<%=id%>">Edit</a></td>
                                <td><a href="DeleteBarang.jsp?id=<%=id%>">Delete</a></td>
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