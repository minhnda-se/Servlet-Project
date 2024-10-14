<%@page import="gamestore.dto.UserDTO"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search Users</title>
        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f0f8ff; /* M?u n?n xanh d??ng nh?t */
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff; /* M?u tr?ng cho container */
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
        <div class="container">
            <h1>Search Users</h1>

            <!-- Form to search users by name -->
            <form action="SearchUsersServlet" method="post">
                <div class="form-group">
                    <label for="userName">Search by Username:</label>
                    <input type="text" name="userName" required="">
                </div>
                <button type="submit" name="action" value="searchByName">Search</button>
            </form>

            <!-- Form to search users by role -->
            <form action="SearchUsersServlet" method="post">
                <div class="form-group">
                    <label for="role">Search by Role:</label>
                    <input type="text" name="role" required="">
                </div>
                <button type="submit" name="action" value="searchByRole">Search</button>
            </form>

            <div class="results">
                <%
                    List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");
                    String error = (String) request.getAttribute("error");

                    if (error != null) {
                        out.println("<p style='color:red;'>" + error + "</p>");
                    }

                    if (users != null && !users.isEmpty()) {
                %>
                <table>
                    <thead>
                        <tr>
                            <th>UserID</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Phone Number</th>
                            <th>Role</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (UserDTO user : users) {
                        %>
                        <tr>
                            <td><%= user.getUserID()%></td>
                            <td><%= user.getUserName()%></td>
                            <td><%= user.getPassword()%></td>
                            <td><%= user.getEmail()%></td>
                            <td><%= user.getPhoneNumber()%></td>
                            <td><%= user.getRole()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <%
                    } else {
                        out.println("<p>No results found.</p>");
                    }
                %>
            </div>
            <div>
                <form action="adminpage.jsp" method="post">
                    <button type="submit">Return </button>
                </form>
            </div>
        </div>
    </body>
</html>
