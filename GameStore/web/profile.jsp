<%-- 
    Document   : profile
    Created on : Aug 15, 2024, 2:57:59 PM
    Author     : Anh Minh
--%>

<%@page import="gamestore.dto.ValidData"%>
<%@page import="gamestore.dto.OrderDTO"%>
<%@page import="gamestore.dao.OrderDAO"%>
<%@page import="gamestore.dto.ItemDTO"%>
<%@page import="java.util.List"%>
<%@page import="gamestore.dao.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Your Profile</title>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Game Store 301</title>
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <!-- font awesome style -->
        <link href="./fontawesome-free-6.6.0-web/css/all.min.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <!--fix style css-->
        <link href="./css/fix-style.css" rel="stylesheet"/>
        <link rel="icon" href="images/logoefvfv.png"/> 
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
            ValidData vd = (ValidData) request.getAttribute("VALIDATION");

            boolean userNameLengthError = false;
            boolean passwordlengthError = false;
            boolean notMatchhError = false;
            boolean passwordFormatError = false;
            boolean phoneNumberFormatError = false;
            boolean phoneNumberLengthError = false;
            boolean isUserNameExisted = false;
            boolean isEmailExisted = false;
            if (vd != null) {
                userNameLengthError = vd.isUserNameLengthError();
                passwordlengthError = vd.isPasswordlengthError();
                passwordFormatError = vd.isPasswordFormatError();
                notMatchhError = vd.isNotMatchhError();
                phoneNumberFormatError = vd.isPhoneNumberFormatError();
                phoneNumberLengthError = vd.isPhoneNumberLengthError();
                isUserNameExisted = vd.isIsUserNameExisted();
                isUserNameExisted = (boolean) request.getAttribute("User_CHECK");
                isEmailExisted = (boolean) request.getAttribute("Email_CHECK");
            }
        %>
        <c:set var="url" value="profile.jsp"/> 
        <!-- header section starts -->
        <%@ include file="header.jsp"%>
        <!-- end header section -->

        <div class="container light-style flex-grow-1 container-p-y">
            <h4 class="font-weight-bold py-3 mb-4">
                Hi, ${sessionScope.USER_INFORMATION.userName}
            </h4>
            <div class="card overflow-hidden">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action active" data-toggle="list"
                               href="#account-info">Your Information</a>
                            <c:if test="${sessionScope.USER_INFORMATION.role eq 'admin'}">
                                <a class="list-group-item list-group-item-action" href="adminpage.jsp">
                                    Admin Page
                                </a>
                            </c:if>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-history-order">Order History</a>
                            <a class="list-group-item list-group-item-action"
                               href="MainController?action=Logout">Logout</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane fade active show" id="account-info">
                                <form action="MainController" method="POST">
                                    <hr class="border-light m-0">
                                    <div class="card-body">
                                        <input type="hidden" class="form-control mb-1" name="userName" value="" required>  
                                        <input type="hidden" class="form-control mb-1" name="password" value required>  
                                        <div class="form-group">
                                            <label class="form-label">UserName</label>
                                            <input type="text" class="form-control" name="newUserName"  value="${sessionScope.USER_INFORMATION.userName}" required>  
                                            <% if (isUserNameExisted) {%>
                                            <div class="error-message">
                                                User Name is Existed!
                                            </div>
                                            <% }%>
                                        </div>

                                        <% if (userNameLengthError) {%>
                                        <div class="error-message">
                                            User Name must be from 4-20 characters!
                                        </div>
                                        <% }%>
                                        <div class="form-group">
                                            <label class="form-label">Phone Number</label>
                                            <input type="text" class="form-control" name="newPhoneNumber" value="${sessionScope.USER_INFORMATION.phoneNumber}" required>  
                                        </div>
                                        <% if (phoneNumberFormatError) {%>
                                        <div class="error-message">
                                            The phone number must be numeric!
                                        </div>
                                        <% }%>
                                        <% if (phoneNumberLengthError) {%>
                                        <div class="error-message">
                                            The phone number must be 10 digits!
                                        </div>
                                        <% }%>
                                        <div class="form-group">
                                            <label class="form-label">E-mail</label>
                                            <input type="email" class="form-control mb-1" name="newEmail" value="${sessionScope.USER_INFORMATION.email}"  required>
                                        </div>
                                        <% if (isEmailExisted) {%>
                                        <div class="error-message">
                                            Email is Existed!
                                        </div>
                                        <% }%>
                                        <div class="form-group">
                                            <label class="form-label">New password</label>
                                            <input type="password" name="newPassword" class="form-control" value="${sessionScope.USER_INFORMATION.password}">
                                        </div>
                                        <% if (passwordFormatError) {%>
                                        <div class="error-message">
                                            The password must include lowercase letters, uppercase letters, numbers, and special characters!
                                        </div>
                                        <% }%>
                                        <% if (passwordlengthError) {%>
                                        <div class="error-message">
                                            The password must be more than 6 characters!
                                        </div>
                                        <% }%>
                                        <div class="form-group">
                                            <label class="form-label">Confirm password</label>
                                            <input type="password" name="newConfirm" class="form-control" value="${sessionScope.USER_INFORMATION.password}">
                                        </div>
                                        <% if (notMatchhError) {%>
                                        <div class="error-message">
                                            The confirm password does not match!
                                        </div>
                                        <% }%>
                                        <div class="form-group">
                                            <input class="form-check-input" type="checkbox" value="" name="iAgree" id="iAgree" required>
                                            <label class="form-check-label text-secondary" for="iAgree">
                                                After change the information, you need to log in again!
                                            </label>
                                        </div>
                                    </div>
                                    <div class="text-right mt-3">
                                        <input type="submit" name="action" value="Save" class="btn btn-primary"/>
                                    </div>

                                </form>
                            </div>
                            <div class="tab-pane fade" id="account-history-order">
                                <%
                                    OrderDAO orderDAO = new OrderDAO();
                                    List<OrderDTO> cart = orderDAO.getOrderList((int) session.getAttribute("USER_ID"));
                                    if (cart != null) {
                                        for (int i = 0; i < cart.size(); i++) {
                                            OrderDTO item = cart.get(i);
                                %>    
                                <form action="MainController">
                                    <div class="ibox-content">
                                        <div class="table-responsive">
                                            <table class="table shoping-cart-table">
                                                <tbody>
                                                    <tr>
                                                        <td width="90">
                                                            <div class="cart-product-imitation">
                                                            </div>
                                                        </td>
                                                        <td class="desc">
                                                            <h3>
                                                                <a href="#" class="text-navy">
                                                                    <%=item.getOrderID()%>
                                                                </a>
                                                            </h3>
                                                            <p class="small">
                                                                <%=item.getOrderDate()%>
                                                            </p>
                                                            <dl class="small m-b-none">
                                                                <dt>Status</dt>
                                                                <dd><%=item.getStatus()%></dd>
                                                            </dl>
                                                            <div class="m-t-sm">
                                                                <input type="hidden" name="gameId" value="<%=item.getOrderID()%>">
                                                                <a href="#" class="text-muted"><i class="fa fa-arrow-up"></i> View Now</a>
                                                            </div>


                                                        </td>
                                                        <td>
                                                            <h4>
                                                                <%=item.getTotalPrice()%>
                                                            </h4>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </form>
                                <%}
                                    }%>
                            </div>
                        </div>
                        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
                        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
                        <script type="text/javascript">

                        </script>
                        </body>

                        </html>