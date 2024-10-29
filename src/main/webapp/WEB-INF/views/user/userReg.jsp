<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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


    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- Include your userReg.js file -->
    <script src="${pageContext.request.contextPath}/js/kpaasJs/userReg.js"></script>
</head>

<body class="sign-in-basic">
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
                                        <a href="profile.jsp" class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0">마이페이지</a>
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
    <span class="mask bg-gradient-dark opacity-1"></span>
    <div class="container my-auto">
        <div class="row m-0">
            <div class="col-lg-4 col-md-8 col-12 mx-auto p-0" style="width: 40%; min-width: 550px;">
                <div class="card z-index-0 fadeIn3 fadeInBottom">
                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                        <div class="bg-gradient-success shadow-primary border-radius-lg py-3 pe-1">
                            <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">회원가입</h4>

                        </div>
                    </div>
                    <div class="card-body">
                        <form id="f" role="form" class="text-start">
                            <div class="row g-0">
                                <div class="col-8 pe-2">
                                    <div class="input-group input-group-outline w-100">
                                        <input type="text" name="userId" class="form-control" required placeholder="아이디">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <button type="button" id="btnUserId" class="btn btn-outline-success w-100 mb-0">중복체크</button>
                                </div>
                            </div>
                            <div class="input-group input-group-outline my-3">
                                <%--                                <label class="form-label">이메일</label>--%>
                                <input type="text" name="userName" class="form-control" required placeholder="이름">
                            </div>

                            <div class="row g-0">
                                <div class="col-8 pe-2">
                                    <div class="input-group input-group-outline w-100">
                                        <input type="text" name="email" class="form-control" required placeholder="이메일 주소">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <button type="button" id="btnEmail"  class="btn btn-outline-success w-100 mb-0">이메일 인증번호 발송</button>
                                </div>
                            </div>
                            <div class="input-group input-group-outline my-3">
                                <%--                                <label class="form-label">이메일</label>--%>
                                <input type="text" name="authNumber" class="form-control" required placeholder="메일로  발송된 인증번호">
                            </div>
                            <div class="input-group input-group-outline mb-3">
                                <%--                                <label class="form-label">비밀번호</label>--%>
                                <input type="password" name="password" class="form-control" required placeholder="비밀번호">
                            </div>
                            <div class="row">
                                <div class="input-group input-group-outline mb-3">
                                    <%--                                <label class="form-label">비밀번호 확인</label>--%>
                                    <input type="password" name="password2" class="form-control" required placeholder="비밀번호 확인">
                                </div>
                            </div>


                            <div class="row g-0">
                                <div class="col-8 pe-2">
                                    <div class="input-group input-group-outline w-100 mb-0">
                                        <label for="postcode"></label>
                                        <input type="text" id="postcode" name="addr1" class="form-control" placeholder="주소" readonly required>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <button type="button" id="postcodeBtn" class="btn btn-outline-success w-100 mb-0">주소 검색
                                    </button>
                                </div>
                                <div class="input-group input-group-outline my-3">

                                    <input type="text" name="addr2" class="form-control" required placeholder="상세주소">
                                </div>

                            </div>

                            <div class="text-center">
                                <button id="btnSend" type="button" class="btn bg-gradient-success" style="width: 250px;">가입하기</button>

                            </div>
                            <div class="text-center">
                                <p class="mt-4 text-sm text-center">이미 계정이 있나요? <a href="sign-in">로그인</a></p>
                            </div>
                        </form>
                    </div>


                </div>

            </div>


            </p>
            </form>
        </div>
    </div>
</div>

<footer class="footer position-absolute bottom-2 py-2 w-100" style="min-height: 50px;">
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
                        <a href="https://www.creative-tim.com/presentation" class="nav-link text-white" target="_blank">About
                            Us</a>
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
<script>
    document.getElementById('postcodeBtn').onclick = function () {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById('postcode').value = "(" + data.zonecode + ") " + data.address; // 우편번호
                // document.getElementById('postcode').value = data.address; // 전체 주소
            }
        }).open();
    };
</script>
<!-- Control Center for Material UI Kit: parallax effects, scripts for the example pages etc -->

<link href="${pageContext.request.contextPath}/css/material-kit.css?v=3.0.4" rel="stylesheet"/>

</body>

</html>