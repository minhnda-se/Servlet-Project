<%-- 
    Document   : game_detail
    Created on : Aug 15, 2024, 2:47:40 PM
    Author     : Anh Minh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>${sessionScope.GAME.name}</title>
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <!-- font awesome style -->
        <link href="./fontawesome-free-6.6.0-web/css/all.min.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <!--fix style css-->
        <link href="./css/fix-style.css" rel="stylesheet"/>
        <title>Game Detail</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                background-color: #edf1f5;
                margin-top:20px;
            }
            .card {
                margin-bottom: 30px;
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid transparent;
                border-radius: 0;
            }
            .card .card-subtitle {
                font-weight: 300;
                margin-bottom: 10px;
                color: #8898aa;
            }
            .table-product.table-striped tbody tr:nth-of-type(odd) {
                background-color: #f3f8fa!important
            }
            .table-product td{
                border-top: 0px solid #dee2e6 !important;
                color: #728299!important;
            }
            .white-box {
                overflow: hidden; /* Ensures any overflowing content is hidden */
                width: 100%; /* Ensures the box takes full width of its parent container */
                max-width: 400px; /* Optional: limits the maximum width of the box */
                margin: auto; /* Center the box horizontally */
            }

            .img-responsive {
                width: 100%; /* Ensures the image takes up 100% of the box's width */
                height: auto; /* Maintains aspect ratio */
                object-fit: cover; /* Covers the box while maintaining aspect ratio */
            }
        </style>
    </head>
    <body>

        <c:set var="game" value="${sessionScope.GAME}"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <%@ include file="header.jsp"%>
        <section class="inner_page_head">
            <div class="container_fuild">
                <div class="row">
                    <div class="col-md-12">
                        <div class="full">
                            <h3>${game.name}</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-6">
                            <div class="white-box text-center">
                                <img src="${game.image_game}" class="img-responsive" alt="Game Image">
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-6">
                            <h4 class="box-title mt-5">Product description</h4>
                            <p>${game.description}</p>
                            <h2 class="mt-5">
                                ${game.price}
                            </h2>
                            <form action="MainController" method="POST">
                                <input type="hidden" name="url" value="game_detail.jsp">
                                <input type="hidden" name="userID" value="${sessionScope.USER_ID}">
                                <input type="hidden" name="gameId" value="${game.gameId}">
                                <button type="submit" name="action" value="AddToCart" class="btn btn-dark btn-rounded mr-1" data-toggle="tooltip" title data-original-title="Add to cart">
                                <%
                                    session.setAttribute("COUNT", "0");
                                %>
                                <i class="fa fa-shopping-cart"><a href="MainController?page=1&txtSearchBy=all&txtSearchValue=&action=AddToCart&gameId=${game.gameId}"></a></i>
                            </button>
                            <button type="submit" name="action" value="AddFav" class="btn btn-primary btn-rounded">Add To Wishlist</button>
                            </form>
                                <h6 style="color: red" class="mt-3">${requestScope.ADD_CART_MESSAGE}</h6>
                            <h4 class="mt-3">
                                Stock: ${game.stock}
                            </h4>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <h3 class="box-title mt-5">General Info</h3>
                            <div class="table-responsive">
                                <table class="table table-striped table-product">
                                    <tbody>
                                        <tr>
                                            <td width="390">Platform</td>
                                            <td>${game.platform}</td>
                                        </tr>
                                        <tr>
                                            <td>Publisher</td>
                                            <td>${game.publisher}</td>
                                        </tr>
                                        <tr>
                                            <td>Publication Year</td>
                                            <td>${game.publication_year}</td>
                                        </tr>
                                        <tr>
                                            <td>Category</td>
                                            <td>${game.category}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>
