<%-- 
    Document   : header
    Created on : Aug 16, 2024, 2:23:02 PM
    Author     : huusa
--%>
<!-- header section strats -->
<header class="header_section">
    <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="home.jsp"><img width="70" src="images/logoefvfv.png" alt="#" /></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=""> </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"> <span class="nav-label">Platform</span></a>
                        <ul class="dropdown-menu">
                            <li><a href="MainController?action=Search&page=1&txtSearchBy=platform&txtSearchValue=PS4">PS4</a></li>
                            <li><a href="MainController?action=Search&page=1&txtSearchBy=platform&txtSearchValue=PS5">PS5</a></li>
                            <li><a href="MainController?action=Search&page=1&txtSearchBy=platform&txtSearchValue=Xbox">Xbox</a></li>
                            <li><a href="MainController?action=Search&page=1&txtSearchBy=platform&txtSearchValue=Switch">Switch</a></li>
                        </ul>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="MainController?action=Search&page=1&txtSearchBy=all">Products</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="blog_list.jsp">Blog</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="ViewCartController">
                            <span class="fa-solid fa-cart-shopping"></span>
                        </a>
                    </li>
                    <li class="nav-item active">
                    <c:if test="${empty sessionScope.USER_ID}">
                        <a class="nav-link" href="login.jsp">
                            <span class="fa-solid fa-user"></span>
                        </a>
                    </c:if>
                    <c:if test="${not empty sessionScope.USER_ID}">
                        <a class="nav-link" href="profile.jsp">
                            <span class="fa-solid fa-user"></span>
                        </a>
                    </c:if>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="MainController?action=ViewFav">
                            <span class="fa-solid fa-heart"></span>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="MainController?action=Search&page=1&txtSearchBy=all">
                            <span class="fa-solid fa-magnifying-glass"></span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
