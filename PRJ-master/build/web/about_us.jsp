<%-- 
    Document   : about_us
    Created on : Dec 28, 2023, 7:30:34 PM
    Author     : lvhho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/logo.png"
              type="image/x-icon" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>
            About us
        </title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdn.tailwindcss.com/3.3.2"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"/>
        <style type="text/css">
            .a {
                color: black;
            }
        </style>
    </head>

    <body class="stretched no-transition">
        <header>
            <div class="main_header header_transparent header-mobile-m" style="margin: 0">
                <div class="header_container sticky-header">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-lg-2">
                                <div class="logo">
                                    <a href="home.jsp"><img src="images/logo.png" alt=""></a>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <!-- main-menu starts -->
                                <div class="main_menu menu_two menu_position">
                                    <nav>
                                        <ul>
                                            <li class="mega_items">
                                                <a href="#">Collections <i class="fa fa-angle-down"></i></a>
                                                <div class="mega_menu">
                                                    <ul  class="mega_menu_inner">
                                                        <li style="color: black; font-size: 16px">

                                                            <a class="a" href="MainController?btAction=GetUrl&url=refine.jsp">ALL</a>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </li>
                                            <li><a href="MainController?btAction=GetUrl&url=aboutus" style="color:#F0E68C ">About Us</a></li>
                                            <li><a href="MainController?btAction=GetUrl&url=contact.jsp" >Contact Us</a></li>
                                        </ul>
                                    </nav>
                                </div>
                                <!-- main menu ends -->
                            </div>
                            <div class="col-lg-4">
                                <%@ include file="header_right.jsp"%>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </header>
        <!-- #header end -->

        <!-- Content
