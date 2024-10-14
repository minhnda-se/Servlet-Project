<%-- 
    Document   : view_cart
    Created on : Aug 15, 2024, 2:35:14 PM
    Author     : Anh Minh
--%>

<%@page import="gamestore.dao.OrderDAO"%>
<%@page import="gamestore.dto.ItemDTO"%>
<%@page import="gamestore.dao.CartDAO"%>
<%@page import="gamestore.dao.GameDAO"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.List"%>
<%@page import="gamestore.dto.GameDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@include file="htmlhead.jsp"%>

        <title>Your Cart</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{margin-top:20px;
                 background:#eee;
            }
            h3 {
                font-size: 16px;
            }
            .text-navy {
                color: #1ab394;
            }
            .cart-product-imitation {
                text-align: center;
                width: 120px;
                height: 90px;
                background-color: #f8f8f9;
                display: flex;
                align-items: center;
                justify-content: center;
                overflow: hidden;
            }

            .cart-product-imitation img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .product-imitation.xl {
                padding: 120px 0;
            }
            .product-desc {
                padding: 20px;
                position: relative;
            }
            .ecommerce .tag-list {
                padding: 0;
            }
            .ecommerce .fa-star {
                color: #d1dade;
            }
            .ecommerce .fa-star.active {
                color: #f8ac59;
            }
            .ecommerce .note-editor {
                border: 1px solid #e7eaec;
            }
            table.shoping-cart-table {
                margin-bottom: 0;
            }
            table.shoping-cart-table tr td {
                border: none;
                text-align: right;
            }
            table.shoping-cart-table tr td.desc,
            table.shoping-cart-table tr td:first-child {
                text-align: left;
            }
            table.shoping-cart-table tr td:last-child {
                width: 80px;
            }
            .ibox {
                clear: both;
                margin-bottom: 25px;
                margin-top: 0;
                padding: 0;
            }
            .ibox.collapsed .ibox-content {
                display: none;
            }
            .ibox:after,
            .ibox:before {
                display: table;
            }
            .ibox-title {
                -moz-border-bottom-colors: none;
                -moz-border-left-colors: none;
                -moz-border-right-colors: none;
                -moz-border-top-colors: none;
                background-color: #ffffff;
                border-color: #e7eaec;
                border-image: none;
                border-style: solid solid none;
                border-width: 3px 0 0;
                color: inherit;
                margin-bottom: 0;
                padding: 14px 15px 7px;
                min-height: 48px;
            }
            .ibox-content {
                background-color: #ffffff;
                color: inherit;
                padding: 15px 20px 20px 20px;
                border-color: #e7eaec;
                border-image: none;
                border-style: solid solid none;
                border-width: 1px 0;
            }
            .ibox-footer {
                color: inherit;
                border-top: 1px solid #e7eaec;
                font-size: 90%;
                background: #ffffff;
                padding: 10px 15px;
            }
        </style>
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="wrapper wrapper-content animated fadeInRight">
                <div class="row">
                    <div class="col-md-9">
                        <div class="ibox">
                            <div class="ibox-title">
                                <h5>Order Items</h5>
                            </div>
                            <%
                                OrderDAO OrderDAO = new OrderDAO();
                                List<ItemDTO> cart = (List<ItemDTO>) session.getAttribute("ORDER_ITEM_LIST");
                                if (cart != null) {
                                    for (int i = 0; i < cart.size(); i++) {
                                        ItemDTO item = cart.get(i);
                            %>    
                            <form action="MainController">
                                <div class="ibox-content">
                                    <div class="table-responsive">
                                        <table class="table shoping-cart-table">
                                            <tbody>
                                                <tr>
                                                    <td width="120px" height="90px">
                                                        <div class="cart-product-imitation" style="width: 120px; height: 90px; overflow: hidden;">
                                                            <img src="<%= item.getGame().getImage_game()%>" style="width: 100%; height: 100%; object-fit: cover;" alt="<%= item.getGame().getName()%>">
                                                        </div>
                                                    </td>
                                                    <td class="desc">
                                                        <h3>
                                                            <a href="GetGameServlet?gameId=<%= item.getGame().getGameId()%>" class="text-navy">
                                                                <%= item.getGame().getName()%>
                                                            </a>
                                                        </h3>
                                                        <p class="small">
                                                            <%= item.getGame().getDescription()%>
                                                        </p>
                                                        <dl class="small m-b-none">
                                                            <dt>Platform</dt>
                                                            <dd><%= item.getGame().getPlatform()%></dd>
                                                        </dl>
                                                       
                                                    </td>
                                                    <td width="65">
                                                        <input type="number" name="quantity" class="form-control" value="<%= item.getQuantity()%>">
                                                    </td>
                                                    <td>
                                                        <h4>$<%= item.getSubPrice()%></h4>
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
                </div>
            </div>
        </div>
    <body>
</html>
