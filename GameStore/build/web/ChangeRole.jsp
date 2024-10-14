<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="gamestore.dto.UserDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change User Role</title>
        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f0f8ff; /* Màu nền xanh dương nhạt */
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff; /* Màu trắng cho container */
                border-radius: 5px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            form {
                display: flex;
                flex-direction: column;
                margin-bottom: 20px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input[type="text"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
            }

            button[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                text-align: left;
                padding: 8px;
                border: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <h2>Change User Role</h2>
        <!-- Form to change user role -->
        <form action="ChangeUserRoleServlet" method="POST">
            <label for="userId">User ID:</label>
            <input type="text" name="userId" required>
            <label for="newRole">New Role:</label>
            <input type="text" name="newRole" required>
            <button type="submit">Change Role</button>
        </form>
        <!-- Display results -->
        <div class="results">
            <%
                UserDTO user = (UserDTO) request.getAttribute("user");
                String message = (String) request.getAttribute("message");

                if (message != null) {
                    out.println("<p style='color:green;'>" + message + "</p>");
                }

                if (user != null) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>UserID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= user.getUserID()%></td>
                        <td><%= user.getUserName()%></td>
                        <td><%= user.getEmail()%></td>
                        <td><%= user.getPhoneNumber()%></td>
                        <td><%= user.getRole()%></td>
                    </tr>
                </tbody>
            </table>
            <%
                } else {
                    if (message == null) {
                        out.println("<p>No user information available.</p>");
                    }
                }
            %>
        </div>
        <div>
            <form action="adminpage.jsp" method="post">
                <button type="submit">Return </button>
            </form>
        </div>
    </body>
</html>
