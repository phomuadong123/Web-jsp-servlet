<%-- 
    Document   : cart
    Created on : Aug 3, 2023, 1:40:01 PM
    Author     : tuant
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            function checkOutSuccess() {
                alert("Checkout successfully!");
            }
        </script>

    </head>
    <body>
        <section class="h-100 h-custom" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card">
                            <div class="card-body p-4">

                                <div class="row">

                                    <div class="col-lg-7">
                                        <h5 class="mb-3"><a href="home" class="text-body"><i
                                                    class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                        <hr>

                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <div>
                                                <p class="mb-1">Shopping cart</p>
                                                <p class="mb-0">You have  items in your cart</p>
                                            </div>
                                            <div>
                                                <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!"
                                                                                                            class="text-body">price <i class="fas fa-angle-down mt-1"></i></a></p>
                                            </div>
                                        </div>



                                        <c:set var="o" value="${sessionScope.order}"  />


                                        <c:forEach items="${o.items}" var="i">
                                            <div class="card mb-3">
                                                <div class="card-body">
                                                    <div class="d-flex justify-content-between">
                                                        <div class="d-flex flex-row align-items-center">
                                                            <div>
                                                                <img
                                                                    src="${i.product.image}"
                                                                    class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                            </div>
                                                            <div class="ms-3">
                                                                <h5>${i.product.name}</h5>
                                                                <p class="small mb-0">${i.product.title}</p>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex flex-row align-items-center" >
                                                            <div style="width: 140px; display: flex; align-items: center; font-size: 30px">
                                                                <a href="process?num=-1&id=${i.product.id}"><button style="margin-bottom: 10px" type="button" class="btn btn-light">-</button></a>
                                                                <h5 class="fw-normal mb-0">${i.quantity}</h5>
                                                                <a href="process?num=1&id=${i.product.id}"><button style="margin-bottom: 10px" type="button" class="btn btn-light">+</button></a>
                                                            </div>
                                                            <div style="width: 85px;">
                                                                <h5 class="mb-0">$${i.price*i.quantity}</h5>
                                                            </div>
                                                            <div style="width: 120px;">
                                                                <form action="process" method="post">
                                                                    <input type="hidden" name="id" value="${i.product.id}"/>
                                                                    <input class="btn btn-info" type="submit" value="return item"/>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>  
                                        </c:forEach>









                                    </div>
                                    <div class="col-lg-5">

                                        <div class="card bg-primary text-white rounded-3">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between align-items-center mb-4">
                                                    <h5 class="mb-0">Card details</h5>
                                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                                                         class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                                                </div>

                                                <p class="small mb-2">Card type</p>
                                                <a href="#!" type="submit" class="text-white"><i
                                                        class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                                <a href="#!" type="submit" class="text-white"><i
                                                        class="fab fa-cc-visa fa-2x me-2"></i></a>
                                                <a href="#!" type="submit" class="text-white"><i
                                                        class="fab fa-cc-amex fa-2x me-2"></i></a>
                                                <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>

                                                <form class="mt-4">
                                                    <div class="form-outline form-white mb-4">
                                                        <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                                                               placeholder="Cardholder's Name" />
                                                        <label class="form-label" for="typeName">Cardholder's Name</label>
                                                    </div>

                                                    <div class="form-outline form-white mb-4">
                                                        <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
                                                               placeholder="1234 5678 9012 3457" minlength="19" maxlength="19" />
                                                        <label class="form-label" for="typeText">Card Number</label>
                                                    </div>

                                                    <div class="row mb-4">
                                                        <div class="col-md-6">
                                                            <div class="form-outline form-white">
                                                                <input type="text" id="typeExp" class="form-control form-control-lg"
                                                                       placeholder="MM/YYYY" size="7" id="exp" minlength="7" maxlength="7" />
                                                                <label class="form-label" for="typeExp">Expiration</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-outline form-white">
                                                                <input type="password" id="typeText" class="form-control form-control-lg"
                                                                       placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                                                                <label class="form-label" for="typeText">Cvv</label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </form>

                                                <hr class="my-4">

                                                <div class="d-flex justify-content-between">
                                                    <p class="mb-2">Subtotal</p>
                                                    <p class="mb-2">$${o.getTotalMoney()}</p>
                                                </div>

                                                <div class="d-flex justify-content-between">
                                                    <p class="mb-2">Shipping</p>
                                                    <p class="mb-2">$20.00</p>
                                                </div>

                                                <div class="d-flex justify-content-between mb-4">
                                                    <p class="mb-2">Total(Incl. taxes)</p>
                                                    <p class="mb-2">$${o.getTotalMoney()+20}</p>
                                                </div>
                                                <form action="checkout" method="post">
                                                    <button onclick="checkOutSuccess()" type="submit" class="btn btn-info btn-block btn-lg">
                                                        <div class="d-flex justify-content-between">
                                                            <span>$${o.getTotalMoney()+20}</span>
                                                            <span >Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                                        </div>
                                                    </button>
                                                </form>


                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