============================================= -->
        <section id="content">

            <div class="content-wrap notoppadding nobottompadding">



                <!-- group 1 -->
                <section id="section_about" class="corner clearfix" style=" background-image: url('images/banner/banner2223.png');">
                    <div class="container">
                        <h2 style="font-family: Roboto;font-size: 48px; margin-top: 50px">Store
                            <span style="font-family: Roboto;color: #ff5722;">
                                PREMIUM ROYAL JEWELRY
                            </span>
                        </h2>
                        <h3 style="font-weight: 400;">
                            Genuine jewelry distribution store in Viet Nam
                        </h3>
                        <div class="section_about_content col-md-12" style="margin-top: 30px;">
                            <div class="col-md-4" style="text-align: center;">
                                <img src="images/product.jpg"
                                     alt="heading_image">
                            </div>
                            <div class="col-md-8">
                                <div class="section_about_content_text">
                                    <p><i class="fa fa-check" aria-hidden="true"></i><span>Commit</span>
                                        genuine.</p>
                                    <p><i class="fa fa-check" aria-hidden="true"></i>Warranty policy for all products
                                        <span>10 years.</span></p>
                                    <p><i class="fa fa-check" aria-hidden="true"></i>Ship
                                        <span>Fast</span> receive goods after 3 days.</p>
                                </div>
                                <a class="button-click" href="MainController?btAction=GetUrl&url=product.jsp" data-href="#section_detail">
                                    <button>BUY NOW </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- end group 1 -->





                <!-- group 2 -->
                <section id="section_inspiration" class="marbtm10 clearfix">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="col-sm-12 col-md-9 col-md-offset-3 pad0">
                                <div class="section_content">
                                    <h2 class="section_inspiration_title">Genuine Commitment</h2>
                                    <div class="section_inspiration_content">
                                        <p>
                                            At Premium Royal Jewelry, we are proud to bring customers genuine jewelry products, guaranteed in quality.
                                            quantity and origin. We cooperate closely with famous brands in the market
                                            market to ensure that every product you choose is a delicate combination of art and quality.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 pad0" style="text-align: center;">
                            <a href="">
                                <picture>
                                    <img src="images/banner/banner2.png"
                                         alt="section_inspiration_small" itemprop="image"
                                         title="section_inspiration_small">
                                </picture>
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 pad0" style="text-align: center;">
                            <a href="">
                                <picture>

                                    <img src="images/banner/banner11.png"
                                         alt="section_inspiration_large" itemprop="image"
                                         title="section_inspiration_large">
                                </picture>
                            </a>
                        </div>
                    </div>
                </section>
                <!-- end group 2 -->





                <!-- group 3 -->
                <section id="section_material" class="clearfix">
                    <div class="row marbtm10">
                        <div class="col-sm-6 col-sm-push-6 pad0">
                            <div class="col-sm-12 col-md-9">
                                <div class="section_content">
                                    <h3 class="section_material_1_title">Diverse Models</h3>

                                    <blockquote class="section_material_1_quote"><i>We understand that everyone has something
                                            me separately, so we not only provide popular jewelry but also
                                            brings unique and outstanding jewelry lines</i></blockquote>

                                    <div class="section_material_1_content">
                                        Premium Royal Jewelry is proud to offer customers a diverse and rich jewelry collection,
                                        from delicate and glamorous jewelry to fresh and energizing options.
                                        We continuously update our product catalog to meet all your personal preferences and styles.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-pull-6 pad0" style="text-align: center;">
                            <picture>
                                <img src="images/banner/bg-1.jpg"
                                     alt="section_material_1_image" itemprop="image" title="section_material_1_image">
                            </picture>
                        </div>
                    </div>
                    <div class="row marbtm10">
                        <div class="col-sm-6 pad0">
                            <div class="col-sm-12 col-md-9 col-md-offset-3">
                                <div class="section_content">
                                    <h3 class="section_material_2_title">Fast Customer Support</h3>

                                    <div class="section_material_2_content">
                                        At Premium Royal Jewelry, our customer support team is always ready to listen
 Listen and answer all your questions. You can contact us through
 by phone, email or directly at the store to receive professional advice
 and fast. We believe that customer satisfaction is the key to success
 our success.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 pad0" style="text-align: center;">
                            <picture>
                                <img src="images/banner/bg-2.jpg"
                                     alt="section_material_2_image" itemprop="image" title="section_material_2_image">
                            </picture>
                        </div>
                    </div>
                </section>
                <!-- end group 3 -->






                <!-- group 5 -->
                <div class="clear"></div>

                <div id="section_contact" class="page-section nobottompadding notoppadding"  style="padding: 0">
                    <div class="row noleftmargin norightmargin common-height">
                        <div class='index_map col-md-6 col-sm-6 hidden-xs nopadding'>
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.60994153052!2d106.80730807586922!3d10.841132857995166!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2sFPT%20University%20HCMC!5e0!3m2!1sen!2s!4v1703229023591!5m2!1sen!2s"
                                width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>

                        </div>

                        <!-- Google Map End -->

                        <div class="col-md-6 col-sm-6" style="background-color: #383c44">
                            <div class="max-height" style='padding: 60px 30px'>
                                <h3 class="" style='color: #ffffff; font-size: 24px; '>Main office</h3>

                                <div style="line-height: 1.7;">
                                    <address style="line-height: 1.7; font-size: 16px; color: #dbdbdb ;">
                                        <strong style='color: #fff'>South America:</strong><br>
                                        800 Folsom Ave, Suite 900<br>
                                        San Francisco, CA 94207<br>

                                    </address>
                                    <address style="line-height: 1.7; font-size: 16px; color: #dbdbdb ;">
                                        <strong style='color: #fff'>Miền Nam:</strong><br>
                                        61/2 Quang Trung, Ward 10<br>
                                        Go Vap District, Ho Chi Minh city<br>
                                        Hotline: 1900 9090<br />
                                        Email: kuloi@gmail.com
                                    </address>
                                    <address style="line-height: 1.7; font-size: px; color: #ffffff ;">

                                    </address>
                                    <address style="line-height: 1.7; font-size: px; color: #ffffff ;">

                                    </address>
                                    <address style="line-height: 1.7; font-size: px; color: #ffffff ;">

                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <style>
                    #section_contact {
                        position: relative;
                    }

                    .modal-body {
                        padding: 30px 15px;
                    }

                    button.close {
                        margin: 5px 10px;
                        z-index: 99;
                        position: absolute;
                        right: 0;
                    }

                    .contact-form {
                        background: #fff;
                        height: 356px
                    }

                    .flip-box-part {
                        padding: 38px 40px 34px;
                        width: 100%;
                        margin: 0;
                        top: 0;
                        left: 0;
                        -webkit-backface-visibility: hidden;
                        backface-visibility: hidden;
                        -webkit-transition: 0.6s;
                        -webkit-transform-style: preserve-3d;
                        -webkit-transform: rotateY(0deg);
                        -moz-transition: 0.6s;
                        -moz-transform-style: preserve-3d;
                        -moz-transform: rotateY(0deg);
                        -o-transition: 0.6s;
                        -o-transform-style: preserve-3d;
                        -o-transform: rotateY(0deg);
                        -ms-transition: 0.6s;
                        -ms-transform-style: preserve-3d;
                        -ms-transform: rotateY(0deg);
                        transition: 0.6s;
                        -webkit-transform-style: preserve-3d;
                        transform-style: preserve-3d;
                        -webkit-transform: rotateY(0deg);
                        transform: rotateY(0deg);
                    }

                    .btn-block {
                        font: 600 19px/63px "Poppins", sans-serif;
                        text-transform: uppercase;
                        border: none;
                        transition: all 300ms linear 0s;
                        border-radius: 0;
                        background: #0084ff;
                        color: #FFF;
                        white-space: nowrap;
                        overflow: hidden;
                        text-overflow: ellipsis;
                    }

                    .form-control {
                        border-radius: 0;
                        box-shadow: none;
                        font: 300 17px/24px "Poppins", sans-serif;
                        padding: 12px 18px;
                        height: 50px;
                        border-color: #e0e8ee;
                        background: #f8fbfd;
                    }

                    .contact-form .js-close-flip {
                        position: absolute;
                        right: 0;
                        top: 0;
                        padding: 5px 10px;
                        font-size: 23px;
                        text-decoration: none;
                        color: #c0cad0;
                    }

                    .form-group {
                        margin-bottom: 20px;
                    }

                    .row-15 {
                        margin-left: -15px;
                        margin-right: -15px;
                    }

                    .contact-box h2 {
                        color: #374048;
                        margin: 0;
                        font-weight: bold;
                        text-transform: uppercase;
                    }

                    .contact-box ul li {
                        color: #777;
                        font-size: 16px;
                        padding-left: 30px;
                    }

                    .contact-box ul li i {
                        width: 30px;
                        float: left;
                        margin-left: -30px;
                        line-height: 32px;
                    }

                    .contact-box ul {
                        margin: 25px 0 30px;
                    }

                    .contact-box ul li+li {
                        margin-top: 10px;
                    }
                </style>
            </div>
        </section>

        <!-- #content end -->
        <jsp:include page="footer.jsp"/>
    </div><!-- #wrapper end -->


    <link href="//bizweb.dktcdn.net/100/048/087/themes/776353/assets/bootstrap.min.scss.css?1671122359380"
          rel="stylesheet" type="text/css" media="all" />
    <link href="//bizweb.dktcdn.net/100/048/087/themes/776353/assets/style.css?1671122359380" rel="stylesheet"
          type="text/css" media="all" />
    <link rel="stylesheet" type="text/css"
          href="//hstatic.net/0/global/design/member/fonts/svn-gotham-book,sans-serif.css">

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//bizweb.dktcdn.net/100/048/087/themes/776353/assets/scripts.js?1671122359380"
    type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>   
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <script src="js/countdown.js"></script>
    <script src="js/clickevents.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
