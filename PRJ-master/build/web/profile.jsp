<%@page import="prj.dal.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <link rel="icon" href="images/logo.png"/> 
        <link rel="stylesheet" href="./css/styleprofile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    </head>
    <style type="text/css">
        body{
            background-color:#f2f6fc;
            color:#69707a;
        }
        .img-account-profile {
            height: 10rem;
        }
        .rounded-circle {
            width: 150px;
            border-radius: 50% !important;
        }
        .card .card-header {
            font-weight: 500;
        }
        .card-header:first-child {
            border-radius: 0.35rem 0.35rem 0 0;
        }
        .card-header {
            padding: 1rem 1.35rem;
            margin-bottom: 0;
            background-color: rgba(33, 40, 50, 0.03);
            border-bottom: 1px solid rgba(33, 40, 50, 0.125);
        }

        #buttonVip2{
            display: none;
        }

        .form-control, .dataTable-input {
            display: block;
            width: 100%;
            padding: 0.875rem 1.125rem;
            font-size: 0.875rem;
            font-weight: 400;
            line-height: 1;
            color: #69707a;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #c5ccd6;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: 0.35rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .nav-borders .nav-link.active {
            color: #0061f2;
            border-bottom-color: #0061f2;
        }
        .nav-borders .nav-link {
            color: #69707a;
            border-bottom-width: 0.125rem;
            border-bottom-style: solid;
            border-bottom-color: transparent;
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            padding-left: 0;
            padding-right: 0;
            margin-left: 1rem;
            margin-right: 1rem;
        }

        body {
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            width: 100%;
            font-family: "Nunito", sans-serif;
            background-image: url('https://images5.alphacoders.com/107/1070518.jpg');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }


        .card{
            border: none;
            border-radius: 10px;
            width: 100%;
            margin-top: 10%;
        }

        .fa-ellipsis-v{
            font-size: 10px;
            color: #C2C2C4;
            margin-top: 6px;
            cursor: pointer;
        }
        .text-dark{
            font-weight: bold;
            margin-top: 8px;
            font-size: 13px;
            letter-spacing: 0.5px;
        }
        .card-bottom{
            background: #3E454D;
            border-radius: 6px;
        }
        .flex-column{
            color: #adb5bd;
            font-size: 13px;
        }
        .flex-column p{
            letter-spacing: 1px;
            font-size: 18px;
        }
        .btn-secondary{
            height: 40px!important;
            margin-top: 3px;
        }
        .btn-secondary:focus{
            box-shadow: none;
        }
    </style>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("USER");
        %>
        <c:set var="url" value="profile.jsp"/> 
        <header style="background-color: rgba(0, 0, 0, 0.7); color: white; padding: 10px 0; font-family: Lato, sans-serif">
            <div class="row align-items-center" style="margin: 0">
                <div class="col-lg-2" style="padding: 0px">
                    <div class="logo">
                        <a href="MainController?btAction=GetUrl&url=home.jsp"><img src="images/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-3" style="padding: 0px">
                    <div class="main_menu menu_two menu_position">
                        <nav>
                            <ul>
                                <li>
                                    <a href="MainController?btAction=GetUrl&url=home.jsp">Home</a>
                                </li>
                                <li><a href="MainController?btAction=GetUrl&url=about_us.jsp">About Us</a></li>
                                <li><a href="MainController?btAction=GetUrl&url=contact.jsp">Contact Us</a></li>
                                <li>
                                    <a href="MainController?btAction=GetUrl&url=profile.jsp" class="active">Profile</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-6" style="padding: 0px; display: flex; justify-content: flex-end; align-items: center">
                    <%@ include file="header_right.jsp"%>
                </div>
            </div>
        </header>

        <div class="container light-style flex-grow-1 container-p-y">
            <h4 class="font-weight-bold py-3 mb-4">
                Account settings
            </h4>
            <div class="card overflow-hidden">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action active" data-toggle="list"
                               href="#account-info">Infor</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-change-password">Change password</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane fade active show" id="account-info">
                                <form action="MainController" method="POST">
                                    <hr class="border-light m-0">
                                    <div class="card-body">
                                        <input type="hidden" class="form-control mb-1" name="userName" value="<%=user.getUserName()%>" required>  
                                        <input type="hidden" class="form-control mb-1" name="password" value="<%=user.getPassword()%>" required>  
                                        <div class="form-group">
                                            <label class="form-label">Last Name</label>

                                            <input type="text" class="form-control" name="lastName" placeholder="<%=user.getLastName()%>" required>  
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Phone</label>
                                            <input type="text" class="form-control" name="phone" placeholder="<%=user.getPhone()%>" required>  

                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">MemberShip</label>
                                            <input type="hidden" class="form-control" placeholder="None">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Address</label>
                                            <input type="text" class="form-control" name="address" placeholder="<%=user.getAddress()%>" required>  

                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">E-mail</label>
                                            <input type="text" class="form-control mb-1" name="email" placeholder="<%=user.getEmail()%>" required>  

                                        </div>
                                    </div>


                                    <div class="text-right mt-3">
                                        <input type="submit" name="btAction" value="Save" class="btn btn-primary"/>
                                    </div>
                                </form>


                                <h4>${requestScope.UPDATE}</h4>
                            </div>

                            <div class="tab-pane fade" id="account-change-password">
                                <form action="MainController" method="POST">
                                    <div class="card-body pb-2">
                                        <input type="hidden" name="userName" value="<%=user.getUserName()%>" class="form-control">
                                        <div class="form-group">
                                            <label class="form-label">New password</label>
                                            <input type="password" name="newPassword" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Repeat password</label>
                                            <input type="password" name="repeatPassword" class="form-control">
                                        </div>
                                        <div class="text-right mt-3">
                                            <input type="submit" name="btAction" value="SavePassword" class="btn btn-primary"/> 
                                        </div>
                                        <h4>${requestScope.UPDATE_PASSWORD}</h4>
                                    </div>
                                </form>
                            </div>


                            </form>
                        </div>
                        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
                        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
                        <script type="text/javascript">

                        </script>
                        </body>

                        </html>
