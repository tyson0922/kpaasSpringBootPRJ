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

    <%--    naverMap API--%>
    <script type="text/javascript"
            src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${naverApiClientKey}&submodules=geocoder&callback=initMap"></script>

    <script type="text/javascript">
        const naverClientKey = '${naverClientKey}';
        const naverClientSecret = '${naverClientSecret}';
    </script>
    <script src="${pageContext.request.contextPath}/js/kpaasJs/hikingMapHandler.js" defer></script>


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

    <%--    산 지도 및 파라미터 시작--%>
    <div class="card card-body blur shadow-blur mx-auto my-9" style="width: 90%; height: 100vh; overflow-y: scroll;">
        <div class="row h-100">
            <!-- Map Container Wrapper -->
            <div class="col-md-9 col-12 d-flex flex-column" style="height: 100%;">
                <div id="map-wrapper" class="overflow-auto" style="flex-grow: 1;">
                    <div id="map" style="min-height: 600px; height: 100%;"></div>
                </div>
            </div>

            <!-- Button Container -->
            <div class="col-md-3 col-12 d-flex flex-column align-items-start mt-3 mt-md-0 overflow-auto"
                 style="max-height: 100vh; padding: 1rem;">
                <p>지도에서 네 지점을 눌러주세요</p>
                <div class="form-group">
                    <label for="mountainName">산 이름</label>
                    <input type="text" id="mountainName" name="mountainName" class="form-control"
                           placeholder="산 이름을 입력하세요">
                </div>
                <button id="searchButton" class="btn btn-outline-success mt-3">산 위치로 이동하기</button>
            </div>
            <div class="col-12 d-flex flex-column align-items-start overflow-auto" style="padding: 1rem;">
                <div id="mountainInfo"></div>
            </div>
        </div>
    </div>


    <!-- -------- START FOOTER 5 w/ DARK BACKGROUND ------- -->
    <footer class="footer position-absolute bottom-2 py-2 w-100">
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

<script src="${pageContext.request.contextPath}/js/material-kit.min.js?v=3.0.4" type="text/javascript"></script>
</body>

</html>