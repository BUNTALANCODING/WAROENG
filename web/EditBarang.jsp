<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String status = request.getParameter("sts");
        String nama = request.getParameter("namabar");
        String harga = request.getParameter("price");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/waroeng","root","");
        pst = con.prepareStatement("update produk set sts_produk = ?,nm_produk =?,harga_produk= ? where id_produk  = ?");
        pst.setString(1, status);
        pst.setString(2, nama);
        pst.setString(3, harga);
         pst.setString(4, id);
        pst.executeUpdate();  
        
        %>
        
 
    <%             
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/AdminMenu.css" rel="stylesheet" type="text/css"/>
        
        
        
    </head>
    <body>
        <main>
            <div class="halamanutama">
                  <header>
                    <h1>Welcome Admin <%=session.getAttribute("userid")%></h1>
                </header>
                </br>
        
            <div claass="iniform">
                <form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/waroeng","root","");
                           
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from Produk where id_produk = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div>
                        <label class="form-label">Status Barang</label>
                        <input type="text" class="form-control" placeholder="Status Barang" value="<%= rs.getString("sts_produk")%>" name="sts" id="sts" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Nama Barang</label>
                        <input type="text" class="form-control" placeholder="Nama Barang" name="namabar" value="<%= rs.getString("nm_produk")%>" id="namabar" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Harga</label>
                        <input type="text" class="form-control" placeholder="Alamat" name="price" id="price" value="<%= rs.getString("harga_produk")%>" required >
                     </div>

                    <% }  %>

                         </br>
                         
                     <div>
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         </br>
                </form>
            </div>
                <footer>
                    <a href="TambahBarang.jsp"><button class="btnlogout">Kembali</button></a>
            </footer>
            </div>
        </main>
    </body>
</html>