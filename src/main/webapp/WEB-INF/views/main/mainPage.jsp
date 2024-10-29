<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
    <title>
        TrailAid
    </title>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700"/>
    <!-- Nucleo Icons -->
    <link href="${pageContext.request.contextPath}/css/nucleo-icons.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
    <!-- CSS Files -->
    <link id="pagestyle" href="${pageContext.request.contextPath}/css/material-kit.css?v=3.0.4" rel="stylesheet"/>

    <!-- Include Axios in your HTML file -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


</head>

<body class="blog-author bg-gray-200">
<!-- Navbar Transparent -->
<div class="container position-sticky z-index-sticky top-0">
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg  blur border-radius-xl mt-4 top-0 z-index-3 shadow position-absolute my-3 py-2 start-0 end-0 mx-4">
                <div class="container-fluid px-0">
                    <a class="navbar-brand font-weight-bolder ms-sm-3" href="/main/mainPage">
                        TraiAid
                    </a>
                    <button class="navbar-toggler shadow-none ms-2" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false"
                            aria-label="Toggle navigation">
              <span class="navbar-toggler-icon mt-2">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </span>
                    </button>
                    <div class="collapse navbar-collapse pt-3 pb-2 py-lg-0 w-100" id="navigation">
                        <ul class="navbar-nav navbar-nav-hover ms-auto">
                            <li class="nav-item ms-lg-auto">
                                <a class="nav-link nav-link-icon me-2" href="/main/hikingMap">
                                    <p class="d-inline text-sm z-index-1 font-weight-bold">지도</p>
                                </a>
                            </li>
                            <li class="nav-item ms-lg-auto">
                                <a class="nav-link nav-link-icon me-2" href="/main/injuryDetection">
                                    <p class="d-inline text-sm z-index-1 font-weight-bold">상처 분석</p>
                                </a>
                            </li>
                            <li class="nav-item ms-lg-auto">
                                <a class="nav-link nav-link-icon me-2" href="/main/hikingInfo">
                                    <p class="d-inline text-sm z-index-1 font-weight-bold">도움되는 등산 정보</p>
                                </a>
                            </li>
                            <li class="nav-item my-auto ms-3 ms-lg-0">
                                <c:choose>
                                    <c:when test="${sessionScope.SS_USER_ID == null}">
                                        <!-- If not logged in, show "로그인" button -->
                                        <a href="/user/sign-in" class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0">로그인</a>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- If logged in, show "프로필" and "로그아웃" buttons -->
                                        <a href="/user/profile" class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0">마이페이지</a>
                                        <a href="/user/logout" class="btn btn-sm bg-gradient-danger mb-0 me-1 mt-2 mt-md-0">로그아웃</a>
                                    </c:otherwise>
                                </c:choose>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
        </div>
    </div>
