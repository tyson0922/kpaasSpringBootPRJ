<%@ page import="kopo.kpaas.dto.InjuryDTO" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%
    InjuryDTO rDTO = (InjuryDTO) request.getAttribute("rDTO");

    // Translate the injury class from English to Korean
    String injuryClassTranslated = "";
    String link = "";

    if (rDTO != null) {
        switch (rDTO.getInjuryClass()) {
            case "Siyrik":
                injuryClassTranslated = "긁힘";
                link = "/injuries/abrasion";
                break;
            case "Unlabeled":
                injuryClassTranslated = "상처를 인식 못하거나 분석을 할수 없는 상처 입니다.";
                link = "/main/injuryDetection"; // No link for unlabeled
                break;
            case "bite":
                injuryClassTranslated = "물림";
                link = "/injuries/bite";
                break;
            case "bruises":
                injuryClassTranslated = "멍";
                link = "/injuries/bruise";
                break;
            case "burns":
                injuryClassTranslated = "화상";
                link = "/injuries/burn";
                break;
            case "cut":
                injuryClassTranslated = "베임";
                link = "/injuries/cut";
                break;
            case "laceration":
                injuryClassTranslated = "열상";
                link = "/injuries/laceration";
                break;
            case "snake-bite":
                injuryClassTranslated = "뱀에 물림";
                link = "/injuries/snakebite";
                break;
            case "Stab-wound":
                injuryClassTranslated = "관통상";
                link = "/injuries/puncture";
                break;
            default:
                injuryClassTranslated = "상처를 인식 못하거나 분석을 할수 없는 상처 입니다.";
                link = "/main/injuryDetection"; // Default no link
                break;
        }
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


</head>

<body class="blog-author bg-gray-200">
<!-- Navbar Transparent -->
<div class="container position-sticky z-index-sticky top-0">
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg  blur border-radius-xl mt-4 top-0 z-index-3 shadow position-absolute my-3 py-2 start-0 end-0 mx-4">
                <div class="container-fluid px-0">
                    <a class="navbar-brand font-weight-bolder ms-sm-3"
                       href="https://demos.creative-tim.com/material-kit/index" rel="tooltip"
                       title="Designed and Coded by Creative Tim" data-placement="bottom" target="_blank">
                        Material Kit 2
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
                            <li class="nav-item dropdown dropdown-hover mx-2">
                                <a class="nav-link ps-2 d-flex cursor-pointer align-items-center" id="dropdownMenuPages"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="material-icons opacity-6 me-2 text-md">dashboard</i>
                                    Pages
                                    <img src="${pageContext.request.contextPath}/img/down-arrow-dark.svg"
                                         alt="down-arrow"
                                         class="arrow ms-auto ms-md-2">
                                </a>
                                <div class="dropdown-menu dropdown-menu-animation ms-n3 dropdown-md p-3 border-radius-xl mt-0 mt-lg-3"
                                     aria-labelledby="dropdownMenuPages">
                                    <div class="d-none d-lg-block">
                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
                                            Landing Pages
                                        </h6>
                                        <a href="../pages/about-us.html" class="dropdown-item border-radius-md">
                                            <span>About Us</span>
                                        </a>
                                        <a href="../pages/contact-us.html" class="dropdown-item border-radius-md">
                                            <span>Contact Us</span>
                                        </a>
                                        <a href="../pages/author.html" class="dropdown-item border-radius-md">
                                            <span>Author</span>
                                        </a>
                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1 mt-3">
                                            Account
                                        </h6>
                                        <a href="../pages/sign-in.html" class="dropdown-item border-radius-md">
                                            <span>Sign In</span>
                                        </a>
                                    </div>
                                    <div class="d-lg-none">
                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
                                            Landing Pages
                                        </h6>
                                        <a href="../pages/about-us.html" class="dropdown-item border-radius-md">
                                            <span>About Us</span>
                                        </a>
                                        <a href="../pages/contact-us.html" class="dropdown-item border-radius-md">
                                            <span>Contact Us</span>
                                        </a>
                                        <a href="../pages/author.html" class="dropdown-item border-radius-md">
                                            <span>Author</span>
                                        </a>
                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1 mt-3">
                                            Account
                                        </h6>
                                        <a href="../pages/sign-in.html" class="dropdown-item border-radius-md">
                                            <span>Sign In</span>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown dropdown-hover mx-2">
                                <a class="nav-link ps-2 d-flex cursor-pointer align-items-center"
                                   id="dropdownMenuBlocks" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="material-icons opacity-6 me-2 text-md">view_day</i>
                                    Sections
                                    <img src="${pageContext.request.contextPath}/img/down-arrow-dark.svg"
                                         alt="down-arrow"
                                         class="arrow ms-auto ms-md-2">
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-animation dropdown-md dropdown-md-responsive p-3 border-radius-lg mt-0 mt-lg-3"
                                    aria-labelledby="dropdownMenuBlocks">
                                    <div class="d-none d-lg-block">
                                        <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                            <a class="dropdown-item py-2 ps-3 border-radius-md"
                                               href="../presentation.html">
                                                <div class="w-100 d-flex align-items-center justify-content-between">
                                                    <div>
                                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                            Page Sections</h6>
                                                        <span class="text-sm">See all sections</span>
                                                    </div>
                                                    <img src="${pageContext.request.contextPath}/img/down-arrow.svg"
                                                         alt="down-arrow"
                                                         class="arrow">
                                                </div>
                                            </a>
                                            <div class="dropdown-menu mt-0 py-3 px-2 mt-3">
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/page-sections/hero-sections.html">
                                                    Page Headers
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/page-sections/features.html">
                                                    Features
                                                </a>
                                            </div>
                                        </li>
                                        <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                            <a class="dropdown-item py-2 ps-3 border-radius-md"
                                               href="../presentation.html">
                                                <div class="w-100 d-flex align-items-center justify-content-between">
                                                    <div>
                                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                            Navigation</h6>
                                                        <span class="text-sm">See all navigations</span>
                                                    </div>
                                                    <img src="${pageContext.request.contextPath}/img/down-arrow.svg"
                                                         alt="down-arrow"
                                                         class="arrow">
                                                </div>
                                            </a>
                                            <div class="dropdown-menu mt-0 py-3 px-2 mt-3">
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/navigation/navbars.html">
                                                    Navbars
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/navigation/nav-tabs.html">
                                                    Nav Tabs
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/navigation/pagination.html">
                                                    Pagination
                                                </a>
                                            </div>
                                        </li>
                                        <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                            <a class="dropdown-item py-2 ps-3 border-radius-md"
                                               href="../presentation.html">
                                                <div class="w-100 d-flex align-items-center justify-content-between">
                                                    <div>
                                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                            Input Areas</h6>
                                                        <span class="text-sm">See all input areas</span>
                                                    </div>
                                                    <img src="${pageContext.request.contextPath}/img/down-arrow.svg"
                                                         alt="down-arrow"
                                                         class="arrow">
                                                </div>
                                            </a>
                                            <div class="dropdown-menu mt-0 py-3 px-2 mt-3">
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/input-areas/inputs.html">
                                                    Inputs
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/input-areas/forms.html">
                                                    Forms
                                                </a>
                                            </div>
                                        </li>
                                        <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                            <a class="dropdown-item py-2 ps-3 border-radius-md"
                                               href="../presentation.html">
                                                <div class="w-100 d-flex align-items-center justify-content-between">
                                                    <div>
                                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                            Attention Catchers</h6>
                                                        <span class="text-sm">See all examples</span>
                                                    </div>
                                                    <img src="${pageContext.request.contextPath}/img/down-arrow.svg"
                                                         alt="down-arrow"
                                                         class="arrow">
                                                </div>
                                            </a>
                                            <div class="dropdown-menu mt-0 py-3 px-2 mt-3">
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/attention-catchers/alerts.html">
                                                    Alerts
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/attention-catchers/modals.html">
                                                    Modals
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/attention-catchers/tooltips-popovers.html">
                                                    Tooltips & Popovers
                                                </a>
                                            </div>
                                        </li>
                                        <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                            <a class="dropdown-item py-2 ps-3 border-radius-md"
                                               href="../presentation.html">
                                                <div class="w-100 d-flex align-items-center justify-content-between">
                                                    <div>
                                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                            Elements</h6>
                                                        <span class="text-sm">See all elements</span>
                                                    </div>
                                                    <img src="${pageContext.request.contextPath}/img/down-arrow.svg"
                                                         alt="down-arrow"
                                                         class="arrow">
                                                </div>
                                            </a>
                                            <div class="dropdown-menu mt-0 py-3 px-2 mt-3">
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/elements/avatars.html">
                                                    Avatars
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/elements/badges.html">
                                                    Badges
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/elements/breadcrumbs.html">
                                                    Breadcrumbs
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/elements/buttons.html">
                                                    Buttons
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/elements/dropdowns.html">
                                                    Dropdowns
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/elements/progress-bars.html">
                                                    Progress Bars
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/elements/toggles.html">
                                                    Toggles
                                                </a>
                                                <a class="dropdown-item ps-3 border-radius-md mb-1"
                                                   href="../sections/elements/typography.html">
                                                    Typography
                                                </a>
                                            </div>
                                        </li>
                                    </div>
                                    <div class="row d-lg-none">
                                        <div class="col-md-12">
                                            <div class="d-flex mb-2">
                                                <div class="icon h-10 me-3 d-flex mt-1">
                                                    <i class="ni ni-single-copy-04 text-gradient text-success"></i>
                                                </div>
                                                <div class="w-100 d-flex align-items-center justify-content-between">
                                                    <div>
                                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                            Page Sections</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/page-sections/hero-sections.html">
                                                Page Headers
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/page-sections/features.html">
                                                Features
                                            </a>
                                            <div class="d-flex mb-2 mt-3">
                                                <div class="icon h-10 me-3 d-flex mt-1">
                                                    <i class="ni ni-laptop text-gradient text-success"></i>
                                                </div>
                                                <div class="w-100 d-flex align-items-center justify-content-between">
                                                    <div>
                                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                            Navigation</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/navigation/navbars.html">
                                                Navbars
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/navigation/nav-tabs.html">
                                                Nav Tabs
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/navigation/pagination.html">
                                                Pagination
                                            </a>
                                            <div class="d-flex mb-2 mt-3">
                                                <div class="icon h-10 me-3 d-flex mt-1">
                                                    <i class="ni ni-badge text-gradient text-success"></i>
                                                </div>
                                                <div class="w-100 d-flex align-items-center justify-content-between">
                                                    <div>
                                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                            Input Areas</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/input-areas/inputs.html">
                                                Inputs
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/input-areas/forms.html">
                                                Forms
                                            </a>
                                            <div class="d-flex mb-2 mt-3">
                                                <div class="icon h-10 me-3 d-flex mt-1">
                                                    <i class="ni ni-notification-70 text-gradient text-success"></i>
                                                </div>
                                                <div class="w-100 d-flex align-items-center justify-content-between">
                                                    <div>
                                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                            Attention Catchers</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/attention-catchers/alerts.html">
                                                Alerts
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/attention-catchers/modals.html">
                                                Modals
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/attention-catchers/tooltips-popovers.html">
                                                Tooltips & Popovers
                                            </a>
                                            <div class="d-flex mb-2 mt-3">
                                                <div class="icon h-10 me-3 d-flex mt-1">
                                                    <i class="ni ni-app text-gradient text-success"></i>
                                                </div>
                                                <div class="w-100 d-flex align-items-center justify-content-between">
                                                    <div>
                                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                            Elements</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/elements/avatars.html">
                                                Avatars
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/elements/badges.html">
                                                Badges
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/elements/breadcrumbs.html">
                                                Breadcrumbs
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/elements/buttons.html">
                                                Buttons
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/elements/dropdowns.html">
                                                Dropdowns
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/elements/progress-bars.html">
                                                Progress Bars
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/elements/toggles.html">
                                                Toggles
                                            </a>
                                            <a class="dropdown-item ps-3 border-radius-md mb-1"
                                               href="../sections/elements/typography.html">
                                                Typography
                                            </a>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="nav-item dropdown dropdown-hover mx-2">
                                <a class="nav-link ps-2 d-flex cursor-pointer align-items-center" id="dropdownMenuDocs"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="material-icons opacity-6 me-2 text-md">article</i>
                                    Docs
                                    <img src="${pageContext.request.contextPath}/img/down-arrow-dark.svg"
                                         alt="down-arrow"
                                         class="arrow ms-auto ms-md-2">
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-animation dropdown-md dropdown-md-responsive mt-0 mt-lg-3 p-3 border-radius-lg"
                                    aria-labelledby="dropdownMenuDocs">
                                    <div class="d-none d-lg-block">
                                        <ul class="list-group">
                                            <li class="nav-item list-group-item border-0 p-0">
                                                <a class="dropdown-item py-2 ps-3 border-radius-md"
                                                   href=" https://www.creative-tim.com/learning-lab/bootstrap/overview/material-kit ">
                                                    <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                        Getting Started</h6>
                                                    <span class="text-sm">All about overview, quick start, license and contents</span>
                                                </a>
                                            </li>
                                            <li class="nav-item list-group-item border-0 p-0">
                                                <a class="dropdown-item py-2 ps-3 border-radius-md"
                                                   href=" https://www.creative-tim.com/learning-lab/bootstrap/colors/material-kit ">
                                                    <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                        Foundation</h6>
                                                    <span class="text-sm">See our colors, icons and typography</span>
                                                </a>
                                            </li>
                                            <li class="nav-item list-group-item border-0 p-0">
                                                <a class="dropdown-item py-2 ps-3 border-radius-md"
                                                   href=" https://www.creative-tim.com/learning-lab/bootstrap/alerts/material-kit ">
                                                    <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                        Components</h6>
                                                    <span class="text-sm">Explore our collection of fully designed components</span>
                                                </a>
                                            </li>
                                            <li class="nav-item list-group-item border-0 p-0">
                                                <a class="dropdown-item py-2 ps-3 border-radius-md"
                                                   href=" https://www.creative-tim.com/learning-lab/bootstrap/datepicker/material-kit ">
                                                    <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                        Plugins</h6>
                                                    <span class="text-sm">Check how you can integrate our plugins</span>
                                                </a>
                                            </li>
                                            <li class="nav-item list-group-item border-0 p-0">
                                                <a class="dropdown-item py-2 ps-3 border-radius-md"
                                                   href=" https://www.creative-tim.com/learning-lab/bootstrap/utilities/material-kit ">
                                                    <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                        Utility Classes</h6>
                                                    <span class="text-sm">For those who want flexibility, use our utility classes</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="row d-lg-none">
                                        <div class="col-md-12 g-0">
                                            <a class="dropdown-item py-2 ps-3 border-radius-md"
                                               href="../pages/about-us.html">
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Getting Started</h6>
                                                <span class="text-sm">All about overview, quick start, license and contents</span>
                                            </a>
                                            <a class="dropdown-item py-2 ps-3 border-radius-md"
                                               href="../pages/about-us.html">
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Foundation</h6>
                                                <span class="text-sm">See our colors, icons and typography</span>
                                            </a>
                                            <a class="dropdown-item py-2 ps-3 border-radius-md"
                                               href="../pages/about-us.html">
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Components</h6>
                                                <span class="text-sm">Explore our collection of fully designed components</span>
                                            </a>
                                            <a class="dropdown-item py-2 ps-3 border-radius-md"
                                               href="../pages/about-us.html">
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Plugins</h6>
                                                <span class="text-sm">Check how you can integrate our plugins</span>
                                            </a>
                                            <a class="dropdown-item py-2 ps-3 border-radius-md"
                                               href="../pages/about-us.html">
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Utility Classes</h6>
                                                <span class="text-sm">For those who want flexibility, use our utility classes</span>
                                            </a>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="nav-item ms-lg-auto">
                                <a class="nav-link nav-link-icon me-2"
                                   href="https://github.com/creativetimofficial/material-kit" target="_blank">
                                    <i class="fa fa-github me-1"></i>
                                    <p class="d-inline text-sm z-index-1 font-weight-bold" data-bs-toggle="tooltip"
                                       data-bs-placement="bottom" title="Star us on Github">Github</p>
                                </a>
                            </li>
                            <li class="nav-item my-auto ms-3 ms-lg-0">
                                <a href="https://www.creative-tim.com/product/material-kit-pro"
                                   class="btn btn-sm  bg-gradient-success  mb-0 me-1 mt-2 mt-md-0">Upgrade to Pro</a>
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
    <div class="card card-body blur shadow-blur mx-auto my-9"
         style="max-width: 600px; min-width: 300px; width: auto;">

        <h2>${userName}님의 부상 감지 결과</h2>

        <div id="injuryResult">
            <div class="mb-3">
                <strong>부상 종류:</strong> <%= injuryClassTranslated %>
            </div>

            <div class="mb-3">
                <strong>신뢰 수준:</strong> <%= rDTO.getConfidenceLevel() %>%
            </div>

            <div class="mb-3">
                <strong>감지 시간:</strong> <%= rDTO.getRegDt() %>
            </div>

            <div class="mt-4">
                <button type="button" class="btn btn-outline-success" style="min-width: 150px;"
                        onclick="window.location.href='<%= link %>'">
                    결과 상세보기
                </button>
            </div>
        </div>




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

<script src="${pageContext.request.contextPath}/js/material-kit.min.js?v=3.0.4" type="text/javascript"></script>
</body>

</html>