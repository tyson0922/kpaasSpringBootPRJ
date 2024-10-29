<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!--
=========================================================
* Material Kit 2 - v3.0.4
=========================================================

* Product Page: https://www.creative-tim.com/product/material-kit
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

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap JavaScript and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>


    <style>
        /* Constrain the carousel controls to their respective columns */
        .custom-control {
            position: relative; /* Set controls relative to their container */
            left: 0;
            right: 0;
            width: 100%; /* Make controls fill their column */
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center; /* Center the controls horizontally */
        }

        /* Override Bootstrap's default positioning of the carousel controls */
        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-image: none; /* Remove the default background image */
            width: auto; /* Remove fixed width */
            height: auto; /* Remove fixed height */
            vertical-align: middle; /* Align vertically */
        }

        .carousel-control-prev-icon::before,
        .carousel-control-next-icon::before {
            font-size: 7rem; /* Increase the arrow size */
            color: var(--bs-success); /* Bootstrap success green */
            text-decoration: none; /* Remove any potential underline */
            display: inline-block; /* Ensure no text underline */
            vertical-align: middle; /* Align vertically */
        }


        .carousel-control-prev-icon::before {
            content: '‹'; /* Left arrow */
        }

        .carousel-control-next-icon::before {
            content: '›'; /* Right arrow */
        }

        .carousel-indicators li {
            background-color: var(--bs-success) !important; /* Bootstrap success green */
            height: 1rem !important; /* Slightly increase the height */
            width: 3rem !important; /* Optionally, you can adjust the width if needed */
            border-radius: 40% !important; /* Keep the round shape */
        }

        .carousel-indicators .active {
            background-color: var(--bs-success) !important; /* Ensure active indicator is also green */
            opacity: 1 !important; /* Make the active indicator fully visible */
        }

    </style>
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
                                        <a href="/user/sign-in"
                                           class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0">로그인</a>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- If logged in, show "프로필" and "로그아웃" buttons -->
                                        <a href="/user/profile"
                                           class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0">마이페이지</a>
                                        <a href="/user/logout"
                                           class="btn btn-sm bg-gradient-danger mb-0 me-1 mt-2 mt-md-0">로그아웃</a>
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

    <div class="card card-body blur shadow-blur mx-5 mx-md-7 mx-lg-9 mx-xl-10 mx-xxl-12 my-9 mx-auto"
         style="max-width: 1000px; min-width: 40%;">
        <!-- START Testimonials w/ user image & text & info -->

        <!-- START Blogs w/ 4 cards w/ image & text & link -->
        <section class="py-3">
            <div class="container">
                <div class="row">

                    <!-- Right Section: 2/3 of the screen (contains the carousel) -->
                    <div class="col-lg-12 col-sm-8">

                        <div class="d-flex h-100">
                            <!-- Left Control Column (10% width of available screen) -->
                            <div class="col-1 d-flex align-items-center">
                                <a class="carousel-control-prev custom-control text-success"
                                   href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </a>
                            </div>


                            <!-- Carousel (80% width of available screen) -->
                            <div class="d-flex justify-content-center align-items-center">

                                <div class="col-10">
                                    <div id="carouselExampleIndicators" class="carousel slide">
                                        <!-- Carousel Indicators -->
                                        <ol class="carousel-indicators">
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                                class="active"></li>
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>

                                        </ol>

                                        <!-- Carousel Slides -->
                                        <div class="carousel-inner">
                                            <!-- Slide 1 -->
                                            <div class="carousel-item active">
                                                <div class="card-body px-0 py-3"><br><br>
                                                    <div class="card-header p-0 position-relative"
                                                         style="border: none;">
                                                        <a class="d-block blur-shadow-image" style="outline: none;">
                                                            <!-- The existing image that will be replaced -->
                                                            <img class="mx-auto d-block" id="imageToReplace"
                                                                 src="${pageContext.request.contextPath}/img/kpaas/water.webp"
                                                                 class="img-fluid shadow border-radius-lg"
                                                                 style="width: 600px; height: 400px; object-fit: cover;"
                                                                 loading="lazy">
                                                        </a>
                                                        <br>

                                                    </div>
                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        차가운 물로 식히기:
                                                        <br><br> 화상 부위를 즉시 흐르는 차가운 물에 10-20분 동안 식혀주세요. 이는 통증을 줄이고 피부 손상을
                                                        최소화하는 데 도움이 됩니다.

                                                    </h4>
                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">통증 완화:</strong><br>
                                                        차가운 물은 피부의 온도를 낮추어 통증을 줄이는 데 효과적입니다. 이는 신경 수용체의 활동을 감소시켜 불편함을
                                                        완화합니다.<br><br>
                                                        <strong style="font-weight: bold;">피부 손상 최소화: </strong><br>
                                                        화상 부위를 즉시 차가운 물로 식히면 피부가 더 깊게 손상되는 것을 방지할 수 있습니다. 이는 화상이 더 심해지는
                                                        것을 예방합니다.<br><br>
                                                        <strong style="font-weight: bold;">염증 감소: </strong><br>
                                                        차가운 물로 식히면 혈관이 수축되어 염증과 부종을 줄이는 데 도움이 됩니다. 염증이 줄어들면 회복 과정이 빨라질 수
                                                        있습니다.

                                                        <br><br>
                                                    </p><br><br>

                                                </div>
                                            </div>
                                            <!-- Slide 2 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3 mx-auto"><br>
                                                    <a class="d-block blur-shadow-image mx-auto" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace2"
                                                             src="${pageContext.request.contextPath}/img/kpaas/dressing.png"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        상처 보호:
                                                        <br><br> 화상 부위를 깨끗한 천이나 드레싱으로 덮어 감염을 예방하고 상처를 보호하세요. 절대 터치하거나
                                                        문지르지 않도록 합니다.
                                                    </h4>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">감염 예방: </strong><br>
                                                        상처를 적절히 보호하면 외부 세균이나 이물질의 침입을 막아 감염 위험을 줄일 수 있습니다. 이는 치유 과정에서 매우
                                                        중요합니다.<br><br>
                                                        <strong style="font-weight: bold;">치유 촉진: </strong><br>
                                                        상처를 보호하면 외부 자극으로부터 안전하게 유지되어 치유가 원활하게 진행됩니다. 상처가 안전한 환경에서 회복될 수
                                                        있도록 도와줍니다.<br><br>
                                                        <strong style="font-weight: bold;">통증 감소:</strong><br>
                                                        상처를 보호하는 것은 통증을 줄이는 데 도움이 됩니다. 외부 자극이나 마찰로부터 상처를 방지하여 불필요한 통증을
                                                        완화할 수 있습니다.<br><br>


                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 3 -->
                                            <div class="carousel-item">
                                                <div class="card-body py-3"><br>
                                                    <div class="card-body px-0 py-3"><br>
                                                        <a class="d-block blur-shadow-image" style="outline: none;">
                                                            <img class="d-block mx-auto" id="imageToReplace3"
                                                                 src="${pageContext.request.contextPath}/img/kpaas/jinreo.webp"
                                                                 alt="img-blur-shadow"
                                                                 class="img-fluid shadow border-radius-lg"
                                                                 style="width: 600px; height: 400px; object-fit: cover;"
                                                                 loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                        </a>
                                                        <br>
                                                        <h4 class="text-dark font-weight-bold">
                                                            전문 의료 도움 요청: <br><br>
                                                            화상의 정도가 심하거나 넓은 면적에 발생한 경우, 즉시 병원이나 응급실로 가서 전문적인 치료를 받는 것이
                                                            중요합니다.
                                                        </h4>
                                                        <p class="text-dark fs-5">
                                                            <strong style="font-weight:bold; ">정확한 진단과 치료:</strong><br>
                                                            의료 전문가는 상처의 심각성을 평가하고 적절한 치료를 제공할 수 있습니다. 이를 통해 효과적인 치료 계획을
                                                            세울 수 있습니다.<br><br>
                                                            <strong style="font-weight:bold; ">합병증 예방: </strong><br>
                                                            신속한 의료 개입은 출혈, 감염, 또는 내부 장기 손상과 같은 합병증을 예방하는 데 도움이 됩니다. 조기에
                                                            치료를 받으면 회복 속도가 빨라질 수 있습니다.<br><br>
                                                            <strong style="font-weight:bold; ">전문적인 관리:</strong><br>
                                                            의료진은 상처 관리, 통증 조절 및 재활에 대한 전문 지식을 가지고 있습니다. 이를 통해 환자는 보다
                                                            효과적이고 안전한 치료를 받을 수 있습니다<br><br>


                                                        </p><br><br>
                                                    </div>
                                                </div>
                                                <!-- Slide 4 -->


                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- Right Control Column (10% width of available screen) -->
                            <div class="col-1 d-flex align-items-center">
                                <a class="carousel-control-next custom-control text-success"
                                   href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </a>
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