<%-- 
    Document   : manager
    Created on : Aug 1, 2023, 2:12:51 PM
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
        <script>
            function myFunction() {
                alert("Do you want to delete the product?");
            }

       
        </script>
    </head>
    <body>

        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">
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
                            <a class="nav-link " href="">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">About</a>
                        </li>



                        <li class="nav-item" style="margin: 0 8px">
                            <button type="button" class="btn btn-info"> Manager Product</button>
                        </li>

                    </ul>
                    <!-- Left links -->      
                </div>
                <!-- Collapsible wrapper -->

                <!-- Right elements -->
                <div class="d-flex align-items-center">
                    <!-- Icon -->
                    <a class="nav-link me-3" href="#">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="badge rounded-pill badge-notification bg-danger">1</span>
                    </a>

                    <a class="nav-link me-3" href="#">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="nav-link me-3" href="#">
                        <i class="fab fa-twitter"></i>
                    </a>




                    <a class="btn-login" href="">
                        <button type="button" class="btn btn-danger">delete product</button>
                    </a>
                    <a class="btn-login" href="add">
                        <button type="button" class="btn btn-primary">add new product</button>
                    </a>




                </div>
                <!-- Right elements -->

            </div>
            <!-- Container wrapper -->
        </nav>

        <div class="container" style="margin-top: 100px">
            <div class="table-wrap">
                <table class="table table-responsive table-borderless">
                    <thead>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>&nbsp;</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listP}" var="i">
                            <tr class="align-middle alert border-bottom" role="alert">
                                <td>
                                    <input type="checkbox" id="check">
                                </td>
                                <td class="text-center">
                                    <img class="pic"
                                         src="${i.image}"
                                         alt="">
                                </td>
                                <td>
                                    <div>
                                        <p class="m-0 fw-bold">${i.name}</p>
                                        <p class="m-0 text-muted">${i.title}</p>
                                    </div>
                                </td>
                                <td>
                                    <div class="fw-600">$${i.price}</div>
                                </td>
                                <td class="d-">
                                    <input class="input" type="text" placeholder="${i.quantity}">
                                </td>
                                <td>
                                    $${i.price*i.quantity}
                                </td>
                                <td>
                                    <a class="btn-login" href="delete?pid=${i.id}" onclick="myFunction()" >
                                        <button style="margin-bottom: 6px;" type="button" class="btn btn-danger"><i class="fa-solid fa-delete-left"></i></button>
                                    </a>
                                    <a class="btn-login" href="update?pid=${i.id}" >
                                        <button id="myBtn" type="button" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></button>
                                    </a>
                                        
                                      
                                     
                                </td>
                            </tr>
                        </c:forEach>



                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
