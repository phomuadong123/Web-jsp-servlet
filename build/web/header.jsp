<%-- 
    Document   : header
    Created on : Jul 31, 2023, 6:32:43 PM
    Author     : tuant
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white" style="padding-bottom: 10px">
            <!-- Container wrapper -->
            <div class="container">    
                <!-- Toggle button -->
                <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent1"
                    aria-controls="navbarSupportedContent1"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent1" >      
                    <!-- Navbar brand -->
                    <a class="navbar-brand mt-2 mt-sm-0" href="home">
                        <img
                            src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
                            height="20"
                            alt="MDB Logo"
                            loading="lazy"
                            />
                    </a>
                    <!-- Left links -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link " href="home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">Contact</a>
                        </li>
                        <c:if test="${sessionScope.account.isAdmin==1}">
                            <li class="nav-item" style="margin: 0px 8px;margin-top: 4px">
                                <a href="account"> <button type="button" class="btn btn-info"> Manager Account</button></a>
                            </li>
                        </c:if>



                        <c:if test="${sessionScope.account.isSell==1}">
                            <li class="nav-item" style="margin: 0px 8px;margin-top: 4px">
                                <a href="manager"><button type="button" class="btn btn-info"> Manager Product</button></a>
                            </li>
                        </c:if>
                    </ul>
                    <!-- Left links -->      
                </div>
                <!-- Collapsible wrapper -->

                <!-- Right elements -->
                <div class="d-flex align-items-center">
                    <!-- Icon -->
                    <a class="nav-link me-3" href="cart.jsp">
                        <button type="button" class="btn btn-outline-info" >
                            <i class="fas fa-shopping-cart"  style="font-size: 16px"></i>
                        </button>
                        <span class="badge rounded-pill badge-notification bg-danger" > ${sessionScope.size}</span>
                    </a>

                    <a class="nav-link me-3" href="#">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="nav-link me-3" href="#">
                        <i class="fab fa-twitter"></i>
                    </a>

                    <c:if test="${((sessionScope.account) != null)}">
                        <form action="logout">
                            <a href="login.jsp" style="margin-right: 12px;">
                                <button type="submit" class="btn btn-info">log out</button>
                            </a>
                        </form>
                        <a href="" class="border rounded px-2 nav-link"
                           target="_blank">
                            <i class="fab fa-github me-2"></i>Hello ${sessionScope.account.user} 
                        </a>
                    </c:if>

                    <c:if test="${((sessionScope.account) == null)}">
                        <a  href="login.jsp" style="margin-right: 12px;">
                            <button type="button" class="btn btn-info">login</button>
                        </a>
                        <a  href="register.jsp" style="margin-right: 12px;">
                            <button type="button" class="btn btn-info">Sign Up</button>
                        </a>
                    </c:if>



                </div>
                <!-- Right elements -->

            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- Navbar -->

        <!-- carousel -->
        <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-mdb-ride="carousel">
            <div class="carousel-indicators">
                <button
                    type="button"
                    data-mdb-target="#carouselExampleCaptions"
                    data-mdb-slide-to="0"
                    class="active"
                    aria-current="true"
                    aria-label="Slide 1"
                    ></button>
                <button
                    type="button"
                    data-mdb-target="#carouselExampleCaptions"
                    data-mdb-slide-to="1"
                    aria-label="Slide 2"
                    ></button>
                <button
                    type="button"
                    data-mdb-target="#carouselExampleCaptions"
                    data-mdb-slide-to="2"
                    aria-label="Slide 3"
                    ></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://static.sneakerjagers.com/news/nl/2021/11/LandingPage_Banners_Sneaker-1440x416-1-1024x296.jpg" class="d-block w-100" alt="Wild Landscape"/>
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
                    <div class="carousel-caption d-none d-sm-block mb-5">
                        <h1 class="mb-5">
                            <strong>WALK IT YOUR WAY</strong>
                        </h1>

                        

                        <p class="mb-4 d-none d-md-block">
                            <strong>No expectations, no rules. Tell your story with the Superstar XLG.</strong>
                        </p>

                        <a target="_blank" href="home" class="btn btn-outline-white btn-lg">Shop now
                            <i class="fas fa-graduation-cap ms-2"></i>
                        </a>
                    </div>
                </div>
               
              
            </div>
           
            
        </div>

    </body>
</html>
