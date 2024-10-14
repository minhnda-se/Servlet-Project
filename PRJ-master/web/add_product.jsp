<%-- 
    Document   : addProduct
    Created on : Jul 6, 2024, 9:19:01 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product Page</title>
    <style>
        
        header {
            background-color: #333;
            padding: 10px;
            color: #fff;
            text-align: center;
        }

        nav {
            margin-bottom: 20px;
        }

        nav a {
            text-decoration: none;
            color: #333;
            padding: 10px;
            margin-right: 10px;
            border-radius: 5px;
            background-color: #eee;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #333;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>

<body>
    
    
    <header>
            <h1>Add Product Page</h1>
    </header>

    
    <nav>
        <a href="admin.jsp">Return</a>
        <a href="#">Hello Admin ${sessionScope.USER.adminID}</a>
        
    </nav>
    
        
        <form id="addProductForm" action="MainController" method="post">
        <label for="productID">Product ID:</label><h5 style="color: red">${requestScope.EXISTED}</h5>
        <input type="text" id="productID" name="productID" value="" required>

        <label for="category">Category ID:</label>
        <input type="text" id="categoryID" name="category" required>
        
        <label for="productName">Product Name:</label>
        <input type="text" id="rate" name="name" required>
        
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" min="1" required>
        
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="1.00" required>

        <label for="description">Description:</label>
        <input type="text" id="description" name="description" required>
        
        <label for="sale">Sale:</label>
        <input type="number" id="sale" name="sale" step="0.01"required>

        <input type="submit" name="btAction" value="Add New Product">
        <h4 style="color: blue">${requestScope.SUCCESSFUL}</h4>
    </form>
   


</body>
</html>
