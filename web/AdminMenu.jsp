<%-- 
    Document   : indexutama
    Created on : Jul 10, 2022, 7:29:49 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <h1>Welcome Admin <%=session.getAttribute("userid")%></h1>
                </header>
               
                </br>
                </br>
                <div class="row">
                    <div class="col-sm-4">
                        <a href="RegisterKaryawan.jsp"><button class="btncari">Register</button></a>
                    </div>
                    <div class="col-sm-4">
                        <a href="TambahBarang.jsp"><button class="btncari">Tambah Barang</button></a>
                    </div>
                     <div class="col-sm-4">
                        <a href=""><button class="btncari">Report</button></a>
                    </div>
                </div>
                
                 </br>
                </br>
                
                <footer>
              <a href="Logout.jsp"><button class="btnlogout">Logout</button></a>
            </footer>

            </div>
        </section>
    </main>
</body>

</html>