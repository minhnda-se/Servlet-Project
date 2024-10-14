MainController?btAction=GetUrl&url=<%@page import="prj.error.RegisterError"%>
<%@page import="prj.error.RegisterError"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Register Form</title>
        <link rel="icon" href="images/logo.png"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="./css/styleregister.css">
        <style>

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background: url('https://4kwallpapers.com/images/walls/thumbs_3t/13418.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Arial', sans-serif;
                color: #fff;
            }

            .container {
                background: rgba(0, 0, 0, 0.7);
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                max-width: 400px;
                width: 100%;
                text-align: center;
            }

            .container h2 {
                color: #e74c3c;
                margin-bottom: 20px;
                text-align: center;
                font-weight: bold;
            }

            .container p {
                text-align: center;
                font-size: 14px;
                margin-bottom: 20px;
            }

            .fxt-logo img {
                width: 100px;
                display: block;
                margin: 0 auto;
                margin-bottom: 20px;
                position: relative;
                top:10px;
            }

            .form-group {
                position: relative;
                margin-bottom: 20px;
            }

            .form-control {
                background-color: rgba(255, 255, 255, 0.15);
                border: none;
                border-radius: 5px;
                color: #fff;
                padding: 12px 15px;
                width: 100%;
                transition: background-color 0.3s;
            }

            .form-control:focus {
                background-color: rgba(255, 255, 255, 0.25);
                color: white;
                outline: none;
            }

            .form-group i {
                position: absolute;
                right: 20px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 20px;
                color: rgba(255, 255, 255, 0.7);
            }

            .btn-primary {
                background-color: #e74c3c;
                border: none;
                border-radius: 5px;
                color: #fff;
                font-size: 16px;
                padding: 12px 0;
                width: 100%;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn-primary:hover {
                background-color: #c0392b;
            }
        </style>
    </head>
    <body>
        <%

            RegisterError errors = (RegisterError) request.getAttribute("ERROR");
            String userName = "";
            String pass = "";
            String phone = "";
            String email = "";
            String address = "";
            if (errors != null) {
                userName = errors.getUserName();
                pass = errors.getPassword();
                phone = errors.getPhone();
                email = errors.getEmail();
                address = errors.getAddress();
            }
            String exist = (String) request.getAttribute("EXISTED");
        %>


        <div class="container">
            <div class="text-center mb-4">
                <a href="MainController?btAction=GetUrl&url=home.jsp" class="fxt-logo"><img src="images/logo.png" alt="Logo"></a>
                <h2 class="text-danger">Register</h2>
                <p>Create an account free and enjoy it</p>
            </div>
            <form action="MainController" id="form" method="post">
                <div class="form-group position-relative">
                    <input type="text" class="form-control" name="name" placeholder="Full Name" required>                   
                    <i class="fas fa-user"></i>
                </div>
                <div class="form-group position-relative">
                    <input type="text" class="form-control" name="username" placeholder="User Name" required>

                    <i class='bx bxs-user'></i>

                </div>
                <%
                      if(userName!=null){  
                %>                    
                <font color="red"><%=userName%> </font>                   
                <%}%>

                <%
                  if(exist!=null){                        
                %>
                <font color="red"><%=exist%></font> 
                <%}%>
                <div class="form-group position-relative">
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                    <i class='bx bxs-lock-alt'></i>
                </div>   
                    
                    <%
                      if(pass!=null){  
                    %>    
                    <font color="red"><%=pass%> </font>
                    <%}%>
                  
                <div class="form-group position-relative">
                    <input type="text" class="form-control" name="phone" placeholder="Your Phone" required>
                    <i class='bx bxs-phone'></i>
                </div>
                    <%
                      if(phone!=null){  
                    %>    
                    <font color="red"><%=phone%> </font>
                    <%}%>
                    
                <div class="form-group position-relative">
                    <input type="email" class="form-control" name="email" placeholder="Your Email" required>

                    <i class='bx bxs-envelope' ></i>
                </div>
                <div class="form-group position-relative">
                    <input type="text" class="form-control" name="address" placeholder="Your Address" required>
                    <i class='bx bxs-location-plus'></i>
                </div>
                    <%
                      if(address!=null){  
                    %>    
                    <font color="red"><%=address%> </font>
                    <%}%>
                    

                <div class="form-group">
                    <button type="submit" onclick="submitForm()" class="btn btn-primary btn-block" name="btAction" value="Register">Register</button>
                    <!--                <input type="submit" name="btAction" value="Register"/>-->
                </div>
                    
            </form>
                    Already have account? <a href="MainController?btAction=GetUrl&url=login.jsp">Login</a>
        </div>

    </body>
</html>
