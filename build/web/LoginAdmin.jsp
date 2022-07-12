<%-- 
    Document   : index
    Created on : May 12, 2019, 5:13:30 PM
    Author     : SEMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="CSS/LoginAdmin.css" rel="stylesheet" type="text/css"/>

    <title>Waroeng</title>
</head>

<body>
    <main>
        <section>
            <div class="halamanutama">
                <header>
                    <h1>Login Admin</h1>
                </header>

                </br>
                <div class="kotak_login">
                    <p class="tulisan_login">Please enter an Account</p>
                    <form method="POST" action="ProsesLoginAdmin.jsp">

                        <div>
                            <label class="form-label">Username</label>
                            <input type="text" class="form-control" placeholder="Username" name="usernameadmin"
                                required>
                        </div>
                        </br>
                        <div>
                            <label class="form-label">Password</label>
                            <input type="text" class="form-control" placeholder="Password" name="passwordadmin"
                                required>
                        </div>
                        </br>
                        <a href=""><button type="submit" class="btncari">Login</button></a>
                        <a href=""><button type="reset" class="btncari">Reset</button></a>
                    </form>

                </div>
            </div>
        </section>
    </main>
</body>

</html>