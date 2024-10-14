<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="htmlhead.jsp" %>
        <title>Your Wishlist</title>
    </head>
    <body class="sub_page">
        <div class="hero_area">
            <%@include file="header.jsp" %>
        </div>
        <!--get information of product-->
        <!-- inner page section -->
        <section class="inner_page_head">
            <div class="container_fuild">
                <div class="row">
                    <div class="col-md-12">
                        <div class="full">
                            <h3>Product Grid</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end inner page section -->
        <!-- product section -->
        <section class="product_section layout_padding">
            <div class="container">
                <div class="heading_container heading_center">
                    <h2>
                        Your <span>Wishlist</span>
                    </h2>
                </div>
                    <div class="row">
                    <c:set var="gameList" value="${sessionScope.FAVOURITE_GAME}"/>
                    <c:if test="${not empty gameList}">
                        <c:forEach var="game" items="${gameList}">
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="box">
                                    <div class="option_container">
                                        <div class="options">
                                            <a href="MainController?action=getGame&gameId=${game.gameId}" class="option2">
                                                View Now 
                                            </a>
                                            <c:if test="${empty sessionScope.USER_ID}">
                                                <a href="login.jsp" class="option1">
                                                    Add To Cart
                                                </a>
                                            </c:if>
                                            <c:if test="${not empty sessionScope.USER_ID}">
                                                <a href="MainController?action=AddToCart&gameId=${game.gameId}&url=viewFav.jsp" class="option1">
                                                    Add To Cart
                                                </a>
                                            </c:if>
                                            <a href="MainController?action=DeleteFav&gameID=${game.gameId}" class="option3">Delete</a>
                                        </div>
                                    </div>
                                    <div class="img-box">
                                        <img src="${game.image_game}" alt="${game.name}">
                                    </div>
                                    <div class="detail-box">
                                        <h5 style="margin-right: 10px">
                                            ${game.name}
                                        </h5>
                                        <h6>
                                            ${game.price}$
                                        </h6>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty gameList}">
                        <div class="col-12">
                            <div class="alert alert-warning text-center" role="alert">
                                No products found matching your criteria.
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
        <!-- end product section -->
        <!-- footer section -->
        <footer class="footer_section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-col">
                        <div class="footer_contact">
                            <h4>
                                Reach at..
                            </h4>
                            <div class="contact_link_box">
                                <a href="">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <span>
                                        Location
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <span>
                                        Call +01 1234567890
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span>
                                        demo@gmail.com
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <div class="footer_detail">
                            <a href="index.html" class="footer-logo">
                                Famms
                            </a>
                            <p>
                                Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with
                            </p>
                            <div class="footer_social">
                                <a href="">
                                    <i class="fa fa-facebook" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-instagram" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-pinterest" aria-hidden="true"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <div class="map_container">
                            <div class="map">
                                <div id="googleMap"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-info">
                    <div class="col-lg-7 mx-auto px-0">
                        <p>
                            &copy; <span id="displayYear"></span> All Rights Reserved By
                            <a href="https://html.design/">Free Html Templates</a><br>

                            Distributed By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer section -->
        <!-- jQuery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
    </body>
</html>
