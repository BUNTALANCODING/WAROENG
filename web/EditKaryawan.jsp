<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String nama = request.getParameter("namakar");
        String HP = request.getParameter("NO");
        String alamat = request.getParameter("ADD");
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/waroeng","root","");
        pst = con.prepareStatement("update karyawan set NamaKaryawan = ?,NoHP =?,Alamat= ?,Username=?,Password=? where IDKaryawan = ?");
        pst.setString(1, nama);
        pst.setString(2, HP);
        pst.setString(3, alamat);
         pst.setString(4, username);
         pst.setString(5, password);
         pst.setString(6, id);
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
        <<main>
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
                          
                        pst = con.prepareStatement("select * from karyawan where IDKaryawan = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div>
                        <label class="form-label">Nama Karyawan</label>
                        <input type="text" class="form-control" placeholder="Nama Karyawan" value="<%= rs.getString("NamaKaryawan")%>" name="namakar" id="namakar" required >
                     </div>
                         
                    <div>
                        <label class="form-label">No HP</label>
                        <input type="text" class="form-control" placeholder="No HP" name="NO" value="<%= rs.getString("NoHP")%>" id="NO" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Alamat</label>
                        <input type="text" class="form-control" placeholder="Alamat" name="ADD" id="ADD" value="<%= rs.getString("Alamat")%>" required >
                     </div>
                     
                       <div>
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" placeholder="Username" name="user" id="user" value="<%= rs.getString("Username")%>" required >
                     </div>
                     
                       <div>
                        <label class="form-label">Password</label>
                        <input type="text" class="form-control" placeholder="Password" name="pass" id="pass" value="<%= rs.getString("Password")%>" required >
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
                    <a href="RegisterKaryawan.jsp"><button class="btnlogout">Kembali</button></a>
            </footer>
            </div>
        </main>
        
                      
        
      
        
  
    </body>
</html>