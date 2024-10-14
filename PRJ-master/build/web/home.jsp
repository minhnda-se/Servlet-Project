<%-- 
    Document   : home
    Created on : Jun 22, 2024, 7:46:35 PM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="prj.dal.ProductDTO"%>
<%@page import="prj.dal.ProductDTO"%>
<%@page import="prj.dal.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Premium Royal Jewelry Shop</title>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <!-- CSS only -->
        <link rel="icon" href="images/logo.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="./css/stylehome.css">
    </head>
   
    <body>
        <c:set var="productList" value="${sessionScope.PRODUCT_LIST}"/>
        <c:set var="categoryList" value="${sessionScope.CATEGORY_LIST}"/>
        <c:set var="cart" value="${sessionScope.CART}"/>
        <div class="home_black_version">
            <header class="header_area header_black">
                <!-- header top starts -->
                <div class="header_top">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-12 col-md-12">
                                <div class="top_right text-right" id="hh">
                                    <c:if test="${empty sessionScope.USER}">
                                        <ul>
                                            <li class="top_links">
                                                    <li><a href="login.jsp">Login</a></li>
                                                    <li><a href="register.jsp">Register</a></li>
                                                
                                            </li>
                                        </ul>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.USER}">
                                        <c:set var="account" value="${sessionScope.USER}"/>
                                        <ul>

                                            <li class="top_links">
                                                <a href="#">My Account <i class="ion-chevron-down"></i></a>
                                                <ul class="dropdown_links">
                                                    <li><a href="MainController?btAction=GetUrl&url=profile.jsp">${account.lastName}</a></li>
                                                    <li><a href="MainController?btAction=Logout">Logout</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </c:if>     

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- header top ends -->

                <!-- header middle starts -->
                <div class="header_middel">
                    <div class="container">
                        <div class="row align-items-center">

                            <div class="col-lg-5">
                                <div class="home_contact">
                                    <div class="contact_icone">
                                        <img src="images/icon/icon_phone.png" alt="">
                                    </div>
                                    <div class="contact_box">
                                        <p>Inquiry / Helpline : <a href="tel: 1234567894">1234567894</a></p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2 col-md-3 col-4">
                                <div class="logo">
                                    <a href="MainController?btAction=GetUrl&url=home.jsp"><img src="images/logo/logo-ash.png" alt=""></a>
                                </div>
                            </div>

                            <div class="col-lg-5 col-md-7 col-6">
                                <div class="middel_right">
                                    <div class="search_btn">
                                        <a href="#"><i class="ion-ios-search-strong"></i></a>
                                        <div class="dropdown_search">
                                            <form action="MainController" method="POST">
                                                <input type="text" name="searchValue" placeholder="Search Product ....">
                                                <button type="submit" name="btAction" value="Search"><i class="ion-ios-search-strong"></i></button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="wishlist_btn">
                                        <a href="MainController?btAction=GetUrl&url=profile.jsp"><i class='bx bx-user' ></i></i></a>
                                    </div>
                                    <div class="cart_link">
                                        
                                        <a href="#"><i class="ion-android-cart"></i><span class="cart_text_quantity"></span><i class="ion-chevron-down"></i></a>
                                        <span class="cart_quantity">${cart.size()}</span>
                                        <!-- mini cart -->
                                        <div class="mini_cart">
                                            <div class="cart_close">
                                                <div class="cart_text">
                                                    <h3>Cart</h3>
                                                </div>
                                                <div class="mini_cart_close">
                                                    <a href="javascript:void(0)"><i class="ion-android-close"></i></a>
                                                </div>
                                            </div>
                                            <c:forEach var="item" items="${cart}">
                                                <div class="cart_item">
                                                <div class="cart_img">
                                                    <a href="#"><img src="images/nav-product/product.jpg" alt=""></a>
                                                </div>
                                                <div class="cart_info">
                                                    <a href="#">${item.id}</a>
                                                    <span class="quantity">Quantity: ${item.quantity}</span>
                                                    <span class="price_cart">${item.getSalePrice()}</span>
                                                </div>
                                                <div class="cart_remove">
                                                    <a href="MainController?btAction=DeleteCart&itemID=${item.id}&url=home.jsp"><i class="ion-android-close"></i></a>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            <div class="cart_total">
                                                <span>Subtotal : </span>
                                                <span>${cart.getTotalMoney()}VND</span>
                                            </div>
                                            <div class="mini_cart_footer">
                                                <div class="cart_button view_cart">
                                                    <a href="MainController?btAction=GetUrl&url=viewcart.jsp">View Cart</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- mini cart ends  -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- header middle ends -->

                <!-- header bottom starts -->

                <div class="header_bottom sticky-header">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-12">
                                <div class="main_menu_inner">
                                    <div class="logo_sticky">
                                        <a href="#"><img src="images/logo/logo-ash.png" alt="logo"></a>
                                    </div>
                                    <div class="main_menu">
                                        <nav>
                                            <ul>
                                                <li class="active">
                                                    <a href="MainController?btAction=GetUrl&url=home.jsp">Home</a>
                                                </li>
                                                 <li><a href="MainController?btAction=GetUrl&url=product.jsp">Products</a></li>
                                                <li>
                                                    <a href="#">Category<i class="ion-chevron-down"></i></a>
                                                    <ul class="mega_menu">
                                                        <li>
                                                            <c:forEach var="category" items="${categoryList}">
                                                                <a href="MainController?btAction=GetCategory&category=${category}&urlName=product.jsp">${category}</a><br/>
                                                            </c:forEach>
                                                        </li>
                                                    </ul>
                                                </li>
                                               
                                                <li><a href="MainController?btAction=GetUrl&url=about_us.jsp">About Us</a></li>
                                                <li><a href="MainController?btAction=GetUrl&url=contact.jsp">Contact Us</a></li> 
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- header bottom ends -->
            </header>

            <!-- slider section starts -->
            <div class="slider_area slider_black owl-carousel">
                <div class="single_slider" data-bgimg="images/slider/1.png">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-12">
                                
                            </div>
                        </div>
                    </div>

                </div>
                <div class="single_slider" data-bgimg="images/slider/2.jpg">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-12">
                                
                            </div>
                        </div>
                    </div>

                </div>
                <div class="single_slider" data-bgimg="images/slider/3.jpg">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-12">
                                
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- slider section ends -->
            <!--Product session start-->
            <section class="product_section p_section1 product_black_section bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="section_title">
                                <h2>Best Sellings</h2>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="product-area">
                                <div class="product_container bottom">
                                    <div class="custom-row product_row1">
                                            <c:forEach var="product" items="${productList}">
                                                <c:if test="${product.isBestSelling eq true}">
                                                    <div class="custom-col-5">
                                                        <div class="single_product">
                                                            <div class="product_thumb">
                                                                <a href="#" class="primary_img"><img src="images/file_anh_project/${product.id.trim()}/${product.id.trim()}.png"
                                                                                                 alt="product1"></a>
                                                            <a href="#" class="secondary_img"><img src="images/file_anh_project/${product.id.trim()}/${product.id.trim()}_hover.png"
                                                                                                   alt="product1"></a>
                                                                <div class="quick_button">
                                                                    <a href="MainController?btAction=SearchProduct&productID=${product.id}">Quick
                                                                        View</a>
                                                                </div>
                                                            </div>
                                                            <div class="product_content">
                                                                <div class="tag_cate">
                                                                    <h3>${product.name}</h3><br/>
                                                                    <h3><a href="#">${product.category}</h3><br/>
                                                                </div>
                                                                <h3>Stock: ${product.quantity}</h3>
                                                                <div class="price_box">
                                                                    <span class="old_price">${product.listPrice}</span>
                                                                    <span class="current_price">${product.getSalePrice()}</span>
                                                                </div>
                                                                <div class="product_hover">
                                                                    <div class="product_ratings">
                                                                        <ul>
                                                                            <li><a href="#"><i class="ion-ios-star-outline"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i class="ion-ios-star-outline"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i class="ion-ios-star-outline"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i class="ion-ios-star-outline"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i class="ion-ios-star-outline"></i></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="product_desc">
                                                                        <p>${product.description}</p>
                                                                    </div>
                                                                    <div class="action_links">
                                                                        <ul>
                                                                            <li><a href="#" data-placement="top" title="Add to Wishlist"
                                                                                   data-toggle="tooltip"><span
                                                                                        class="ion-heart"></span></a></li>
                                                                            <li class="add_to_cart"><a href="MainController?btAction=AddToCart&productID=${product.id}&urlName=home.jsp" title="Add to Cart">Add
                                                                                    to Cart</a></li>
                                                                            <li><a href="#" title="Compare"><i
                                                                                        class="ion-ios-settings-strong"></i></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="product_section p_section1 product_black_section bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="section_title">
                                <h2>On-Sale</h2>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="product-area">
                                <div class="product_container bottom">
                                    <div class="custom-row product_row1">
                                            <c:forEach var="product" items="${productList}">
                                                <c:if test="${product.sale >= 20}">
                                                    <div class="custom-col-5">
                                                        <div class="single_product">
                                                            <div class="product_thumb">
                                                                <a href="#" class="primary_img"><img src="images/file_anh_project/${product.id.trim()}/${product.id.trim()}.png"
                                                                                                 alt="product1"></a>
                                                            <a href="#" class="secondary_img"><img src="images/file_anh_project/${product.id.trim()}/${product.id.trim()}_hover.png"
                                                                                                   alt="product1"></a>
                                                                <div class="quick_button">
                                                                    <a href="MainController?btAction=SearchProduct&productID=${product.id}">Quick
                                                                        View</a>
                                                                </div>
                                                            </div>
                                                            <div class="product_content">
                                                                <div class="tag_cate">
                                                                    <h3>${product.name}</h3><br/>
                                                                    <h3><a href="#">${product.category}</h3><br/>
                                                                </div>
                                                                <h3>Stock: ${product.quantity}</h3>
                                                                <div class="price_box">
                                                                    <span class="old_price">${product.listPrice}</span>
                                                                    <span class="current_price">${product.getSalePrice()}</span>
                                                                </div>
                                                                <div class="product_hover">
                                                                    <div class="product_ratings">
                                                                        <ul>
                                                                            <li><a href="#"><i class="ion-ios-star-outline"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i class="ion-ios-star-outline"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i class="ion-ios-star-outline"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i class="ion-ios-star-outline"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i class="ion-ios-star-outline"></i></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="product_desc">
                                                                        <p>${product.description}</p>
                                                                    </div>
                                                                    <div class="action_links">
                                                                        <ul>
                                                                            <li><a href="#" data-placement="top" title="Add to Wishlist"
                                                                                   data-toggle="tooltip"><span
                                                                                        class="ion-heart"></span></a></li>
                                                                            <li class="add_to_cart"><a href="MainController?btAction=AddToCart&productID=${product.id}" title="Add to Cart">Add
                                                                                    to Cart</a></li>
                                                                            <li><a href="#" title="Compare"><i
                                                                                        class="ion-ios-settings-strong"></i></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--Product session end-->
            <!-- blog section starts -->
            <section class="blog_section blog_black">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="section_title">
                                <h2>PRJ Display</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="blog_wrapper blog_column3 owl-carousel">
                            <div class="col-lg-4">
                                <div class="single_blog">
                                    <div class="blog_thumb">
                                        <a href="#"><img src="images/blog/1.png" alt="blog 4"></a>
                                    </div>
                                    <div class="blog_content">
                                        <h3><a href="#">The Charm of the Floral Gold Necklace</a></h3>
                                        <div class="author_name">
                                            <p>
                                                <span>by</span>
                                                <span class="themes">PRJ</span>
                                                <span class="post_by">/ 4 July 2024</span>
                                            </p>
                                        </div>

                                        <div class="post_desc">
                                            <p>In the realm of jewelry design, few pieces capture the essence of nature's beauty as gracefully as a floral-inspired necklace. The stunning gold necklace adorned with delicate pink flowers is a prime example of this timeless elegance, offering a perfect blend of sophistication and charm.</p>
                                        </div>
                                        <div class="read_more">
                                            <a href="#">Continue Reading</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="single_blog">
                                    <div class="blog_thumb">
                                        <a href="#"><img src="images/blog/2.png" alt="blog 1"></a>
                                    </div>
                                    <div class="blog_content">
                                        <h3><a href="#">Circular Diamond Pendant Necklace</a></h3>
                                        <div class="author_name">
                                            <p>
                                                <span>by</span>
                                                <span class="themes">PRJ</span>
                                                <span class="post_by">/ 3 November 2024</span>
                                            </p>
                                        </div>

                                        <div class="post_desc">
                                            <p>In the world of fine jewelry, some pieces transcend the ordinary, capturing the essence of timeless elegance and modern sophistication. One such piece is the stunning circular diamond pendant necklace, a true testament to the art of jewelry design. This necklace is not just an accessory; it's a statement, a symbol of grace and refinement.</p>
                                        </div>
                                        <div class="read_more">
                                            <a href="#">Continue Reading</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="single_blog">
                                    <div class="blog_thumb">
                                        <a href="#"><img src="images/blog/3.png" alt="blog 2"></a>
                                    </div>
                                    <div class="blog_content">
                                        <h3><a href="#">The Art of Diamond Jewelry</a></h3>
                                        <div class="author_name">
                                            <p>
                                                <span>by</span>
                                                <span class="themes">PRJ</span>
                                                <span class="post_by">/ 2 July 2024</span>
                                            </p>
                                        </div>

                                        <div class="post_desc">
                                            <p>Diamonds are forever, they say. And for good reason! These dazzling gemstones hold a timeless appeal, symbolizing love, strength, and beauty. Whether you're looking for a statement piece to add to your collection or a special gift for someone you cherish, diamond jewelry offers a touch of elegance and luxury.</p>
                                        </div>
                                        <div class="read_more">
                                            <a href="#">Continue Reading</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="single_blog">
                                    <div class="blog_thumb">
                                        <a href="#"><img src="images/blog/4.png" alt="blog 3"></a>
                                    </div>
                                    <div class="blog_content">
                                        <h3><a href="#">Ruby Ring</a></h3>
                                        <div class="author_name">
                                            <p>
                                                <span>by</span>
                                                <span class="themes">PRJ</span>
                                                <span class="post_by">/ 5 November 2024</span>
                                            </p>
                                        </div>

                                        <div class="post_desc">
                                            <p>Ruby rings have long been celebrated for their striking beauty and symbolic significance. Known as the "King of Gemstones," the ruby has captivated hearts and minds for centuries with its deep red hue and brilliant luster.</p>
                                        </div>
                                        <div class="read_more">
                                            <a href="#">Continue Reading</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- blog section ends -->
            <!-- instagram section starts -->
            <div class="instagram">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-bgimg="images/instagram/insta-1.png">
                                <div class="instagram__text">
                                    <i class="ion-social-instagram"></i>
                                    <a href="https://www.instagram.com/ana_d_armas/">@ ana_d_armas</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-bgimg="images/instagram/insta-2.png">
                                <div class="instagram__text">
                                    <i class="ion-social-instagram"></i>
                                    <a href="https://www.instagram.com/zsy_ya/">@ naomi_zsy</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-bgimg="images/instagram/insta-3.jpg">
                                <div class="instagram__text">
                                    <i class="ion-social-instagram"></i>
                                    <a href="https://www.instagram.com/alexandrine_ar/">@ Alexandrine</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-bgimg="images/instagram/insta-4.jpg">
                                <div class="instagram__text">
                                    <i class="ion-social-instagram"></i>
                                    <a href="https://www.instagram.com/lika.solt/">@ Lika.solt</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-bgimg="images/instagram/insta-5.jpg">
                                <div class="instagram__text">
                                    <i class="ion-social-instagram"></i>
                                    <a href="https://www.instagram.com/yiyeisabella/">@ yiyeisabella</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-bgimg="images/instagram/insta-6.jpg">
                                <div class="instagram__text">
                                    <i class="ion-social-instagram"></i>
                                    <a href="https://www.instagram.com/goyounjung/">@ goyounjung</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- instagram section  ends-->

            <!-- banner area starts  -->
            <section class="banner_section banner_section_five">
                <div class="container-fluid p-0">
                    <div class="row no-gutters">
                        <div class="col-lg-6 col-md-12">
                            <div class="port-box">
                                <div class="text-overlay">
                                    <h1>New Arrivals 2024</h1>
                                    <p>Crown for wife</p>
                                </div>
                                <img src="images/banner/1.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="port-box">
                                <div class="text-overlay">
                                    <h1>Featured Products 2024</h1>
                                    <p>Pendant for Valentine</p>
                                </div>
                                <img src="images/banner/2.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- banner area ends -->

            <!-- footer section starts -->
            <footer class="footer_widgets footer_black">
                <div class="container">
                    <div class="footer_top">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="widgets_container contact_us">
                                    <h3>About PRJ</h3>
                                    <div class="footer_contact">
                                        <p>Address : SE1842_PRJ301_GROUP2</p>
                                        <p>Phone : (+84)0784653276</p>
                                        <p>Email : sangnhse182627@fpt.edu.vn</p>
                                        <ul>
                                            <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                                            <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                                            <li><a href="#"><i class="ion-social-rss"></i></a></li>
                                            <li><a href="#"><i class="ion-social-googleplus"></i></a></li>
                                            <li><a href="#"><i class="ion-social-youtube"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="widgets_container widget_menu">
                                    <h3>Information</h3>
                                    <div class="footer_menu">
                                        <ul>
                                            <li><a href="#">About Us</a></li>
                                            <li><a href="#">Blog</a></li>
                                            <li><a href="#">Contact</a></li>
                                            <li><a href="#">Services</a></li>
                                            <li><a href="#">Collection</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>       
                            <div class="footer_bottom">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="copyright_area">
                                            <p>Copyright &copy; 2024 <a href="MainController?btAction=GetUrl&url=about_us.jsp">PRJ</a> All rights Reserved.</p>
                                            <img src="images/icon/papyel2.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
            </footer>
            <!-- footer section ends -->
        </div>

        







        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <!-- JavaScript Bundle with Popper.js -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

        <script src="./js/main.js"></script>
    </body>

