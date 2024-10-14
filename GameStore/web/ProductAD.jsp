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
        <title>Product List</title>
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
        <c:set var="gameList" value="${sessionScope.GAME_LIST}"/>
        <p>${requestScope.MESSAGE}</p>
        <a href="adminpage.jsp">Admin Page</a> | 
        <c:if test="${not empty gameList}">
            <table border="1">
                <thead>
                <th>No.</th> <th>ID</th> <th>Name</th> <th>Platform</th> <th>Publisher</th> <th>Publication Year</th> 
                <th>Category</th> <th>Price</th> <th>Stock Quantity</th> <th>Description</th> <th>Image</th> <th colspan="2">Action</th>
                </thead>
                <tbody>
                    <c:forEach var="game" items="${gameList}" varStatus="i">
                    <form action="MainController" method="GET">
                        <tr>
                            <td>${i.index+1}</td>
                            <td><input type="hidden" name="gameId" value="${game.gameId}"/>${game.gameId}</td>
                            <td><input type="text" name="name" value="${game.name}"/></td>
                            <td><input type="text" name="platform" value="${game.platform}"/></td>
                            <td><input type="text" name="publisher" value="${game.publisher}"/></td>
                            <td><input type="number" name="publication_year" value="${game.publication_year}"/></td>
                            <td><input type="text" name="category" value="${game.category}"/></td>
                            <td><input type="number" name="price" value="${game.price}"/></td>
                            <td><input type="number" name="stock" value="${game.stock}"/></td>
                            <td><input type="text" name="description" value="${game.description}"/></td>
                            <td><input type="text" name="image_game" value="${game.image_game}"/></td>
                            <td><input type="submit" name="action" value="Update"/></td>
                            <td><input type="submit" name="action" value="Delete"/></td>
                        </tr>
                    </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
