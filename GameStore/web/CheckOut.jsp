<%-- 
    Document   : checkout
    Created on : Aug 19, 2024, 3:24:38 PM
    Author     : Anh Minh
--%>

<%@page import="gamestore.dto.ItemDTO"%>
<%@page import="gamestore.dao.CartDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Checkout</title>
        <%@include file="htmlhead.jsp" %>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='' rel='stylesheet'>
        <style>
            h2 {
                font-size: 40px;
                background: linear-gradient(to left, #660066 0%, #ff3300 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }
        </style>
        <script type='text/javascript' src=''></script>
        <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>

        <%@include file="header.jsp" %>
        <%
            CartDAO cartDAO = new CartDAO();
            List<ItemDTO> cart = cartDAO.viewCart((int) session.getAttribute("USER_ID"));
            session.setAttribute("SUM_PRICE", cartDAO.getTotal(cart));
            session.setAttribute("VIEW_CART_LIST", cart);
        %>
        <main>
            <section class="inner_page_head">
                <div class="container_fuild">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="full">
                                <h3>CHECKOUT</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <form action="MainController" class="needs-validation" novalidate>
                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary">Your cart</span>
                            <span class="badge bg-primary rounded-pill">${sessionScope.VIEW_CART_LIST.size()}</span>
                        </h4>
                        <ul class="list-group mb-3">
                            <!--DO loop right here-->
                            <c:forEach var="item" items="${sessionScope.VIEW_CART_LIST}">
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">${item.getGame().getName()} x${item.quantity}</h6>
                                        <small class="text-muted">${item.getGame().getPlatform()}</small>
                                    </div>
                                    <span class="text-muted">${item.getSubPrice()}</span>
                                </li>
                            </c:forEach>
                            <!--End looping-->
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total</span>
                                <strong>
                                    $${sessionScope.SUM_PRICE}
                                </strong>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Delivery Information</h4>

                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label for="firstName" class="form-label">First name</label>
                                <input type="text" name="firstName" class="form-control" id="firstName" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <label for="lastName" class="form-label">Phone Number</label>
                                <input type="text" name="phone" class="form-control" id="lastName" placeholder="" value="${sessionScope.USER_INFORMATION.phoneNumber}" required>
                                <div class="invalid-feedback">
                                    Valid phone is required.
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
                                <input type="email" name="email" class="form-control" id="email" placeholder="you@example.com">
                                <div class="invalid-feedback">
                                    Please enter a valid email address for shipping updates.
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" name="address" class="form-control" id="address" placeholder="Plaza street" required>
                                <div class="invalid-feedback">
                                    Please enter your shipping address.
                                </div>
                            </div>
                        </div>
                        <h4 class="mb-3">Payment</h4>
                        <div class="my-3">
                            <div class="form-check">
                                <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
                                <label class="form-check-label" for="credit">Cash</label>
                            </div>
                        </div>
                        <hr class="my-4">
                    </div>
                </div>
                <div class="py-5 text-center">
                    <button class="w-100 btn btn-danger btn-lg" type="submit" name="action" value="Checkout">Check Out</button>
                </div>
            </form>

        </main>
        <script type='text/javascript'></script>
    </body>
</html>