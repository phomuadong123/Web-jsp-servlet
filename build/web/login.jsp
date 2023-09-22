<%-- 
    Document   : login
    Created on : Jul 31, 2023, 6:44:04 PM
    Author     : tuant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <a class="navbar navbar-dark bg-primary" href="home ">
            <button style="margin: 0 20px; font-size: 16px;font-weight: 700" type="button" class="btn btn-primary">
                <i style="padding: 0 10px" class="fa-solid fa-right-from-bracket"></i>Return home</button>
        </a>
        <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                             class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="login" method="post">
                            <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                                <p class="lead fw-normal mb-0 me-3">Sign in with</p>
                                <button type="button" class="btn btn-primary btn-floating mx-1">
                                    <i class="fab fa-facebook-f"></i>
                                </button>

                                <button type="button" class="btn btn-primary btn-floating mx-1">
                                    <i class="fab fa-twitter"></i>
                                </button>

                                <button type="button" class="btn btn-primary btn-floating mx-1">
                                    <i class="fab fa-linkedin-in"></i>
                                </button>
                            </div>

                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0">Or</p>
                            </div>
                            <h4 style="color: red">${requestScope.error}</h4>
                            <!-- Email input -->
                            <c:set var="cookie" value="${pageContext.request.cookies}"/>
                            <div class="form-outline mb-4" >
                                <label class="form-label label-login" for="form3Example3">Username</label>
                                <input value="${cookie.cuser.value}" name="user" type="text" id="form3Example3" class="input-login"
                                       placeholder="Enter a username" />  
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-3">
                                <label class="form-label label-login" for="form3Example4">Password</label>
                                <input value="${cookie.cpass.value}" name="pass" type="password" id="form3Example4" class=" input-login"
                                       placeholder="Enter password" /> 
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-0">
                                    <input  value="ON" class="form-check-input me-2" type="checkbox" ${((cookie.crem!=null)?"checked":"")} name="rem" id="form2Example3" />
                                    <label class="form-check-label" for="form2Example3">
                                        Remember me
                                    </label>
                                </div>
                                <a href="#" class="text-body">Forgot password?</a>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button  type="submit" class="btn btn-primary btn-lg"
                                         style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                                <p class="h5 fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="register.jsp"
                                                                                               class="link-danger">Register</a></p>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
            <div
                class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
                <!-- Copyright -->
                <div class="text-white mb-3 mb-md-0">
                    Copyright © 2020. All rights reserved.
                </div>
                <!-- Copyright -->

                <!-- Right -->
                <div>
                    <a href="#!" class="text-white me-4">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#!" class="text-white me-4">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#!" class="text-white me-4">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="#!" class="text-white">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
                <!-- Right -->
            </div>
        </section>
    </body>
</html>
