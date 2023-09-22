<%-- 
    Document   : add
    Created on : Aug 1, 2023, 3:58:50 PM
    Author     : tuant
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </head>
    <body>
        <%@include file="header.jsp" %>

        <!--Main layout-->
        <main class="mt-5 pt-4">
            <div class="container">
                <!-- Heading -->
                <h2 class="my-5 text-center">Add form</h2>

                <!--Grid row-->
                <div class="row">
                    <!--Grid column-->
                    <div class="col-md-8 mb-4">
                        <!--Card-->
                        <div class="card p-4">


                            <form action="add" method="post">

                                <!--email-->
                                <p class="">
                                    Email (optional)
                                </p>
                                <div class="form-outline mb-4">
                                    <input name="name" style="width: 100%;padding: 7px;" type="text" 
                                           placeholder="Enter the name"  />
                                </div>
                                <p class="">
                                    Image (optional)
                                </p>
                                <div class="form-outline mb-4">
                                    <input  name="image" style="width: 100%;padding: 7px; " type="text" 
                                            placeholder="Enter the name"  />
                                </div>

                                <p class="">
                                    Price (optional)
                                </p>
                                <div class="form-outline mb-4">
                                    <input  name="price" style="width: 100%;padding: 7px; " type="text" 
                                            placeholder="Enter the name"  />
                                </div>
                                 <p class="">
                                    Quantity (optional)
                                </p>
                                <div class="form-outline mb-4">
                                    <input  name="quantity" style="width: 100%;padding: 7px; " type="text" 
                                            placeholder="Enter the quantity"  />
                                </div>
                                <p class="">
                                    Title (optional)
                                </p>
                                <div class="form-outline mb-4">
                                    <input  name="title" style="width: 100%;padding: 7px; " type="text" 
                                            placeholder="Enter the name"  />
                                </div>

                                <p class="">
                                    Description (optional)
                                </p>
                                <div class="form-outline mb-4">
                                    <input  name="des" style="width: 100%;padding: 7px; " type="text" 
                                            placeholder="Enter the name"  />
                                </div>
                                
                                <select class="mb-3" name="category" style="padding: 10px 20px"> >List of category

                                    <c:forEach items="${listc}" var="c">
                                        <option value="${c.cid}">${c.cname}</option>
                                    </c:forEach>

                                </select>
                                <hr class="mb-4" />                    
                                <button class="btn btn-primary" style="width: 100%"type="submit">Continue to checkout</button>
                            </form>
                        </div>
                        <!--/.Card-->
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-4 mb-4">
                        <!-- Heading -->
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-muted">Your cart</span>
                            <span class="badge rounded-pill badge-primary">3</span>
                        </h4>

                        <!-- Cart -->
                        <ul class="list-group mb-3">
                            <li class="list-group-item d-flex justify-content-between">
                                <div>
                                    <h6 class="my-0">Product name</h6>
                                    <small class="text-muted">Brief description</small>
                                </div>
                                <span class="text-muted">$12</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <div>
                                    <h6 class="my-0">Second product</h6>
                                    <small class="text-muted">Brief description</small>
                                </div>
                                <span class="text-muted">$8</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <div>
                                    <h6 class="my-0">Third item</h6>
                                    <small class="text-muted">Brief description</small>
                                </div>
                                <span class="text-muted">$5</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between bg-light">
                                <div class="text-success">
                                    <h6 class="my-0">Promo code</h6>
                                    <small>EXAMPLECODE</small>
                                </div>
                                <span class="text-success">-$5</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total (USD)</span>
                                <strong>$20</strong>
                            </li>
                        </ul>
                        <!-- Cart -->

                        <!-- Promo code -->
                        <form class="card p-2">
                            <div class="input-group mb-3">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Promo code"
                                    aria-label="Promo code"
                                    aria-describedby="button-addon2"
                                    />
                                <button class="btn btn-primary" type="button" id="button-addon2" data-mdb-ripple-color="dark">
                                    redeem
                                </button>
                            </div>
                        </form>
                        <!-- Promo code -->
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->
            </div>
        </main>
        <!--Main layout-->

        <!-- footer -->
        <%@include file="footer.jsp" %>

    </body>
</html>
