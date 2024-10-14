<%@page import="prj.dal.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>PREMIUM ROYAL JEWELRY</title>
        <!-- Favicon-->
        <link rel="icon" href="images/logo.png"
              type="image/x-icon" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styleProduct.css" rel="stylesheet" />
        <style>
            /* General header styles */
            header {
                background-color: rgba(0, 0, 0, 0.7);
                color: black;
                padding: 10px 0;
                font-family: 'Lato', sans-serif;
            }

            /* Container for the row of items */
            header .row {
                margin: 0;
                align-items: center;
            }

            /* Logo styles */
            .logo img {
                max-height: 50px; /* Adjust this value based on your logo size */
            }

            /* Navigation menu styles */
            .main_menu ul {
                list-style: none;
                padding: 0;
                margin: 0;
                display: flex;
                justify-content: space-around;
            }

            .main_menu ul li {
                position: relative;
            }

            .main_menu ul li a {
                color: black;
                text-decoration: none;
                padding: 10px 15px;
                display: block;
            }

            .main_menu ul li a:hover,
            .main_menu ul li a.active {
                background-color: rgba(255, 255, 255, 0.1);
                border-radius: 5px;
            }

            /* Column specific styles */
            .col-lg-2,
            .col-lg-3,
            .col-lg-6 {
                padding: 0;
            }

            .col-lg-6 {
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }

            /* Additional styling for header_right.jsp content */
            .header-content {
                /* Add styles specific to elements within header_right.jsp */
            }

            /* Second header section for search bar and category links */
            .header-search-category {
                background-color: #000;
                color: black;
                padding: 20px 0;
                text-align: center; /* Center content horizontally */
            }

            .header-search-category .container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .header-search-category form {
                display: flex;
                width: 100%;
                max-width: 600px;
                margin-bottom: 20px;
            }

            .header-search-category input[type="search"] {
                flex-grow: 1;
                border: none;
                border-radius: 5px 0 0 5px;
                padding: 10px;
            }

            .header-search-category button[type="submit"] {
                border: none;
                border-radius: 0 5px 5px 0;
                padding: 10px 20px;
                background-color: #fff;
                color: #000;
                cursor: pointer;
            }

            .header-search-category button[type="submit"]:hover {
                background-color: #ccc;
            }

            .header-search-category h3 {
                margin: 20px 0;
                width: 100%;
                text-align: center;
            }

            /* Category links */
            .header-search-category .categories {
                display: flex;
                justify-content: center;
                gap: 20px; /* Space between categories */
                flex-wrap: wrap; /* Ensure categories wrap to new lines if necessary */
            }

            .header-search-category .categories a {
                color: black;
                text-decoration: none;
                margin: 0 10px;
            }

            .header-search-category .categories a:hover {
                text-decoration: underline;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .main_menu ul {
                    flex-direction: column;
                    align-items: center;
                }

                .main_menu ul li {
                    margin-bottom: 10px;
                }

                .col-lg-6 {
                    justify-content: center;
                    margin-top: 10px;
                }

                .header-search-category form {
                    flex-direction: column;
                }

                .header-search-category input[type="search"],
                .header-search-category button[type="submit"] {
                    width: 100%;
                    border-radius: 5px;
                    margin: 5px 0;
                }

                .header-search-category .categories {
                    flex-direction: row;
                    gap: 10px; /* Adjust gap for smaller screens */
                    justify-content: center; /* Center categories on small screens */
                }
            }


        </style>
    </head>
    <body>
        <!-- Header with Search Bar -->
        <%
            UserDTO user = (UserDTO) session.getAttribute("USER");
        %>
        <c:set var="url" value="profile.jsp"/> 
        <c:set var="productList" value="${sessionScope.PRODUCT_LIST}"/>
        <header style="background-color: rgba(0, 0, 0, 0.7); color: white; padding: 10px 0; font-family: Lato, sans-serif">
            <div class="row align-items-center" style="margin: 0">
                <div class="col-lg-2" style="padding: 0px">
                    <div class="logo">
                        <a href="MainController?btAction=GetUrl&url=home.jsp"><img src="images/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-3" style="padding: 0px">
                    <div class="main_menu menu_two menu_position">
                        <nav>
                            <ul>
                                <li>
                                    <a href="MainController?btAction=GetUrl&url=home.jsp">Home</a>
                                </li>
                                <li><a href="MainController?btAction=GetUrl&url=about_us.jsp">About Us</a></li>
                                <li><a href="#" class="active">Collections</a></li>
                                <li>
                                    <a href="MainController?btAction=GetUrl&url=profile.jsp">Profile</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-6" style="padding: 0px; display: flex; justify-content: flex-end; align-items: center">
                    <%@ include file="header_right.jsp"%>
                </div>
            </div>
        </header>
        <header class="py-3 bg-light">
            <div class="container px-4 px-lg-5 my-5">
                <!-- Search bar -->
                <form class="d-flex mt-3" action="MainController" method="POST" role="search">
                    <input class="form-control me-2" type="text" name="searchValue" placeholder="Search for products" aria-label="Search">
                    <button class="btn btn-outline-dark" type="submit" name="btAction" value="Search">Search</button>
                </form>
                <h3 id="category" style="justify-content: center; display: flex;">Category</h3>
                <div style="display: flex; justify-content: space-between">
                    <a href="MainController?btAction=SelectCategory&category=">All</a>
                    <c:forEach var="category" items="${sessionScope.CATEGORY_LIST}" >
                        <a href="MainController?btAction=SelectCategory&category=${category}">${category}</a>
                    </c:forEach>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:if test="${empty requestScope.SEARCH_PRODUCT_LIST}">
                        <c:forEach var="product" items="${productList}">
                            <c:if test="${product.sale eq 0}">
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Product image-->
                                        <a href="MainController?btAction=SearchProduct&productID=${product.id}"><img class="card-img-top" src="images/file_anh_project/${product.id.trim()}/${product.id.trim()}.png" alt="..." /></a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${product.name}</h5>
                                                <!-- Product price-->
                                                ${product.listPrice}
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="MainController?btAction=AddToCart&productID=${product.id}&urlName=product.jsp">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${product.sale ne 0}">
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                        <!-- Product image-->
                                        <a href="MainController?btAction=SearchProduct&productID=${product.id}"><img class="card-img-top" src="images/file_anh_project/${product.id.trim()}/${product.id.trim()}.png" alt="..." /></a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${product.name}</h5>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through">${product.listPrice}</span>
                                                ${product.getSalePrice()}
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="MainController?btAction=AddToCart&productID=${product.id}&urlName=product.jsp">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${not empty requestScope.SEARCH_PRODUCT_LIST}">
                        <c:forEach var="product" items="${requestScope.SEARCH_PRODUCT_LIST}">
                        <c:if test="${product.sale eq 0}">
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <a href=""><img class="card-img-top" src="images/file_anh_project/${product.id.trim()}/${product.id.trim()}.png" alt="..." /></a>
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">${product.name}</h5>
                                            <!-- Product price-->
                                            ${product.listPrice}
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to Cart</a></div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${product.sale ne 0}">
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Sale badge-->
                                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                    <!-- Product image-->
                                    <a href=""><img class="card-img-top" src="images/product/27.jpg" alt="..." /></a>
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">${product.name}</h5>
                                            <!-- Product price-->
                                            <span class="text-muted text-decoration-line-through">${product.listPrice}</span>
                                            ${product.getSalePrice()}
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    </c:if>
                    
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"/>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
