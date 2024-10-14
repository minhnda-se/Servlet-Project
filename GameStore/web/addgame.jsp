<%-- 
    Document   : addgame
    Created on : Aug 20, 2024, 7:49:59 PM
    Author     : huusa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Game Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }

            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: 0 auto;
            }

            form h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .form-group {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
            }

            .form-group label {
                flex-basis: 40%;
                text-align: right;
                padding-right: 10px;
                font-weight: bold;
            }

            .form-group input[type="text"],
            .form-group input[type="number"] {
                flex-basis: 55%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-group input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            .form-group input[type="submit"]:hover {
                background-color: #218838;
            }

        </style>
    </head>
    <body>
        <h1>Add Game</h1>
        <h2>${requestScope.MESSAGE}</h2>
        <form action="MainController" method="POST">
            <a href="adminpage.jsp"> Return</a> | 

            <h2>Add New Game</h2>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" name="name" id="name"/>
            </div>
            <div class="form-group">
                <label for="platform">Platform:</label>
                <input type="text" name="platform" id="platform"/>
            </div>
            <div class="form-group">
                <label for="publisher">Publisher:</label>
                <input type="text" name="publisher" id="publisher"/>
            </div>
            <div class="form-group">
                <label for="publication_year">Publication Year:</label>
                <input type="number" name="publication_year" id="publication_year"/>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" name="category" id="category"/>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" name="price" id="price"/>
            </div>
            <div class="form-group">
                <label for="stock">Stock:</label>
                <input type="number" name="stock" id="stock"/>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" name="description" id="description"/>
            </div>
            <div class="form-group">
                <label for="image_game">Image game (path/URL):</label>
                <input type="text" name="image_game" id="image_game"/>
            </div>
            <div class="form-group">
                <input type="submit" name="action" value="AddGame"/>
            </div>
        </form>
    </body>
</html>
