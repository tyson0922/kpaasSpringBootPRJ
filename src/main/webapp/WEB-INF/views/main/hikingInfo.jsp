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
        <section class="py-3" >
            <div class="container" >
                <div class="row">

                    <!-- Right Section: 2/3 of the screen (contains the carousel) -->
                    <div class="col-lg-12 col-sm-8">

                        <div class="d-flex h-100 mx-auto" >
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
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"></li>
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5"></li>
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6"></li>
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="7"></li>
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="8"></li>
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="9"></li>
<%--                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="10"></li>--%>


                                        </ol>

                                        <!-- Carousel Slides -->
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="card-body px-0 py-3"><br><br>

                                                    <a class="d-block mx-auto blur-shadow-image" style="outline: none;">
                                                        <!-- The existing image that will be replaced -->
                                                        <img class="mx-auto d-block" id="imageToReplace"
                                                             src="${pageContext.request.contextPath}/img/kpaas/hiking_EX1.webp"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy">
                                                    </a>
                                                    <br>
                                                    <!-- 제목 추가 -->


                                                    <br>

                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        오래전 부터 등산은!
                                                        <br><br>
                                                    </h4>
                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">등산에 대하여 :</strong><br>
                                                        우리나라에서 등산은 매우 인기 있는 취미입니다. 2015년 조사에 따르면, 19세 이상 성인 4명 중 3명이 매년
                                                        한 번 이상 등산을 하고, 이는 약 3억4천만 명에 해당합니다. 국토의 65%가 산으로 이루어진 만큼, 등산은
                                                        자연스러운 활동입니다.<br><br>


                                                        <br><br>
                                                    </p><br><br>
                                                </div>
                                            </div>

                                            <!-- Slide 2 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3 mx-auto"><br>
                                                    <a class="d-block mx-auto blur-shadow-image mx-auto" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace2"
                                                             src="${pageContext.request.contextPath}/img/kpaas/x.png"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h5 class="text-dark font-weight-bold">
                                                        잘못된 등산문화:
                                                    </h5>
                                                    <br><br> 우리나라의 등산 문화는 산이 많고 등산을 좋아하는 사람들이 많은데, 아쉽게도 몇 가지 부족한 점이
                                                    있습니다. 대표적인 잘못된 등산 문화로는 다음과 같은 것들이 있습니다:
                                                    <br><br>


                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">- 바위에 낙서를 하는 등 자연물을 훼손하는
                                                            행위</strong><br>
                                                        <br>
                                                        <strong style="font-weight:bold; ">- 약초채취 산행이니, 나물채취 산행이라 하여
                                                            무분별하게 식물을 채취하는 행위</strong><br>
                                                        <br>
                                                        <strong style="font-weight:bold; ">- 취사가 금지된 곳에서 버젓이 불을 피우고 조리하는
                                                            행위</strong><br>
                                                        <br>
                                                        <strong style="font-weight:bold; ">- 술을 먹고 소란을 피우는
                                                            행위</strong><br>
                                                        <br>
                                                        <strong style="font-weight:bold; ">- 과도한 표지리본 부착</strong><br>
                                                        <br>
                                                        <strong style="font-weight:bold; ">- 산 정상에 올라 함성을 지르는 일</strong><br>
                                                        <br>
                                                        <strong style="font-weight:bold; ">- 쓰레기 투기</strong><br>
                                                        <br>


                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 3 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3 mx-auto"><br>
                                                    <a class="d-block mx-auto blur-shadow-image mx-auto" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace3"
                                                             src="${pageContext.request.contextPath}/img/kpaas/LeaveNoTrace.jpg"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h5 class="text-dark font-weight-bold">
                                                        흔적 남기지 않기(Leave No Trace) 운동:
                                                        <br><br>
                                                    </h5>

                                                    <p class="text-dark fs-5">


                                                        외국에서는 시민단체들이 등산과 같은 야외 활동을 위한 규칙을 제정하여 시민들의 참여를 유도하고 있습니다.
                                                        대표적인 예가 ‘흔적 남기지 않기(Leave No Trace) 운동’입니다. 이 운동은 다음과 같은 7가지 원칙을
                                                        제시합니다:.<br><br>

                                                </div>
                                            </div>
                                            <!-- Slide 4 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3 mx-auto"><br>
                                                    <a class="d-block mx-auto blur-shadow-image mx-auto" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace4"
                                                             src="${pageContext.request.contextPath}/img/kpaas/plan.jpg"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h5 class="text-dark font-weight-bold">
                                                        원칙 1.
                                                        <br><br>
                                                    </h5>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">산행을 미리 계획하고
                                                            준비하라:</strong><br>

                                                        - 여러분이 방문할 지역에 관한 규정이나 규칙을 알아 두세요.<br>
                                                        - 갑작스런 날씨 , 위험 및 비상사태에 대한대비를 하세요.<br>
                                                        - 사람들이 많은 시간을 피하여 여행계획을 세우세요. <br>
                                                        - 4~6 명으로 작은 그룹으로 방문해주세요!. <br>
                                                        - 남은 음식은 다시 포장해서 가져와주세요! <br>
                                                        - 등산로 주변에 있는 페인트 표시, 돌무더기 또는 리본표시를 없애기 위해 지도 및 나침반을 사용하세요.<br>
                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 5 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3 mx-auto"><br>
                                                    <a class="d-block mx-auto blur-shadow-image mx-auto" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace5"
                                                             src="${pageContext.request.contextPath}/img/kpaas/hard.jpg"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h5 class="text-dark font-weight-bold">
                                                        원칙 2
                                                        <br><br> 이동하거나 야영할 때는 바닥이 단단한 곳을 이용하라.
                                                    </h5>

                                                    <p class="text-dark fs-5">
                                                        - 바닥이 단단한 곳은 정비된 등산로, 야영장, 바위, 자갈, 건초, 눈을 포함합니다.<br><br>
                                                        - 야영 시에는 호수와 계곡에서 최소 60미터 이상 떨어진 곳에서 진행해 수변지역을 보호해야 합니다.
                                                        <br><br>
                                                        - 좋은 야영장이 있더라도 지정된 장소가 아닐 경우 위치를 변경하지 않도록 합니다.<br><br>

                                                        <strong style="font-weight: bold;">대중적인 지역에서는:</strong><br>
                                                        기존 등산로와 야영장을 사용하세요.<br>
                                                        등산로가 젖어 있어도 등산로 중앙으로 보행하세요.<br>
                                                        야영장을 작게 만드세요. 식물이 없는 지역에서 활동하세요.<br>

                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 6 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3 mx-auto"><br>
                                                    <a class="d-block mx-auto blur-shadow-image mx-auto" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace6"
                                                             src="${pageContext.request.contextPath}/img/kpaas/trash.jpg"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h5 class="text-dark font-weight-bold">
                                                        원칙 3.
                                                        <br><br>
                                                    </h5>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">쓰레기를 바르게 처리하라</strong><br>
                                                        - 야영장과 주변 지역의 쓰레기와 남은 음식을 확인하고, 모든 쓰레기는 싸서 가져가야 합니다.<br>
                                                        - 배설물은 물, 야영장, 등산로에서 최소 60미터 이상 떨어진 곳에 20센티미터 깊이로 묻어야 하며, 화장지와
                                                        위생제품은 가져가야 합니다.<br>
                                                        - 씻을 때는 물을 시내나 호수에서 60미터 이상 떨어진 곳으로 가져가고, 소량의 생물분해성 비누를 사용하여 씻은
                                                        후 개숫물은 주변에 흩어 뿌립니다.<br>
                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 7 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3 mx-auto"><br>
                                                    <a class="d-block mx-auto blur-shadow-image mx-auto" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace7"
                                                             src="${pageContext.request.contextPath}/img/kpaas/flower.jpg"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h5 class="text-dark font-weight-bold">
                                                        원칙 4.
                                                        <br><br>
                                                    </h5>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">자연물을 그 자리에 그대로 남겨두라.</strong><br><br>
                                                        - 과거를 보존하십시오. 그러나 문화 또는 역사적인 구조물이나 유물을 만지지 마세요.<br>
                                                        - 바위, 식물 및 다른 자연물들을 당신이 발견한 그대로 남겨두십시오.<br>
                                                        - 외래종이나 침입종 생물을 가져오지 마세요.<br>
                                                        - 구조물, 가구, 도랑이나 구덩이를 만들지 마세요.<br>
                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 8 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3 mx-auto"><br>
                                                    <a class="d-block mx-auto blur-shadow-image mx-auto" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace8"
                                                             src="${pageContext.request.contextPath}/img/kpaas/fire.jpg"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h5 class="text-dark font-weight-bold">
                                                        원칙 5.
                                                        <br><br>
                                                    </h5>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">모닥불을 피울 때는 주변에 미치는 영향을
                                                            최소화하세요.(산불을 조심하라)</strong><br>
                                                        - 모닥불은 주변지역에 오래도록 영향을 줄 수 있습니다. 경량 버너를 이용하여 조리하고 야간에는 손전등을
                                                        이용하세요.<br>
                                                        - 불을 피울 수 있는 곳에서는 주변에 둘레를 파고 불을 피우세요.<br>
                                                        - 불을 작게 유지하세요. 손으로 부러뜨릴 수 있는 작은 나뭇가지를 이용하세요.<br>
                                                        - 모든 나무를 완전히 태워 재를 만들고, 모닥불을 완전하게 끈 다음 차가워진 재를 뿌리세요.<br>
                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 9-->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3 mx-auto"><br>
                                                    <a class="d-block mx-auto blur-shadow-image mx-auto" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace9"
                                                             src="${pageContext.request.contextPath}/img/kpaas/bird.jpg"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h5 class="text-dark font-weight-bold">
                                                        원칙 6.
                                                        <br><br>
                                                    </h5>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">야생동식물을 존중하세요.</strong><br>
                                                        - 야생동식물은 떨어져서 관찰하고 야생동물을 좇아가지 마십시오.<br>
                                                        - 동물들에게 먹이를 주지 마세요. 먹이를 주면 야생동물의 건강에 해롭거나 자연습성이 변할 수 있습니다. 또
                                                        포식자나 다른 위험에 노출시킬 수 있습니다.<br>
                                                        - 야생동식물을 보호하고 음식물과 쓰레기를 안전하게 보관하세요.<br>
                                                        - 애완동물을 항상 통제하거나 집에 두고 오세요.<br>
                                                        - 짝짓기 시기나 둥지를 만드는 시기, 새끼를 기르는 시기, 겨울철 등 민감한 시기에는 야생동물을 피하세요.<br>
                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 10 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3 mx-auto"><br>
                                                    <a class="d-block mx-auto blur-shadow-image mx-auto" style="outline: none;">
                                                        <img class="d-block mx-auto" id="imageToReplace10"
                                                             src="${pageContext.request.contextPath}/img/kpaas/couple.jpg"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h5 class="text-dark font-weight-bold">
                                                        원칙 7.
                                                        <br><br>
                                                    </h5>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">다른 방문자를 생각하세요.</strong><br>
                                                        - 다른 방문자를 존중하고 그들의 좋은 경험을 할 수 있도록 고려해 주세요.<br>
                                                        - 예의바르게 행동하시고, 등산로에서는 다른 이용자들에게 양보해 주세요.<br>
                                                        - 등산로에서 짐을 가진 사람과 마주쳤을 때에는 아래쪽으로 비켜 주세요.<br>
                                                        - 쉬거나 야영할 때에는 등산로나 다른 사용자들로부터 적당한 거리를 두세요.<br>
                                                        - 자연의 소리를 들을 수 있도록 큰 소리로 떠들거나 소음을 내지 마세요.<br>
                                                    </p><br><br>
                                                    <h5 class="text-dark font-weight-bold">
                                                        안전한 등산하세요!
                                                        <br><br>
                                                    </h5>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">출처 : 산림청/등산문화개선</strong><br>

                                                    </p><br><br>
                                                </div>
                                            </div>
<%--                                            <!-- Slide 11 -->--%>
<%--                                            <div class="carousel-item">--%>
<%--                                                <div class="card-body px-0 py-3 mx-auto"><br>--%>
<%--                                                    <a class="d-block mx-auto blur-shadow-image mx-auto" style="outline: none;">--%>
<%--                                                        <img class="d-block mx-auto" id="imageToReplace11"--%>
<%--                                                             src="${pageContext.request.contextPath}/img/kpaas/thanks.jpg"--%>
<%--                                                             alt="img-blur-shadow"--%>
<%--                                                             class="img-fluid shadow border-radius-lg"--%>
<%--                                                             style="width: 600px; height: 400px; object-fit: cover;"--%>
<%--                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->--%>

<%--                                                    </a>--%>
<%--                                                    <br>--%>
<%--                                                    <h5 class="text-dark font-weight-bold">--%>
<%--                                                        안전한 등산하세요!--%>
<%--                                                        <br><br>--%>
<%--                                                    </h5>--%>

<%--                                                    <p class="text-dark fs-5">--%>
<%--                                                        <strong style="font-weight:bold; ">출처 : 산림청/등산문화개선</strong><br>--%>

<%--                                                    </p><br><br>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>

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