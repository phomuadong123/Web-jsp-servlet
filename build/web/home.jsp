<%-- 
    Document   : home
    Created on : Jul 31, 2023, 10:28:29 AM
    Author     : tuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

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
            function warningAddToCart() {
                alert("You must be logged in to shop now !")
            }
        </script>
    </head>

    <body>

        <!-- Button trigger modal -->

        <%@include file="header.jsp" %>
        <!--Main layout-->
        <main>
            <div class="container">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-dark mt-3 mb-5 shadow p-2" style="background-color:#60a7c9 ">
                    <!-- Container wrapper -->
                    <div class="container-fluid">

                        <!-- Navbar brand -->
                        <a class="navbar-brand" href="#">Categories:</a>

                        <!-- Toggle button -->
                        <button 
                            class="navbar-toggler" 
                            type="button" 
                            data-mdb-toggle="collapse" 
                            data-mdb-target="#navbarSupportedContent2" 
                            aria-controls="navbarSupportedContent2" 
                            aria-expanded="false" 
                            aria-label="Toggle navigation">
                            <i class="fas fa-bars"></i>
                        </button>

                        <!-- Collapsible wrapper -->
                        <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0 category-list">
                                <li class="nav-item acitve">
                                    <a class="nav-link text-white modal-category" href="category?cateID=${0}">All</a>
                                </li>
                                <c:forEach items="${requestScope.category}" var="c">

                                    <!-- Link -->
                                    <li class="nav-item acitve">
                                        <a style="border-radius: 6px" class="nav-link text-white modal-category ${tag==c.cid ? "active-category":""}" href="category?cateID=${c.cid}">${c.cname}</a>
                                    </li>

                                </c:forEach>

                            </ul>

                            <!-- Search -->
                            <form action="search" method="post" style="display: flex">
                                <form 
                                    class="w-auto py-1 " style="max-width: 24rem;">
                                    <input name="txt" type="search" value="${txt}"
                                           class="form-control rounded-0" style="width: 300px" placeholder="Search" aria-label="Search">
                                    <button type="submit" class="btn btn-outline-light"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </form>
                            </form>

                        </div>
                    </div>
                    <!-- Container wrapper -->
                </nav>
                <!-- Navbar -->

                <!-- Products -->
                <section>
                    <div class="text-center">
                        <div class="row">




                            <c:forEach items="${requestScope.product}" var="p">

                                <div class="col-lg-3 col-md-6 mb-4" style="border-radius: 0 ">
                                    <div class="card" style="">
                                        <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
                                             data-mdb-ripple-color="light">

                                            <img style="height: 261px;" src="${p.image}"
                                                 class="w-100" />

                                            <a href="detail?pid=${p.id}">              
                                                <div class="hover-overlay">
                                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                                </div>
                                            </a>
                                        </div>
                                        <a href="detail?pid=${p.id}" style="padding: 1px 8px; color: #607D8B">
                                            <div class="" style="">
                                                <p class="text-reset">
                                                <p ${p.name}</p>
                                                </p>
                                                <p href="" class="text-reset ">
                                                <p style="height: 57px; overflow: hidden; padding: 0 8px">${p.title}</p>
                                                </p>
                                                <p class="lead">
                                                    <span class="me-1">
                                                        <del>$${p.price*2}</del>
                                                    </span>
                                                    <span>$${p.price}</span>
                                                    <c:if test="${((sessionScope.account) != null)}">
                                                        <a href="buy?id=${p.id}&quantity=1" >
                                                            <button style="margin-left: 40px; color: orange" type="submit" class="btn btn-light"><i class="fa-brands fa-shopify"></i></button>
                                                        </a>
                                                    </c:if>
                                                    
                                                     <c:if test="${((sessionScope.account) == null)}">
                                                        <a href="home" >
                                                            <button style="margin-left: 40px;color: orange" type="submit" onclick="warningAddToCart()"
                                                                    class="btn btn-light"><i class="fa-brands fa-shopify"></i></button>
                                                        </a>
                                                    </c:if>
                                                </p>

                                            </div>
                                        </a>





                                    </div>
                                </div> 


                            </c:forEach>



                        </div>


                    </div>
                </section>

                <!-- Pagination -->
                <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                    <ul class="pagination">
                        <li class="page-item ">
                            <a class="page-link  ${tagindex<=1?"disabled":""} " href="home?index=${tagindex-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>

                        <c:forEach begin="1" end="${endpage}" var="i">
                            <li  class="page-item ${(tagindex==i)?"active":""}"><a class="page-link" href="home?index=${i}">${i}</a></li>
                            </c:forEach>



                        <li class="page-item">
                            <a class="page-link ${tagindex==endpage?"disabled":""}" href="home?index=${tagindex+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>  
                <!-- Pagination -->  
            </div>
        </main>
        <!--Main layout-->
        <%@include file="footer.jsp" %>


    </body>

</html>