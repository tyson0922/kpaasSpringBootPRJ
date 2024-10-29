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

    <!-- -------- END HEADER 4 w/ search book a ticket form ------- -->
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
                                                        <a class="d-block mx-auto blur-shadow-image" style="outline: none;">
                                                            <!-- The existing image that will be replaced -->
                                                            <img class="mx-auto d-block" id="imageToReplace"
                                                                 src="${pageContext.request.contextPath}/img/kpaas/jojul.webp"
                                                                 class="img-fluid shadow border-radius-lg"
                                                                 style="width: 600px; height: 400px; object-fit: cover;"
                                                                 loading="lazy">
                                                        </a>
                                                        <br>

                                                    </div>
                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        신속히 안정 유지:
                                                        <br><br> 뱀에 물렸을때는 가능한 한 움직이지 않도록 하여 독이 전신으로 퍼지는 것을 최소화해야 합니다. 물린
                                                        부위를 심장보다 낮은 위치에 두고, 편안한 자세를 유지하도록 합니다.

                                                    </h4>
                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">독의 확산 최소화:</strong><br>
                                                        뱀에 물린 후 움직임을 최소화하면 독이 혈액순환을 통해 전신으로 퍼지는 속도를 줄일 수 있습니다. 이는 중독 증상을
                                                        완화하는 데 도움이 됩니다.<br><br>
                                                        <strong style="font-weight: bold;">심리적 안정 제공: </strong><br>
                                                        안정된 자세를 유지하면 피해자가 불안감을 줄이고 심리적으로 안정될 수 있습니다. 이는 전반적인 상황 대처에 긍정적인
                                                        영향을 미칩니다.<br><br>
                                                        <strong style="font-weight: bold;">응급 처치의 효과 극대화: </strong><br>
                                                        의료진이 도착할 때까지 안정된 상태를 유지하면, 상황이 더 나빠지지 않고 응급 처치의 효과를 극대화할 수 있습니다.
                                                        이는 치료 결과에 긍정적인 영향을 미치는 요소입니다.

                                                        <br><br>
                                                    </p><br><br>

                                                </div>
                                            </div>
                                            <!-- Slide 2 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3"><br>
                                                    <a class="d-block mx-auto blur-shadow-image" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace2"
                                                             src="${pageContext.request.contextPath}/img/kpaas/sodok.webp"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        즉시 의료기관 방문:
                                                        <br><br> 뱀에 물린 경우, 즉시 병원이나 응급실로 가야 합니다. 전문가의 치료가 필요하며, 독사인지 아닌지
                                                        확인하고 적절한 항독소 치료를 받아야 합니다.
                                                    </h4>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">전문적인 치료 제공:</strong><br>
                                                        의료기관에서는 전문가가 정확한 진단을 내리고, 필요에 따라 항독소 치료나 수술 등의 적절한 치료를 받을 수
                                                        있습니다. 이는 회복에 중요한 역할을 합니다.<br><br>
                                                        <strong style="font-weight: bold;">합병증 예방: </strong><br>
                                                        뱀에 물린 후 신속히 치료를 받으면, 감염이나 조직 손상 등 합병증의 발생 가능성을 줄일 수 있습니다. 조기에
                                                        치료받는 것이 중요합니다.<br><br>
                                                        <strong style="font-weight: bold;">상태 모니터링:</strong><br>
                                                        의료기관에서는 피해자의 상태를 지속적으로 모니터링하고, 필요한 경우 추가적인 처치를 통해 상태를 안정적으로 유지할
                                                        수 있습니다. 이는 중증으로 발전하는 것을 방지하는 데 도움이 됩니다.
                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 3 -->
                                            <div class="carousel-item">
                                                <div class="card-body py-3"><br>
                                                    <div class="card-body px-0 py-3"><br>
                                                        <a class="d-block mx-auto blur-shadow-image" style="outline: none;">
                                                            <img class="d-block mx-auto" id="imageToReplace3"
                                                                 src="${pageContext.request.contextPath}/img/kpaas/dressing.png"
                                                                 alt="img-blur-shadow"
                                                                 class="img-fluid shadow border-radius-lg"
                                                                 style="width: 600px; height: 400px; object-fit: cover;"
                                                                 loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                        </a>
                                                        <br>
                                                        <h4 class="text-dark font-weight-bold">
                                                            기타 응급처치: <br><br>
                                                            뱀에 물렸을때 추가적인 응급처치 입니다!
                                                        </h4>
                                                        <p class="text-dark fs-5">
                                                            <strong style="font-weight:bold; ">물린 부위 고정:</strong><br>
                                                            물린 부위를 가능한 한 움직이지 않도록 고정합니다. 상처 주변의 관절이나 근육을 사용하지 않도록 하여 독이
                                                            퍼지는 것을 최소화합니다.<br><br>
                                                            <strong style="font-weight:bold; ">압박대 사용 자제: </strong><br>
                                                            물린 부위를 압박하는 것은 피해야 합니다. 압박대를 사용하거나 물린 부위를 자르는 것은 혈액 순환을
                                                            방해하고, 독이 더 빨리 퍼지게 할 수 있으므로 금지합니다.<br><br>
                                                            <strong style="font-weight:bold; ">신체 상태 관찰:</strong><br>
                                                            피해자의 신체 상태를 주의 깊게 관찰하여 호흡, 맥박, 의식 상태 등을 체크합니다. 이상 증상이 발생하면
                                                            즉시 의료진에게 알리도록 합니다.
                                                        </p><br><br>
                                                    </div>
                                                </div>

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