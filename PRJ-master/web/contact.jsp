<%-- 
    Document   : contact_us
    Created on : Jul 6, 2024, 8:47:08 PM
    Author     : user
--%>

<%@page import="prj.dal.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact us</title>
        <link rel="stylesheet" href="css/styleContactUs.css">
        <link rel="icon" href="images/logo.png"/> 
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("USER");
        %>
        <c:set var="url" value="profile.jsp"/> 
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
                                <li><a href="MainController?btAction=GetUrl&url=contact_us.jsp" class="active">Contact Us</a></li>
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

        <div class="contactUs">
            <div class="title">
                <h2>Contact Us</h2>
            </div>
            <div class="box">
                <!-- Form -->
                <div class="contact form">
                    <h3>Send a message</h3>
                    <form>
                        <div class="formBox">
                            <div class="row50">
                                <div class="inputBox">
                                    <span>First Name</span>
                                    <input type="text" placeholder="John">
                                </div>
                                <div class="inputBox">
                                    <span>Last Name</span>
                                    <input type="text" placeholder="Doe">
                                </div>
                            </div>
                            <div class="row50">
                                <div class="inputBox">
                                    <span>Email</span>
                                    <input type="text" placeholder="johndoe@gmail.com">
                                </div>
                                <div class="inputBox">
                                    <span>Mobile</span>
                                    <input type="text" placeholder="+84 96 354 7896">
                                </div>
                            </div>
                            <div class="row100">
                                <div class="inputBox">
                                    <span>Message</span>
                                    <textarea placeholder="Write your message here...."></textarea>
                                </div>
                            </div>
                            <div class="row100">
                                <div class="inputBox">
                                    <input type="submit" value="Send">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Info Box -->
                <div class="contact info">
                    <h3>Contact Information</h3>
                    <div class="infoBox">
                        <div>
                            <span><i class='bx bx-location-plus'></i></span>
                            <p>Ho Chi Minh, Sai Gon <br/> VIET NAM</p>
                        </div>
                        <div>
                            <span><i class='bx bx-envelope' ></i></span>
                            <a href="mailto:loremipsum@email.com">sang@email.com</a>
                        </div>
                        <div>
                            <span><i class='bx bx-phone' ></i></span>
                            <a href="tel: +84 978 479 856">+84 964 578 944</a>
                        </div>
                        <ul class="sci">
                            <li><a href="#"><i class='bx bxl-facebook-circle'></i></a></li>
                            <li><a href="#"><i class='bx bxl-instagram-alt' ></i></a></li>
                            <li><a href="#"><i class='bx bxl-tiktok' ></i></a></li>
                            <li><a href="#"><i class='bx bxl-twitter'></i></a></li> 
                        </ul>
                    </div>
                </div>
                <!-- Map -->
                <div class="contact map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6100105370224!2d106.80730807593318!3d10.841127589311606!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2sFPT%20University%20HCMC!5e0!3m2!1sen!2s!4v1720277724010!5m2!1sen!2s"style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>

        </div>  
    </body>
</html>