</div>
<!-- End Navbar -->
<div class="page-header align-items-start min-vh-100"
     style="background-image: url('${pageContext.request.contextPath}/img/kpaas/kpaasBackground.webp');">

    <div class="card card-body blur shadow-blur mx-5 mx-md-7 mx-lg-9 mx-xl-10 mx-xxl-12 my-9 mx-auto" style="max-width: 100%;">




        <!-- START Testimonials w/ user image & text & info -->
        <section class="py-sm-4 py-5 position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-12 mx-auto">
                        <div class="mt-n8 mt-md-n8 mt-lg-n7 mt-xl-n7 text-center">

                            <img class="avatar shadow-xl position-relative z-index-2 mt-sm-n3"
                                 src="${pageContext.request.contextPath}/img/kpaas/kpaaslogo.png" alt="logo" loading="lazy"
                                 style="width: 175px; height: 175px;">

                        </div>
                        <div class="row py-3">
                            <div class="col-lg-8 col-md-8 z-index-2 position-relative px-md-2 px-sm-5 mx-auto">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <h2 class="mb-0">TrailAid</h2>

                                </div>

                                <p class="text-lg mb-0">
                                <p class="lead text-dark fs-5"> 최고의 하이킹 코스를 발견하고, 부상 예방 및 회복에 대한 통찰을 얻으며, 하이킹 관련 팁과 가이드를 제공합니다. <br>
                                    경험이 많은 등산가든, 초보자든, 여러분의 하이킹을 지원합니다.</p>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END Testimonials w/ user image & text & info -->
        <!-- START Blogs w/ 4 cards w/ image & text & link -->
        <section class="py-3">
            <div class="container">
                <div class="row px-0">
                    <!--                    <div class="col-lg-6">-->
                    <!--                        <h3 class="mb-5">하이킹 가이드: 코스 추천, 부상 분석, 필수 정보</h3>-->
                    <!--                    </div>-->
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6">
                        <div class="card card-plain">
                            <div class="card-header p-0 position-relative">
                                <a href="hikingMap" class="d-block blur-shadow-image">
                                    <img src="${pageContext.request.contextPath}/img/kpaas/hikingTrail.webp" alt="img-blur-shadow"
                                         class="img-fluid shadow border-radius-lg" loading="lazy">
                                </a>
                            </div>
                            <div class="card-body px-0">
                                <h4>
                                    <a href="hikingMap" class="text-dark font-weight-bold"> 완벽한 하이킹 코스 찾기</a>
                                </h4>
                                <p class="text-dark fs-5">
                                    간단한 산책을 원하든 도전적인 모험을 원하든, 여러분의 취향에 맞는 최고의 하이킹 코스를 발견하세요.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-5">
                        <div class="card card-plain">
                            <div class="card-header p-0 position-relative">
                                <a href="injuryDetection" class="d-block blur-shadow-image">
                                    <img src="${pageContext.request.contextPath}/img/kpaas/injuredHikingPerson.webp" alt="img-blur-shadow"
                                         class="img-fluid shadow border-radius-lg" loading="lazy">
                                </a>
                            </div>
                            <div class="card-body px-0">
                                <h4>
                                    <a href="/main/injuryDetection" class="text-dark font-weight-bold">하이킹 관련 부상 분석</a>
                                </h4>
                                <p class="text-dark fs-6">
                                    하이킹 중 발생한 부상 사진을 업로드하고 치료 옵션과 예방 팁에 대한 통찰을 얻으세요.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="card card-plain">
                            <div class="card-header p-0 position-relative">
                                <a href="/main/hikingInfo" class="d-block blur-shadow-image">
                                    <img src="${pageContext.request.contextPath}/img/kpaas/hikingInfo.webp" alt="img-blur-shadow"
                                         class="img-fluid shadow border-radius-lg" loading="lazy">
                                </a>
                            </div>
                            <div class="card-body px-0">
                                <h4>
                                    <a href="/main/hikingInfo" class="text-dark font-weight-bold">하이킹 팁 및 정보</a>
                                </h4>
                                <p class="text-dark fs-5">
                                    최신 하이킹 팁, 장비 추천, 안전 지침 등 더 나은 하이킹 경험을 위한 정보를 얻으세요.
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- END Blogs w/ 4 cards w/ image & text & link -->
    </div>

    <!-- -------- START FOOTER 5 w/ DARK BACKGROUND ------- -->
    <footer class="footer position-absolute bottom-2 py-2 w-100" style="min-height: 50px;">
        <div class="container">
            <div class="row align-items-center justify-content-lg-between">

            </div>
        </div>
    </footer>
    <!-- -------- END FOOTER 5 w/ DARK BACKGROUND ------- -->
</div>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/js/core/popper.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/core/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/plugins/perfect-scrollbar.min.js"></script>
<!-- Control Center for Material UI Kit: parallax effects, scripts for the example pages etc -->
<!--  Google Maps Plugin    -->

<script src="${pageContext.request.contextPath}/js/material-kit.min.js?v=3.0.4" type="text/javascript"></script>
</body>

</html>