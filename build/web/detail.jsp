<%-- 
    Document   : detail
    Created on : Jul 31, 2023, 2:32:23 PM
    Author     : tuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- MDB icon -->
        <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
        <!-- Font Awesome -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            />
        <!-- Google Fonts Roboto -->
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
            />
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />
        
        <script type="text/javascript">
            function warningAddToCart() {
                alert("You must be logged in to shop now !")
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <!-- Navbar -->

        <!--Main layout-->
        <main class="mt-5 pt-4">
            <div class="container mt-5">
                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <img src="${p.image}" class="img-fluid img-detail" alt="" />
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <!--Content-->
                        <div class="p-4">
                            <div class="mb-3">
                                <a href="">
                                    <span class="badge bg-dark me-1">Category </span>
                                </a>
                                <a href="">
                                    <span class="badge bg-info me-1">New</span>
                                </a>
                                <a href="">
                                    <span class="badge bg-danger me-1">Bestseller</span>
                                </a>
                            </div>

                            <p class="lead">
                                <span class="me-1">
                                    <del>$${p.price*2}</del>
                                </span>
                                <span>$${p.price}</span>
                            </p>

                            <strong><p style="font-size: 20px;">Description</p></strong>

                            <p>${p.description}</p>

                            <div class="h4">
                                Quantity
                            </div>

                            <c:if test="${((sessionScope.account) != null)}">
                                <form class="d-flex justify-content-left" action="buy?id=${p.id}" method="post">
                                    <!-- Default input -->

                                    <div class="form me-1" style="width: 180px;">
                                        <input name="num" type="text" required placeholder="Enter number to buy"  class="form-control" />
                                    </div>
                                    <button class="btn btn-primary ms-1" type="submit">
                                        Add to cart
                                        <i class="fas fa-shopping-cart ms-1"></i>
                                    </button>
                                  
                                </form>
                            </c:if>
                            <c:if test="${((sessionScope.account) == null)}">
                                
                                <form class="d-flex justify-content-left" action="detail?pid=${p.id}" method="post">
                                    <!-- Default input -->

                                    <div class="form me-1" style="width: 180px;">
                                        <input name="num" type="text" required placeholder="Enter number to buy"  class="form-control" />
                                    </div>
                                    <button class="btn btn-primary ms-1" type="submit" onclick="warningAddToCart()">
                                        Add to cart
                                        <i class="fas fa-shopping-cart ms-1"></i>
                                    </button>
                                    
                                </form>
                                
                            </c:if>

                        </div>
                        <!--Content-->
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->

                <hr />
           
            </div>
        </main>
        <!--Main layout-->

        <!-- footer -->
        <footer class="text-center text-white mt-4" style="background-color: #607d8b;">
            <!--Call to action-->
            <div class="pt-4 pb-2">
                <a class="btn btn-outline-white footer-cta mx-2" style="box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px;" href="https://mdbootstrap.com/docs/jquery/getting-started/download/" target="_blank" role="button">
                    Download MDB
                    <i class="fas fa-download ms-2"></i>
                </a>
                <a class="btn btn-outline-white footer-cta mx-2" style="box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px;" href="https://mdbootstrap.com/education/bootstrap/" target="_blank" role="button">
                    Start free tutorial
                    <i class="fas fa-graduation-cap ms-2"></i>
                </a>
            </div>
            <!--/.Call to action-->

            <hr class="text-dark" />

            <div class="container">
                <!-- Section: Social media -->
                <section class="mb-3">
                    <!-- Facebook -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-facebook-f"></i></a>

                    <!-- Twitter -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-twitter"></i></a>

                    <!-- Google -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-google"></i></a>

                    <!-- Instagram -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-instagram"></i></a>

                    <!-- YouTube -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-youtube"></i></a>
                    <!-- Github -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-github"></i></a>
                </section>
                <!-- Section: Social media -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2); text-color: #e0e0e0;">
                © 2022 Copyright:
                <a class="text-white" href="https://mdbootstrap.com/">MDBootstrap.com</a>
            </div>
            <!-- Copyright -->
        </footer>
    </body>
</html>
