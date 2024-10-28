<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
=========================================================
* Material Kit 2 - v3.0.4
=========================================================

* Product Page:  https://www.creative-tim.com/product/material-kit
* Copyright 2023 Creative Tim (https://www.creative-tim.com)
* Coded by www.creative-tim.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<html lang="en" itemscope itemtype="http://schema.org/WebPage">

<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
    <title>
        Material Kit 2 by Creative Tim
    </title>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
    <!-- Nucleo Icons -->
    <link href="${pageContext.request.contextPath}/css/nucleo-icons.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
    <!-- Include your login.js file -->
    <script src="${pageContext.request.contextPath}/js/kpaasJs/login.js"></script>
    <!-- CSS Files -->
    <link id="pagestyle" href="${pageContext.request.contextPath}/css/material-kit.css" rel="stylesheet" />


</head>

<body class="sign-in-basic">
<!-- Navbar Transparent -->
<nav class="navbar navbar-expand-lg position-absolute top-0 z-index-3 w-100 shadow-none my-3  navbar-transparent ">

</nav>
<!-- End Navbar -->
<div class="page-header align-items-start min-vh-100" style="background-image: url('${pageContext.request.contextPath}/img/kpaas/kpaasBackground.webp');">
    <span class="mask bg-gradient-dark opacity-1"></span>
    <div class="container my-auto">
        <div class="row">
            <div class="col-lg-4 col-md-8 col-12 mx-auto" style="width: 40%; min-width: 300px;">
                <div class="card z-index-0 fadeIn3 fadeInBottom">
                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                        <div class="bg-gradient-success shadow-primary border-radius-lg py-3 pe-1">
                            <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">로그인</h4>
                            <div class="row mt-3">
                                <div class="col-2 text-center ms-auto">

                                </div>
                                <div class="col-2 text-center px-1">

                                </div>
                                <div class="col-2 text-center me-auto">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form id="f" role="form" class="text-start">
                            <div class="input-group input-group-outline my-3">
<%--                                <label class="form-label">아이디</label>--%>
                                <input name="userId" id="userId" type="text" class="form-control" placeholder="아이디">
                            </div>
                            <div class="input-group input-group-outline mb-3">
<%--                                <label class="form-label">비밀번호</label>--%>
                                <input name="password" id="password" type="password" class="form-control" placeholder="비밀번호">
                            </div>
                            <div class="form-check form-switch d-flex align-items-center mb-3">

                            </div>
                            <div class="text-center">
                                <button id="btnLogin" type="button" class="btn bg-gradient-success" style="width: 250px;">로그인</button>

                            </div>
                            <div class="container text-center mt-4">
                                <p class="text-sm" style="display: inline-block; margin-right: 10px;">
                                    <a href="userReg">회원가입</a>
                                </p>
                                <p class="text-sm" style="display: inline-block; margin-right: 10px;">
                                    <a href="searchUserId">아이디 찾기</a>
                                </p>
                                <p class="text-sm" style="display: inline-block;">
                                    <a href="searchPassword">비밀번호 찾기</a>
                                </p>
                            </div>


                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <footer class="footer position-absolute bottom-2 py-2 w-100">
        <div class="container">
            <div class="row align-items-center justify-content-lg-between">
                <div class="col-12 col-md-6 my-auto">
                    <div class="copyright text-center text-sm text-white text-lg-start">
                        © <script>
                        document.write(new Date().getFullYear())
                    </script>,
                        made with <i class="fa fa-heart" aria-hidden="true"></i> by
                        <a href="https://www.creative-tim.com" class="font-weight-bold text-white" target="_blank">Creative Tim</a>
                        for a better web.
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com" class="nav-link text-white" target="_blank">Creative Tim</a>
                        </li>
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com/presentation" class="nav-link text-white" target="_blank">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com/blog" class="nav-link text-white" target="_blank">Blog</a>
                        </li>
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-white" target="_blank">License</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</div>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/js/core/popper.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/core/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/plugins/perfect-scrollbar.min.js"></script>

<script src="${pageContext.request.contextPath}/js/material-kit.min.js?v=3.0.4" type="text/javascript"></script>




</body>
</html>

</body>

</html>