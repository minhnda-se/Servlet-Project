<%-- 
    Document   : ProductAD
    Created on : Aug 19, 2024, 9:58:07 PM
    Author     : huusa
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order List</title>
        <%@include file="htmlhead.jsp" %>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f4f4f4;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            .table-container {
                overflow-x: auto;
                margin: 20px 0;
            }

            table {
                width: 100%;
                min-width: 1000px; /* Adjust as needed */
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            td img {
                max-width: 100px;
                height: auto;
                border-radius: 5px;
            }

            td input[type="text"], 
            td input[type="number"] {
                width: 100%;
                box-sizing: border-box;
            }

            td input[type="submit"] {
                width: auto;
                padding: 6px 12px;
            }
        </style>
    </head>
    <body>
        <c:set var="orderList" value="${sessionScope.ORDER_LIST_ADMIN}"/>
        <p>${requestScope.MESSAGE}</p>
        <a href="adminpage.jsp">Admin Page</a> | 
        <c:if test="${not empty orderList}">
            <table border="1">
                <thead>
                <th>No.</th> <th>ID</th> <th>Date</th> <th>Total Price</th> <th>Status</th> <th>Action</th>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderList}" varStatus="i">
                    <form action="MainController" method="GET">
                        <tr>
                            <td>${i.index+1}</td>
                            <td><input type="hidden" name="orderID" value="${order.orderID}"/>${order.orderID}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.totalPrice}</td>
                            <td>${order.status}</td>
                            <td><input type="submit" name="action" value="CheckOrder"/></td>
                        </tr>
                    </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
