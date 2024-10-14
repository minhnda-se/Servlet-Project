
<%-- 
    Document   : adminpage
    Created on : Aug 12, 2024, 1:50:34 AM
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="gamestore.dto.UserDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="htmlhead.jsp" %>
    </head>
    <body>
        <div class="hero_area">
            <!-- header section strats -->
            <%@include file="header.jsp"%>
            <!-- end header section -->
            <!-- slider section -->
            <section class="slider_section ">
                <div class="slider_bg_box">
                    <img src="images/slider-bg.jpg" alt="">
                </div>
            </section>
            <!-- end slider section -->
        </div>
        <section class="why_section layout_padding">
            <div class="container">
                <div class="heading_container heading_center">
                    <h2>
                        Welcome Administrator 
                    </h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <form action="ChangeRole.jsp" method="get">
                        <div class="box ">
                            <button type="submit">
                                <div class="detail-box">
                                    <h5>
                                        Change User Role
                                    </h5>
                                </div>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-md-3">
                    <form action="SearchUsers.jsp" method="get">
                        <div class="box ">
                            <button type="submit">
                                <div class="detail-box">
                                    <h5>
                                        Search Users
                                    </h5>
                                </div>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-md-3">
                    <form action="MainController" method="get">
                        <div class="box ">
                            <button type="submit" name="action" value="GameList">
                                <div class="detail-box">
                                    <h5>
                                        Update Game
                                    </h5>
                                </div>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-md-3">
                    <form action="addgame.jsp" method="GET">
                        <div class="box ">
                            <button type="submit">
                                <div class="detail-box">
                                    <h5>
                                        Add Game
                                    </h5>
                                </div>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-md-3">
                    <form action="MainController" method="get">
                        <div class="box ">
                            <button type="submit" name="action" value="OrderList">
                                <div class="detail-box">
                                    <h5>
                                        Order List
                                    </h5>
                                </div>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>