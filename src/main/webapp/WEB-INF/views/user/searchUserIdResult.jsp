<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kopo.kpaas.dto.UserInfoDTO" %>
<%@ page import="kopo.kpaas.util.CmmUtil" %>
<%
    UserInfoDTO rDTO = (UserInfoDTO) request.getAttribute("rDTO");

    String msg = "";

    if (CmmUtil.nvl(rDTO.getUserId()).length() > 0) { // 아이디 찾기 성공
        msg = CmmUtil.nvl(rDTO.getUserName()) + " 회원님의 " + CmmUtil.nvl(rDTO.getUserId()) + "입니다.";

    } else {
        msg = "아이디가 존재하지 않습니다.";

    }
%>
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


    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script type="text/javascript">

        // HTML로딩이 완료되고, 실행됨
        $(document).ready(function () {

            // 로그인 화면 이동
            $("#btnLogin").on("click", function () { // 버튼 클릭했을때, 발생되는 이벤트 생성함(onclick 이벤트와 동일함)
                location.href = "/user/sign-in";
            })

        })
    </script>
</head>

<body class="sign-in-basic">
<!-- Navbar Transparent -->
<nav class="navbar navbar-expand-lg position-absolute top-0 z-index-3 w-100 shadow-none my-3  navbar-transparent ">

</nav>
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
                            <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">아이디 찾기 결과</h4>

                        </div>
                    </div>
                    <div class="card-body">
                        <form id="f" role="form" class="text-start">
                            <div class="row g-0">
                                <div class="input-group input-group-outline w-100">
                                    <div class="form-control">
                                        <%=msg%>
                                    </div>
                                </div>
                            </div>

                            <br>

                            <div class="text-center">
                                <button id="btnLogin" type="button" class="btn bg-gradient-success" style="width: 250px;">로그인</button>
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

<!-- Control Center for Material UI Kit: parallax effects, scripts for the example pages etc -->

<link href="${pageContext.request.contextPath}/css/material-kit.css?v=3.0.4" rel="stylesheet"/>

</body>

</html>