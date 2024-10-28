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
        Material Kit 2 by Creative Tim
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

    <!--    js script for uploading picture-->
    <script src="${pageContext.request.contextPath}/js/kpaasJs/uploadHandler.js"></script>

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
                                        <a href="/user/sign-in" class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0">로그인</a>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- If logged in, show "프로필" and "로그아웃" buttons -->
                                        <a href="myPage.jsp" class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0">마이페이지</a>
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
    <!-- -------- START HEADER 4 w/ search book a ticket form ------- -->
    <!--<header>-->
    <!--    <div class="page-header min-height-400" loading="lazy">-->
    <!--        <span class="mask bg-gradient-dark opacity-8"></span>-->
    <!--    </div>-->
    <!--</header>-->
    <!-- -------- END HEADER 4 w/ search book a ticket form ------- -->
    <div class="card card-body blur shadow-blur mx-5 mx-md-7 mx-lg-9 mx-xl-10 mx-xxl-12 my-9 mx-auto" style="max-width: 1000px; min-width: 40%;">
        <!-- START Testimonials w/ user image & text & info -->

        <!-- START Blogs w/ 4 cards w/ image & text & link -->
        <section class="py-3">
            <div class="container">
                <div class="row">
                    <!--                    &lt;!&ndash; Left Section: 1/3 of the screen &ndash;&gt;-->
                    <!--                    <div class="col-lg-4 col-sm-4">-->
                    <!--                        <div class="card card-plain" style="border: none; box-shadow: none;">-->
                    <!--                            <div class="card-header p-0 position-relative" style="border: none;">-->
                    <!--                                <a class="d-block blur-shadow-image" style="outline: none;">-->
                    <!--                                    &lt;!&ndash; The existing image that will be replaced &ndash;&gt;-->
                    <!--                                    <img id="imageToReplace" src="${pageContext.request.contextPath}/img/kpaas/hikingTrail.webp" alt="img-blur-shadow"-->
                    <!--                                         class="img-fluid shadow border-radius-lg" loading="lazy">-->
                    <!--                                </a>-->
                    <!--                            </div>-->
                    <!--                            &lt;!&ndash; Button below the image &ndash;&gt;-->
                    <!--                            <div class="card-body text-center mt-3 p-0" style="border: none; box-shadow: none;">-->
                    <!--                                &lt;!&ndash; Hidden file input &ndash;&gt;-->
                    <!--                                <input type="file" id="fileInput" accept="image/*" style="display: none;" onchange="handleFileUpload(this)">-->

                    <!--                                &lt;!&ndash; Button to trigger file input &ndash;&gt;-->
                    <!--                                <button type="button" class="btn btn-outline-success" style="width: 100%;" onclick="document.getElementById('fileInput').click();">-->
                    <!--                                    사진 업로드-->
                    <!--                                </button>-->

                    <!--                                &lt;!&ndash; "상처 분석 시작" Button (Initially hidden) &ndash;&gt;-->
                    <!--                                <button type="button" id="analyzeButton" class="btn btn-outline-success" style="display: none; width: 100%;" onclick="startAnalysis()">-->
                    <!--                                    상처 분석 시작-->
                    <!--                                </button>-->

                    <!--                                &lt;!&ndash; Progress Bar (Initially hidden) &ndash;&gt;-->
                    <!--                                <div id="progressBar" class="progress" style="height: 30px; display: none; background-color: #e9ecef;">-->
                    <!--                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success d-flex justify-content-center align-items-center" role="progressbar" style="width: 100%; height: 100%;">-->
                    <!--                                        분석 중-->
                    <!--                                    </div>-->
                    <!--                                </div>-->

                    <!--                                &lt;!&ndash; "분석 결과" Button (Initially hidden) &ndash;&gt;-->
                    <!--                                <button type="button" id="resultButton" class="btn btn-outline-success" style="display: none; width: 100%; margin-bottom: 0 !important;" onclick="redirectToResult()">-->
                    <!--                                    분석 결과-->
                    <!--                                </button>-->
                    <!--                            </div>-->



                    <!--                        </div>-->
                    <!--                    </div>-->


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
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"></li>
                                        </ol>

                                        <!-- Carousel Slides -->
                                        <div class="carousel-inner">
                                            <!-- Slide 1 -->
                                            <div class="carousel-item active">
                                                <div class="card-body px-0 py-3"><br><br>
                                                    <div class="card-header p-0 position-relative" style="border: none;">
                                                        <a class="d-block blur-shadow-image" style="outline: none;">
                                                            <!-- The existing image that will be replaced -->
                                                            <img id="imageToReplace"
                                                                 src="${pageContext.request.contextPath}/img/kpaas/Bleeding_control.png"
                                                                 alt="img-blur-shadow"
                                                                 class="img-fluid shadow border-radius-lg"
                                                                 style="width: 600px; height: 400px; object-fit: cover;"
                                                                 loading="lazy">
                                                        </a>
                                                        <br>

                                                    </div>
                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        관통상 출혈조절 하기

                                                    </h4>
                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">출혈 압박하기:</strong><br>
                                                        출혈 부위에 깨끗한 천이나 드레싱을 사용하여 직접 압박을 가합니다. 압박은 출혈을 줄이고 혈액 응고를 촉진합니다.<br><br>
                                                        <strong style="font-weight: bold;">출혈 부위 놀피 올리기: </strong><br>
                                                        출혈이 있는 부위를 심장보다 높이 올리면 혈류가 감소하여 출혈을 줄이는 데 도움이 됩니다.<br><br>
                                                        <strong style="font-weight: bold;">출혈 부위에 지혈제 사용: </strong><br>
                                                        상처에 지혈제를 적용하여 출혈을 신속하게 멈출 수 있습니다. 지혈제는 혈액 응고를 촉진하는 성분이 포함되어 있습니다.<br><br>
                                                    </p><br><br>

                                                </div>
                                            </div>
                                            <!-- Slide 2 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3"><br>
                                                    <a class="d-block blur-shadow-image" style="outline: none;">
                                                        <img id="imageToReplace2"
                                                             src="${pageContext.request.contextPath}/img/kpaas/dressing.png"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        관통상 상처 보호하기
                                                    </h4>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">관통상 감염 예방:</strong><br>
                                                        상처를 깨끗하게 보호함으로써 외부 세균이나 오염 물질이 침투하는 것을 방지하고, 감염 위험을 줄입니다.<br><br>
                                                        <strong style="font-weight: bold;">관통상 지혈 유지: </strong><br>
                                                        상처를 보호하면 출혈이 더 이상 발생하지 않도록 도와주며, 지혈 상태를 유지할 수 있습니다.<br><br>
                                                        <strong style="font-weight: bold;">관통상 치유 촉진: </strong><br>
                                                        상처를 적절히 보호하면 상처 치유 과정이 원활하게 진행되며, 통증을 줄이고 회복 시간을 단축할 수 있습니다.<br><br>

                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 3 -->
                                            <div class="carousel-item">
                                                <div class="card-body py-3"><br>
                                                    <div class="card-body px-0 py-3"><br>
                                                        <a class="d-block blur-shadow-image" style="outline: none;">
                                                            <img id="imageToReplace3"
                                                                 src="${pageContext.request.contextPath}/img/kpaas/jinreo.webp"
                                                                 alt="img-blur-shadow"
                                                                 class="img-fluid shadow border-radius-lg"
                                                                 style="width: 600px; height: 400px; object-fit: cover;"
                                                                 loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                        </a>
                                                        <br>
                                                        <h4 class="text-dark font-weight-bold">
                                                            관통상 시 즉시 전문병원 연락
                                                        </h4>
                                                        <p class="text-dark fs-5">
                                                            <strong style="font-weight:bold; ">생명위협 발생:</strong><br>
                                                            관통상은 내부 장기나 혈관을 손상시킬 수 있어 즉각적인 치료가 필요합니다. 출혈이 심할 경우 생명이 위태로울 수 있습니다.<br><br>
                                                            <strong style="font-weight:bold; ">감염위험 발생:</strong><br>
                                                            관통상은 상처를 통해 세균이 침투할 위험이 높습니다. 전문의의 평가와 적절한 항생제 처치가 필요합니다.<br><br>
                                                            <strong style="font-weight:bold; ">정확한진단 치료 가능:</strong><br>
                                                            관통상의 정도와 손상된 부위를 정확히 평가하여 필요한 치료(수술 등)를 받을 수 있도록 전문병원에서 진단받는 것이 중요합니다.<br><br>


                                                        </p><br><br>
                                                    </div>
                                                </div>
                                                <!-- Slide 4 -->


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
            </div>
        </section>


        <!-- END Blogs w/ 4 cards w/ image & text & link -->
    </div>

    <!-- -------- START FOOTER 5 w/ DARK BACKGROUND ------- -->
    <footer class="footer position-absolute bottom-2 py-2 w-100">
        <div class="container">
            <div class="row align-items-center justify-content-lg-between">
                <div class="col-12 col-md-6 my-auto">
                    <div class="copyright text-center text-sm text-white text-lg-start">
                        ©
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        ,
                        made with <i class="fa fa-heart" aria-hidden="true"></i> by
                        <a href="https://www.creative-tim.com" class="font-weight-bold text-white" target="_blank">Creative
                            Tim</a>
                        for a better web.
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com" class="nav-link text-white" target="_blank">Creative
                                Tim</a>
                        </li>
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com/presentation" class="nav-link text-white"
                               target="_blank">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com/blog" class="nav-link text-white"
                               target="_blank">Blog</a>
                        </li>
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-white"
                               target="_blank">License</a>
                        </li>
                    </ul>
                </div>
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