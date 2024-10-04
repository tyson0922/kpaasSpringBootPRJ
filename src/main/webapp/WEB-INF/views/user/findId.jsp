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
    <!-- CSS Files -->
    <link id="pagestyle" href="${pageContext.request.contextPath}/css/material-kit.css?v=3.0.4" rel="stylesheet" />

</head>

<body class="sign-in-basic">
<!-- Navbar Transparent -->
<nav class="navbar navbar-expand-lg position-absolute top-0 z-index-3 w-100 shadow-none my-3  navbar-transparent ">
    <div class="container">
        <a class="navbar-brand  text-white " href="https://demos.creative-tim.com/material-kit/presentation" rel="tooltip" title="Designed and Coded by Creative Tim" data-placement="bottom" target="_blank">
            Material Kit 2
        </a>
        <button class="navbar-toggler shadow-none ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon mt-2">
          <span class="navbar-toggler-bar bar1"></span>
          <span class="navbar-toggler-bar bar2"></span>
          <span class="navbar-toggler-bar bar3"></span>
        </span>
        </button>
        <div class="collapse navbar-collapse w-100 pt-3 pb-2 py-lg-0 ms-lg-12 ps-lg-5" id="navigation">
            <ul class="navbar-nav navbar-nav-hover ms-auto">
                <li class="nav-item dropdown dropdown-hover mx-2 ms-lg-6">
                    <a class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center" id="dropdownMenuPages8" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="material-icons opacity-6 me-2 text-md">dashboard</i>
                        Pages
                        <img src="${pageContext.request.contextPath}/img/down-arrow-white.svg" alt="down-arrow" class="arrow ms-2 d-lg-block d-none">
                        <img src="${pageContext.request.contextPath}/img/down-arrow-dark.svg" alt="down-arrow" class="arrow ms-2 d-lg-none d-block">
                    </a>
                    <div class="dropdown-menu dropdown-menu-animation ms-n3 dropdown-md p-3 border-radius-lg mt-0 mt-lg-3" aria-labelledby="dropdownMenuPages8">
                        <div class="d-none d-lg-block">
                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
                                Landing Pages
                            </h6>
                            <a href="../pages/about-us.jsp" class="dropdown-item border-radius-md">
                                <span>About Us</span>
                            </a>
                            <a href="../pages/contact-us.jsp" class="dropdown-item border-radius-md">
                                <span>Contact Us</span>
                            </a>
                            <a href="../pages/author.jsp" class="dropdown-item border-radius-md">
                                <span>Author</span>
                            </a>
                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1 mt-3">
                                Account
                            </h6>
                            <a href="../pages/sign-in.jsp" class="dropdown-item border-radius-md">
                                <span>Sign In</span>
                            </a>
                        </div>
                        <div class="d-lg-none">
                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
                                Landing Pages
                            </h6>
                            <a href="../pages/about-us.jsp" class="dropdown-item border-radius-md">
                                <span>About Us</span>
                            </a>
                            <a href="../pages/contact-us.jsp" class="dropdown-item border-radius-md">
                                <span>Contact Us</span>
                            </a>
                            <a href="../pages/author.jsp" class="dropdown-item border-radius-md">
                                <span>Author</span>
                            </a>
                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1 mt-3">
                                Account
                            </h6>
                            <a href="../pages/sign-in.jsp" class="dropdown-item border-radius-md">
                                <span>Sign In</span>
                            </a>
                        </div>
                    </div>
                </li>
                <li class="nav-item dropdown dropdown-hover mx-2">
                    <a class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center" id="dropdownMenuBlocks" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="material-icons opacity-6 me-2 text-md">view_day</i>
                        Sections
                        <img src="${pageContext.request.contextPath}/img/down-arrow-white.svg" alt="down-arrow" class="arrow ms-2 d-lg-block d-none">
                        <img src="${pageContext.request.contextPath}/img/down-arrow-dark.svg" alt="down-arrow" class="arrow ms-2 d-lg-none d-block">
                    </a>
                    <ul class="dropdown-menu dropdown-menu-animation dropdown-menu-end dropdown-md dropdown-md-responsive p-3 border-radius-lg mt-0 mt-lg-3" aria-labelledby="dropdownMenuBlocks">
                        <div class="d-none d-lg-block">
                            <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                <a class="dropdown-item py-2 ps-3 border-radius-md" href="../presentation.jsp">
                                    <div class="w-100 d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Page Sections</h6>
                                            <span class="text-sm">See all sections</span>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/img/down-arrow.svg" alt="down-arrow" class="arrow">
                                    </div>
                                </a>
                                <div class="dropdown-menu mt-0 py-3 px-2 mt-3">
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/page-sections/hero-sections.jsp">
                                        Page Headers
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/page-sections/features.jsp">
                                        Features
                                    </a>
                                </div>
                            </li>
                            <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                <a class="dropdown-item py-2 ps-3 border-radius-md" href="../presentation.jsp">
                                    <div class="w-100 d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Navigation</h6>
                                            <span class="text-sm">See all navigations</span>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/img/down-arrow.svg" alt="down-arrow" class="arrow">
                                    </div>
                                </a>
                                <div class="dropdown-menu mt-0 py-3 px-2 mt-3">
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/navigation/navbars.jsp">
                                        Navbars
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/navigation/nav-tabs.jsp">
                                        Nav Tabs
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/navigation/pagination.jsp">
                                        Pagination
                                    </a>
                                </div>
                            </li>
                            <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                <a class="dropdown-item py-2 ps-3 border-radius-md" href="../presentation.jsp">
                                    <div class="w-100 d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Input Areas</h6>
                                            <span class="text-sm">See all input areas</span>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/img/down-arrow.svg" alt="down-arrow" class="arrow">
                                    </div>
                                </a>
                                <div class="dropdown-menu mt-0 py-3 px-2 mt-3">
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/input-areas/inputs.jsp">
                                        Inputs
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/input-areas/forms.jsp">
                                        Forms
                                    </a>
                                </div>
                            </li>
                            <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                <a class="dropdown-item py-2 ps-3 border-radius-md" href="../presentation.jsp">
                                    <div class="w-100 d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Attention Catchers</h6>
                                            <span class="text-sm">See all examples</span>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/img/down-arrow.svg" alt="down-arrow" class="arrow">
                                    </div>
                                </a>
                                <div class="dropdown-menu mt-0 py-3 px-2 mt-3">
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/attention-catchers/alerts.jsp">
                                        Alerts
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/attention-catchers/modals.jsp">
                                        Modals
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/attention-catchers/tooltips-popovers.jsp">
                                        Tooltips & Popovers
                                    </a>
                                </div>
                            </li>
                            <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                <a class="dropdown-item py-2 ps-3 border-radius-md" href="../presentation.jsp">
                                    <div class="w-100 d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Elements</h6>
                                            <span class="text-sm">See all elements</span>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/img/down-arrow.svg" alt="down-arrow" class="arrow">
                                    </div>
                                </a>
                                <div class="dropdown-menu mt-0 py-3 px-2 mt-3">
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/avatars.jsp">
                                        Avatars
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/badges.jsp">
                                        Badges
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/breadcrumbs.jsp">
                                        Breadcrumbs
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/buttons.jsp">
                                        Buttons
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/dropdowns.jsp">
                                        Dropdowns
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/progress-bars.jsp">
                                        Progress Bars
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/toggles.jsp">
                                        Toggles
                                    </a>
                                    <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/typography.jsp">
                                        Typography
                                    </a>
                                </div>
                            </li>
                        </div>
                        <div class="row d-lg-none">
                            <div class="col-md-12">
                                <div class="d-flex mb-2">
                                    <div class="icon h-10 me-3 d-flex mt-1">
                                        <i class="ni ni-single-copy-04 text-gradient text-primary"></i>
                                    </div>
                                    <div class="w-100 d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Page Sections</h6>
                                        </div>
                                    </div>
                                </div>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/page-sections/hero-sections.jsp">
                                    Page Headers
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/page-sections/features.jsp">
                                    Features
                                </a>
                                <div class="d-flex mb-2 mt-3">
                                    <div class="icon h-10 me-3 d-flex mt-1">
                                        <i class="ni ni-laptop text-gradient text-primary"></i>
                                    </div>
                                    <div class="w-100 d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Navigation</h6>
                                        </div>
                                    </div>
                                </div>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/navigation/navbars.jsp">
                                    Navbars
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/navigation/nav-tabs.jsp">
                                    Nav Tabs
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/navigation/pagination.jsp">
                                    Pagination
                                </a>
                                <div class="d-flex mb-2 mt-3">
                                    <div class="icon h-10 me-3 d-flex mt-1">
                                        <i class="ni ni-badge text-gradient text-primary"></i>
                                    </div>
                                    <div class="w-100 d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Input Areas</h6>
                                        </div>
                                    </div>
                                </div>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/input-areas/inputs.jsp">
                                    Inputs
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/input-areas/forms.jsp">
                                    Forms
                                </a>
                                <div class="d-flex mb-2 mt-3">
                                    <div class="icon h-10 me-3 d-flex mt-1">
                                        <i class="ni ni-notification-70 text-gradient text-primary"></i>
                                    </div>
                                    <div class="w-100 d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Attention Catchers</h6>
                                        </div>
                                    </div>
                                </div>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/attention-catchers/alerts.jsp">
                                    Alerts
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/attention-catchers/modals.jsp">
                                    Modals
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/attention-catchers/tooltips-popovers.jsp">
                                    Tooltips & Popovers
                                </a>
                                <div class="d-flex mb-2 mt-3">
                                    <div class="icon h-10 me-3 d-flex mt-1">
                                        <i class="ni ni-app text-gradient text-primary"></i>
                                    </div>
                                    <div class="w-100 d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Elements</h6>
                                        </div>
                                    </div>
                                </div>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/avatars.jsp">
                                    Avatars
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/badges.jsp">
                                    Badges
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/breadcrumbs.jsp">
                                    Breadcrumbs
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/buttons.jsp">
                                    Buttons
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/dropdowns.jsp">
                                    Dropdowns
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/progress-bars.jsp">
                                    Progress Bars
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/toggles.jsp">
                                    Toggles
                                </a>
                                <a class="dropdown-item ps-3 border-radius-md mb-1" href="../sections/elements/typography.jsp">
                                    Typography
                                </a>
                            </div>
                        </div>
                    </ul>
                </li>
                <li class="nav-item dropdown dropdown-hover mx-2">
                    <a class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center" id="dropdownMenuDocs" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="material-icons opacity-6 me-2 text-md">article</i>
                        Docs
                        <img src="${pageContext.request.contextPath}/img/down-arrow-white.svg" alt="down-arrow" class="arrow ms-2 d-lg-block d-none">
                        <img src="${pageContext.request.contextPath}/img/down-arrow-dark.svg" alt="down-arrow" class="arrow ms-2 d-lg-none d-block">
                    </a>
                    <ul class="dropdown-menu dropdown-menu-animation dropdown-menu-end dropdown-md dropdown-md-responsive mt-0 mt-lg-3 p-3 border-radius-lg" aria-labelledby="dropdownMenuDocs">
                        <div class="d-none d-lg-block">
                            <ul class="list-group">
                                <li class="nav-item list-group-item border-0 p-0">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href=" https://www.creative-tim.com/learning-lab/bootstrap/overview/material-kit ">
                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Getting Started</h6>
                                        <span class="text-sm">All about overview, quick start, license and contents</span>
                                    </a>
                                </li>
                                <li class="nav-item list-group-item border-0 p-0">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href=" https://www.creative-tim.com/learning-lab/bootstrap/colors/material-kit ">
                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Foundation</h6>
                                        <span class="text-sm">See our colors, icons and typography</span>
                                    </a>
                                </li>
                                <li class="nav-item list-group-item border-0 p-0">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href=" https://www.creative-tim.com/learning-lab/bootstrap/alerts/material-kit ">
                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Components</h6>
                                        <span class="text-sm">Explore our collection of fully designed components</span>
                                    </a>
                                </li>
                                <li class="nav-item list-group-item border-0 p-0">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href=" https://www.creative-tim.com/learning-lab/bootstrap/datepicker/material-kit ">
                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Plugins</h6>
                                        <span class="text-sm">Check how you can integrate our plugins</span>
                                    </a>
                                </li>
                                <li class="nav-item list-group-item border-0 p-0">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href=" https://www.creative-tim.com/learning-lab/bootstrap/utilities/material-kit ">
                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Utility Classes</h6>
                                        <span class="text-sm">For those who want flexibility, use our utility classes</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="row d-lg-none">
                            <div class="col-md-12 g-0">
                                <a class="dropdown-item py-2 ps-3 border-radius-md" href="../pages/about-us.jsp">
                                    <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Getting Started</h6>
                                    <span class="text-sm">All about overview, quick start, license and contents</span>
                                </a>
                                <a class="dropdown-item py-2 ps-3 border-radius-md" href="../pages/about-us.jsp">
                                    <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Foundation</h6>
                                    <span class="text-sm">See our colors, icons and typography</span>
                                </a>
                                <a class="dropdown-item py-2 ps-3 border-radius-md" href="../pages/about-us.jsp">
                                    <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Components</h6>
                                    <span class="text-sm">Explore our collection of fully designed components</span>
                                </a>
                                <a class="dropdown-item py-2 ps-3 border-radius-md" href="../pages/about-us.jsp">
                                    <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Plugins</h6>
                                    <span class="text-sm">Check how you can integrate our plugins</span>
                                </a>
                                <a class="dropdown-item py-2 ps-3 border-radius-md" href="../pages/about-us.jsp">
                                    <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">Utility Classes</h6>
                                    <span class="text-sm">For those who want flexibility, use our utility classes</span>
                                </a>
                            </div>
                        </div>
                    </ul>
                </li>
                <li class="nav-item ms-lg-auto">
                    <a class="nav-link nav-link-icon me-2" href="https://github.com/creativetimofficial/soft-ui-design-system" target="_blank">
                        <i class="fa fa-github me-1"></i>
                        <p class="d-inline text-sm z-index-1 font-weight-bold" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Star us on Github">Github</p>
                    </a>
                </li>
                <li class="nav-item my-auto ms-3 ms-lg-0">
                    <a href="https://www.creative-tim.com/product/material-kit-pro" class="btn btn-sm  bg-gradient-success  mb-0 me-1 mt-2 mt-md-0">Upgrade to Pro</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- End Navbar -->
