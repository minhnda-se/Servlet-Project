<%-- 
    Document   : refine
    Created on : Dec 20, 2023, 7:55:37 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.DecimalFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PREMIUM ROYAL JEWELRY</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <link rel="stylesheet" href="css/style_1.css">
        <style>
            li a:hover {
                color: #F0E68C;
            }
            ul li a.active {
                color: #F0E68C;
            }

            .li_header {
                color: white;
                margin-left: 50px;
                font-size: 18px;
            }

            .submit-price {
                font-size: 16px;
                background-color: black;
                color: white;
                font-weight: 600;
                padding: 5px 40px;
                border-radius: 20px;
                margin: 10px 0 20px
            }

            .submit-price:hover {
                background-color: rgba(0,0,0,0.3);
                color: black;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <div id="header_right">
            <div class="header_top_right">
                <div class="header_right_info">
                    <ul>
                        <li class="user">
                            <c:if test="${empty sessionScope.USER}">
                                <a href="MainController?btAction=InLogin&urlName=${sessionScope.URL}" title="Icon User">
                                    <i class="fa fa-user-circle"></i>
                                </a>
                            </c:if>
                            <c:if test="${not empty sessionScope.USER}">
                                <a href="MainController?btAction=GetUrl&url=profile.jsp" title="${sessionScope.USER.lastName}">
                                    <i class="fa fa-user-circle"></i>
                                </a>
                            </c:if>
                        </li>
                        <li class="user">
                            <a href="MainController?btAction=GetUrl&url=viewcart.jsp" title="View Cart">
                                <i class="fa fa-shopping-cart"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="header_account">
                    <ul>
                        <li class="top_links">
                            <a href="#">
                                <i class="fa fa-cog"></i>
                            </a>
                            <ul class="dropdown_links">
                                <li><a href="MainController?btAction=GetUrl&url=profile.jsp">My Account</a></li>
                                <li><a href="MainController?btAction=GetUrl&url=refine.jsp">Shopping</a></li>
                                <li><a href="MainController?btAction=Logout">Logout</a></li>
                            </ul>
                        </li>
                        <c:if test="${sessionScope.account!=null}">
                            <li onclick="change()" style="position: relative; cursor: pointer;">
                                <img src="${sessionScope.imageUser}" width="40px" style="color: white; border-radius: 50% ;border: 2px solid white;">
                                <ul id="avt" class="header_avt" style="margin-top:25px;
                                    position: absolute;
                                    left: -96px ;
                                    background-color: white;
                                    color: black;
                                    padding: 10px;
                                    max-width: 160px;
                                    z-index: 1;
                                    border-radius: 5px;
                                    box-shadow: 0 1px 3.125rem 0 rgba(0, 0, 0, 0.2);">
                                    <li class="option_avt"><a href="#">Checkout</a>
                                    <li class="option_avt"><a href="${sessionScope.account.roleID==1?"admin":"profile"}">My Account</a></li>
                                    <li class="option_avt">

                                        <a id="logout" data-toggle="modal" data-target="#modal_box" href="#" onclick="confirmLogout('modal_box')">
                                            <i class="fa-solid fa-right-from-bracket"></i>
                                            ${sessionScope.account==null ? "": "Logout"}
                                        </a>
                                    </li>
                                </ul>

                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>   
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
        <script src="js/countdown.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <script src="js/clickevents.js"></script>

        <script type="text/javascript">
                                            function change() {
                                                var a = document.getElementById("avt");
                                                if (a.style.display === 'none' || a.style.display === '') {
                                                    a.style.display = 'block';
                                                } else {
                                                    a.style.display = 'none';
                                                }
                                            }
        </script>

    </body>
</html>
