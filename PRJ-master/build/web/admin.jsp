<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/logo.png"/>
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/styleAdmin.css">

        <title>AdminHub</title>

        <style>
            /* General table styles */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px; /* Add some spacing */
            }

            th, td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                color: #333;
                text-align: center;
            }

            /* Links in table */
            a {
                text-decoration: none;
                color: #007bff; /* Bootstrap blue color */
            }

            /* Buttons */
            button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 8px 16px;
                cursor: pointer;
                border-radius: 4px;
            }

            button:hover {
                background-color: #0056b3; /* Darker shade of blue on hover */
            }

            /* Form input style */
            input[type="text"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 110px;
            }
            
            input[type="number"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 110px;
        }
        </style>
    </head>
    <body>
        <c:set var="productList" value="${sessionScope.PRODUCT_LIST}"/>
        <c:set var="categoryList" value="${sessionScope.CATEGORY_LIST}"/>
        <c:set var="orderList" value="${sessionScope.ORDER_LIST}"/>
        <c:set var="visitorList" value="${sessionScope.VISITOR_LIST}"/>
        <c:set var="dashboard" value="dashboard"/>
        <c:set var="mystore" value="mystore"/>
        <c:set var="message" value="message"/>
        <c:set var="team" value="team"/>
        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">
                <i class='bx bxs-smile'></i>
                <span class="text">AdminHub</span>
            </a>
            <ul class="side-menu top">
                <li class="active">
                    <a href="MainController?btAction=adminAction&action=dashboard">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="MainController?btAction=adminAction&action=mystore">
                        <i class='bx bxs-shopping-bag-alt' ></i>
                        <span class="text">My Store</span>
                    </a>
                </li>

                <li>
                    <a href="MainController?btAction=adminAction&action=team">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Team</span>
                    </a>
                </li>
            </ul>
            <ul class="side-menu">
                <li>
                    <a href="MainController?btAction=Logout" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <a href="#" class="nav-link">Categories</a>
                <form action="#">
                    <div class="form-input"></div>
                </form>
                <input type="checkbox" id="switch-mode" hidden>
                <label for="switch-mode" class="switch-mode"></label>
                <a href="#" class="notification">
                    <i class='bx bxs-bell' ></i>
                    <span class="num">8</span>
                </a>
                <a href="#" class="profile">
                    <img src="images/admin.png">
                </a>
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <c:if test="${requestScope.ADMIN_ACTION eq dashboard or empty requestScope.ADMIN_ACTION}">
                <main>
                    <div id="dashbroad" class="content-section">
                        <!-- Dashboard content -->
                        <div class="head-title">
                            <div class="left">
                                <h1>Dashboard</h1>
                            </div>
                        </div>

                        <ul class="box-info">
                            <li>
                                <i class='bx bxs-calendar-check' ></i>
                                <span class="text">
                                    <h3>${orderList.size()}</h3>
                                    <p>Total Orders</p>
                                </span>
                            </li>
                            <li>
                                <i class='bx bxs-group' ></i>
                                <span class="text">
                                    <h3>${visitorList.size()}</h3>
                                    <p>Visitors</p>
                                </span>
                            </li>
                            <li>
                                <i class='bx bxs-dollar-circle' ></i>
                                <span class="text">
                                    <h3>${orderList.getTotalMoney()}</h3>
                                    <p>Total Sales</p>
                                </span>
                            </li>
                        </ul>

                        <!-- Recent Orders table -->
                        <div class="table-data">
                            <div class="order">
                                <div class="head">
                                    <h3>Recent Orders</h3>
                                    <i class='bx bx-search' ></i>
                                    <i class='bx bx-filter' ></i>
                                </div>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>User</th>
                                            <th>Date Order</th>
                                            <th>OrderID</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${orderList}">
                                            <c:if test="${order.date eq sessionScope.CURRENT_DATE}">
                                                <tr>

                                                    <td>
                                                        <img src="img/people.png">
                                                        <p>${order.lastName}</p>
                                                    </td>
                                                    <td>${order.date}</td>
                                                    <td>${order.id}</td>
                                                    <td><span class="status completed">Completed</span></td>
                                                </c:if>

                                            </tr>  
                                        </c:forEach> 

                                        <!-- Add more rows as needed -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </c:if>
            
            <c:if test="${requestScope.ADMIN_ACTION eq mystore}">
        <div id="mystore" class="content-section">
            <!-- My Store content -->
            <!-- You can fill this section with your store management content -->
            <table border="1">
            <thead>
                <tr>
                    <th style="text-align: center">
                        <div>
                            Category<br/>
                            <form action="MainController" method="POST">
                                <input type="text" name="category" placeholder="Add a new category.."/>
                                <button type="submit" name="btAction" value="AddCategory">ADD A NEW CATEGORY</button>
                            </form>
                        </div>
                    </th>
                    <th style="text-align: center">
                        <div>
                            Product<br/>
                            <form action="MainController" method="POST">
                                <input type="hidden" name="url" value="add_product.jsp"/>
                                <button type="submit" name="btAction" value="GetUrl">ADD A NEW PRODUCT</button>
                            </form>
                        </div>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <!--Category-->
                    <td>
                        <div style="text-align: center">
                            <a href="MainController?btAction=SelectCategory">All</a><br/>
                            <c:forEach var="category" items="${categoryList}">
                                <a href="MainController?btAction=SelectCategory&category=${category}">${category}</a><br/>
                            </c:forEach>
                        </div>
                    </td>
                    <!--Product Management-->
                    <td>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Description</th>
                                    <th>Sale</th>
                                    <th colspan="2">Action</th>

                                </tr>
                            </thead>
                            
                                <tbody>
                                    
                                    <c:forEach var="product" items="${productList}">
                                        <form action="MainController" method="POST" accept-charset="UTF-8">
                                        <tr>
                                            <td>${product.getId()}<input type="hidden" name="productID" value="${product.getId()}"/></td>
                                            <td>${product.getName()}<input type="hidden" name="name" value="${product.getName()}" ></td>
                                            <td>${product.getCategory()}<input type="hidden" name="category" value="${product.getCategory()}"></td>
                                            <td><input type="number" name="quantity" value="${product.getQuantity()}" min="1"></td>
                                            <td><input type="number" name="price" value="${product.getListPrice()}" min="100"></td>
                                            <td><input type="text" name="description" value="${product.getDescription()}"></td>
                                            <td><input type="number" name="sale" value="${product.getSale()}" min="0"></td>
                                            <td><button type="submit" name="btAction" value="UpdateProduct">Update</button></td>
                                            <td><button type="submit" name="btAction" value="DeleteProduct">Delete</button></td>

                                        </tr>
                                        </form>
                                    </c:forEach>
                                </tbody>
                            
                        </table>

                    </td>
                </tr>
            </tbody>
        </table>
        </div>
        </c:if>
            
            <c:if test="${requestScope.ADMIN_ACTION eq team}">
                <div id="mystore" class="content-section">
                    <!-- My Store content -->
                    <!-- You can fill this section with your store management content -->
                    <table border="1">
                        <thead >
                            <tr >
                                <th style="text-align: center; background-color: black; color: white">
                                    <div>
                                        Group
                                    </div>
                                </th>
                                <th style="text-align: center; background-color: black; color: white">
                                    <div>
                                        Member
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <!--Category-->
                                <td>
                                    <div style="text-align: center">
                                        SE1843_PRJ301_GROUP2
                                    </div>
                                </td>
                                <!--Product Management-->
                                <td>
                                    <table border="1">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Role</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>SE</td>
                                                <td>Sang</td>
                                                <td>mail</td>
                                                <td>Leader, Database</td>
                                            </tr>
                                            <tr>
                                                <td>SE</td>
                                                <td>Thanh</td>
                                                <td>mail</td>
                                                <td>Back-end</td>
                                            </tr>
                                            <tr>
                                                <td>SE</td>
                                                <td>Khoi</td>
                                                <td>mail</td>
                                                <td>Back-end</td>
                                            </tr>
                                            <tr>
                                                <td>SE</td>
                                                <td>Minh</td>
                                                <td>mail</td>
                                                <td>Back-end, Database</td>
                                            </tr>
                                            <tr>
                                                <td>SE</td>
                                                <td>Khoa</td>
                                                <td>mail</td>
                                                <td>Front-end</td>
                                            </tr>
                                            <tr>
                                                <td>SE</td>
                                                <td>Hao</td>
                                                <td>mail</td>
                                                <td>Front-end</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <!-- MAIN -->
        </section>
        <!-- CONTENT -->

        <script src="js/scriptAdmin.js"></script><!--
        <script>
            // JavaScript to handle sidebar navigation
            const sideMenuItems = document.querySelectorAll('.side-menu a');
        
            sideMenuItems.forEach(item => {
                item.addEventListener('click', function(e) {
                    e.preventDefault();
        
                    const sectionId = this.getAttribute('href').slice(1);
                    const targetSection = document.getElementById(sectionId);
        
                    // Hide all content sections
                    const contentSections = document.querySelectorAll('.content-section');
                    contentSections.forEach(section => {
                        section.style.display = 'none';
                    });
        
                    // Display the clicked section
                    targetSection.style.display = 'block';
                });
            });
        </script>-->

    </body>
</html>