<div class="page-header align-items-start min-vh-100" style="background-image: url('${pageContext.request.contextPath}/img/kpaas/kpaasBackground.webp');">
    <span class="mask bg-gradient-dark opacity-1"></span>
    <div class="container my-auto">
        <div class="row">
            <div class="col-lg-4 col-md-8 col-12 mx-auto">
                <div class="card z-index-0 fadeIn3 fadeInBottom">
                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                        <div class="bg-gradient-success shadow-primary border-radius-lg py-3 pe-1">
                            <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">아이디 찾기</h4>
                            <div class="row mt-3">
                                <div class="col-2 text-center ms-auto">
                                    <a class="btn btn-link px-3" href="javascript:;">
                                        <i class="fa fa-facebook text-white text-lg"></i>
                                    </a>
                                </div>
                                <div class="col-2 text-center px-1">
                                    <a class="btn btn-link px-3" href="javascript:;">
                                        <i class="fa fa-github text-white text-lg"></i>
                                    </a>
                                </div>
                                <div class="col-2 text-center me-auto">
                                    <a class="btn btn-link px-3" href="javascript:;">
                                        <i class="fa fa-google text-white text-lg"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="form-container">
                            <div class="logo-container">

                            </div>

                            <!DOCTYPE html>
                            <html lang="en">
                            <head>
                                <meta charset="UTF-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                <title>폼 레이아웃 예제</title>
                                <!-- 부트스트랩 CSS -->
                                <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
                                <style>
                                    /* 사용자 정의 CSS */
                                    .email-input-border {
                                        border: 1px solid #000; /* 검은색 테두리 */
                                        border-radius: 0.375rem; /* 테두리 둥글기 */
                                        padding: 0.375rem 0.75rem; /* 입력 필드 여백 */
                                        max-width: 500px; /* 이메일 입력 필드 길이 조정 */
                                    }

                                    .auth-code-input-border {
                                        border: 1px solid #000; /* 검은색 테두리 */
                                        border-radius: 0.375rem; /* 테두리 둥글기 */
                                        padding: 0.375rem 0.75rem; /* 입력 필드 여백 */
                                        width: auto; /* 글자에 맞게 자동 조절 */
                                        min-width: 80px; /* 최소 너비 설정 */
                                        max-width: 150px; /* 최대 너비 설정 */
                                    }
                                </style>
                            </head>
                            <body>
                            <!-- 이메일 입력 폼 -->
                            <form class="form d-flex flex-column mb-2">
                                <div class="form-group mb-2 d-flex">
                                    <div class="flex-grow-2 me-2">
                                        <input type="text" id="emailPrefix" name="emailPrefix" placeholder="이메일 입력" required class="form-control" style="border: 1px solid #ced4da; border-radius: .25rem; min-width: 200px;">
                                    </div>
                                    <div class="flex-grow-1 me-2">
                                        <select id="emailDomain" name="emailDomain" class="form-control email-input-border" required style="width: 120px; border: 1px solid #ced4da; border-radius: .25rem;">
                                            <option value="" disabled selected>example.com</option>
                                            <option value="@gmail.com">@gmail.com</option>
                                            <option value="@naver.com">@naver.com</option>
                                            <option value="@yahoo.com">@yahoo.com</option>
                                        </select>
                                    </div>
                                </div>
                                <button class="btn btn-outline-success btn-sm" type="submit" style="width: 130px;">인증번호 전송</button>
                            </form>










                            <!-- 인증번호 입력 폼 -->
                            <form class="d-flex flex-column align-items-start mt-4">
                                <div class="form-group mb-2 w-100">
                                    <input type="text" id="인증번호" name="인증번호" placeholder="인증번호 입력" required="" class="form-control auth-code-input-border">
                                </div>
                                <button class="btn btn-outline-success btn-sm mt-2" type="submit">아이디 확인</button>
                            </form>

                            <!-- 부트스트랩 JS (Popper 포함) -->
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
                            </body>
                            </html>





                            <!-- 모달 -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">아이디 확인</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            아이디가 확인되었습니다.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>




                            <div class="text-end" style="position: relative; margin-top: 20px;">
                                <p class="signup-link" style="display: inline;">
                                    계정이 있습니까?
                                    <a href="sign-in.html" class="signup-link"> 로그인하기</a>
                                </p>
                            </div>

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
<!-- Control Center for Material UI Kit: parallax effects, scripts for the example pages etc -->
<!--  Google Maps Plugin    -->

<script src="${pageContext.request.contextPath}/js/material-kit.min.js?v=3.0.4" type="text/javascript"></script>
</body>


</html>