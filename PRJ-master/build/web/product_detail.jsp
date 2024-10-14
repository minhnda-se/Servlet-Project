<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>Product Detail</title>
        <link rel="icon" href="images/logo.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        <link rel="stylesheet" href="css/styleProductDetail.css">
        <style>
            /* Updated CSS */
            body {
                font-family: Arial, sans-serif;
                background-color: #242424;
                color: #333;
            }

            .sproduct {
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }

            .sproduct h3, .sproduct h2 {
                font-weight: bold;
                color: #333;
            }

            .sproduct select, .sproduct input {
                margin-bottom: 0px;
            }

            .sproduct .buy-btn {
                background-color: #F0E68C;
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
            }

            .sproduct .buy-btn:hover {
                background-color: #333;
            }

            .small-img-group {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
            }

            .small-img-col {
                flex-basis: 24%;
                cursor: pointer;
            }


        </style>
    </head>
    <body>
        <!--NAVIGATION-->
        <c:set var="product" value="${sessionScope.PRODUCT}"/>
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
                                <li><a href="MainController?btAction=GetUrl&url=contact.jsp">Contact Us</a></li>
                                <li>
                                    <a href="MainController?btAction=GetUrl&url=profile.jsp" class="active">Product</a>
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

        <!--Product detail-->
        <section class="container sproduct my-5 pt-5">
            <div class="row mt-5">
                <div class="col-lg-5 col-md-12 col-12">
                    <img class="img-fluid w-100 pb-1" src="images/file_anh_project/${product.id.trim()}/${product.id.trim()}.png" id="MainImg" alt="">
                    
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <h6><a href="MainController?btAction=GetUrl&url=product.jsp">Product</a>/<a href="MainController?btAction=GetUrl&url=product_detail.jsp">${product.id}</a></h6>
                    <h3 class="py-4">${product.name}</h3>
                    <h5>Stock: ${product.quantity}</h5>
                    <h4>${product.listPrice} VND</h4>
                    <form action="MainController" method="POST">
                        <input type="hidden" name="urlName" value="product_detail.jsp"/>
                        <input type="hidden" name="productID" value="${product.id}"/>
                        <input type="number" name="quantity" placeholder="1" style="padding-right: 0px; padding-left: 0px;">
                        <button type="submit" name="btAction" value="AddToCart" class="buy-btn">Add To Cart</button>
                    </form>
                    <h5 style="color: red">${requestScope.ADD_MESSAGE}</h5>
                    <h4 class="mt-5 mb-5">Product Details</h4>
                    <span>${product.description}</span>
                </div>
            </div>
        </section>

        
        
        <!--Footer-->
        <%@ include file="footer.jsp"%>
        <div class="modal fade" id="modal_box" role="dialog"></div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/clickevents.js"></script>

        <script>
            // JavaScript for small image click functionality
            var MainImg = document.getElementById("MainImg");
            var smallimg = document.getElementsByClassName("small-img");

            for (let i = 0; i < smallimg.length; i++) {
                smallimg[i].onclick = function () {
                    MainImg.src = smallimg[i].src;
                }
            }

            // JavaScript for navigation toggle
            const bar = document.getElementById('bar');
            const nav = document.getElementById('navbarSupportedContent');

            if (bar) {
                bar.addEventListener('click', () => {
                    nav.classList.toggle('show');
                });
            }
        </script>
    </body>
</html>
