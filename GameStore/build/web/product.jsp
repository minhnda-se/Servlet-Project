<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="htmlhead.jsp" %>
        <title>Games List</title>
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
                        Our <span>Games</span>
                    </h2>
                </div>
                <div class="from-style">
                    <form class="form-inline justify-content-center" action="MainController" method="GET">
                        <input type="hidden" name="page" value="<c:if test="${empty requestScope.PAGE}">1</c:if><c:if test="${not empty requestScope.PAGE}">${requestScope.PAGE}</c:if>"/>
                            <select class="form-check-inline btn-select" name="txtSearchBy">
                                    <option value="all" <c:if test="${requestScope.CATEGORY eq'all'}">selected</c:if>>All</option>
                            <option value="name" <c:if test="${requestScope.CATEGORY eq'name'}">selected</c:if>>Name</option>
                            <option value="platform" <c:if test="${requestScope.CATEGORY eq'platform'}">selected</c:if>>Platform</option>
                            <option value="category" <c:if test="${requestScope.CATEGORY eq'category'}">selected</c:if>>Category</option>
                            <option value="publisher" <c:if test="${requestScope.CATEGORY eq'publisher'}">selected</c:if>>Publisher</option>
                            <option value="publication_year" <c:if test="${requestScope.CATEGORY eq'publication_year'}">selected</c:if>>Publication Year</option>
                            </select>
                            <input class="form-control" type="text" name="txtSearchValue" placeholder="Search" aria-label="Search">
                            <button class="btn" type="submit" name="action" value="Search"><span class="fa-solid fa-magnifying-glass"></span></button>
                        </form>
                    </div>
                    <div class="row">
                    <c:set var="gameList" value="${sessionScope.GAME_LIST}"/>
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
                                                <a href="MainController?page=1&txtSearchBy=all&txtSearchValue=&action=AddToCart&gameId=${game.gameId}" class="option1">
                                                    Add To Cart
                                                </a>
                                            </c:if>
                                            <a href="MainController?page=1&txtSearchBy=all&txtSearchValue=&action=AddFav&gameId=${game.gameId}&userID=${sessionScope.USER_ID}" class="option3">
                                                Add To Favorite
                                            </a>
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
                                            $${game.price}
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
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${PAGE > 1}">
                            <li class="page-item">
                                <a class="page-link" href="MainController?action=Search&txtSearchBy=${requestScope.CATEGORY}&txtSearchValue=${SEARCH_VALUE}&page=${PAGE-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${TOTAL_PAGES}">
                            <li class="page-item <c:if test='${PAGE == i}'>active</c:if>'">
                                <a class="page-link" href="MainController?action=Search&txtSearchBy=${requestScope.CATEGORY}&txtSearchValue=${SEARCH_VALUE}&page=${i}">${i}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${PAGE < TOTAL_PAGES}">
                            <li class="page-item">
                                <a class="page-link" href="MainController?action=Search&txtSearchBy=${requestScope.CATEGORY}&txtSearchValue=${SEARCH_VALUE}&page=${PAGE+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
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