<%-- 
    Document   : login
    Created on : Jun 22, 2024, 5:42:25 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <link rel="icon" href="images/logo.png"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="./css/styleregister.css">
    </head>
    <body>
        <div class="wrapper">
            <form action="MainController" method="POST">
                <h1>Login</h1>
                <div class="input-box">
                    <input type="text" placeholder="Username" name="txtUserName" required>
                    <i class='bx bxs-user'></i>
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Password" name="txtPassword" required>
                    <i class='bx bxs-lock-alt' ></i>
                </div>
                
                <div class="remember-forgot">
                    <label>
                        <input type="checkbox">Remember me</label>
                    <a href="forgot.html">Forgot password</a>
                </div>
                
                <button type="submit" name="btAction" value="Login" class="btn">Login</button>
                
                <div class="register-link">
                    <p>Don't have an account? <a href="register.jsp">Register</a></p>
                </div>    
            </form>
            <br/>
            <h5 style="color: red">     ${requestScope.ERROR}</h5>
        </div>
    </body>
</html>
