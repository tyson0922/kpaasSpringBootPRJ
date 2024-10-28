<%@ page contentType="text/html;charset=utf-8" %>


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
    <div class="card card-body blur shadow-blur mx-5 mx-md-7 mx-lg-9 mx-xl-10 mx-xxl-12 my-9 mx-auto"
         style="max-width: 1000px; min-width: 40%">
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

                                                    <a class="d-block blur-shadow-image mx-auto"  style="outline: none;">
                                                        <!-- The existing image that will be replaced -->
                                                        <img class="mx-auto d-block" id="imageToReplace"
                                                             src="${pageContext.request.contextPath}/img/kpaas/handwash.webp"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy">
                                                    </a>
                                                    <br>


                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        긁힘 상처 세척하기

                                                    </h4>
                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight: bold;">감염 예방:</strong> <br>
                                                        긁힌 부위에는 세균이나 이물질이 남아 있을 수 있습니다. 세척을 통해 이러한 오염물질을 제거함으로써 감염의 위험을
                                                        줄일 수 있습니다.<br><br>
                                                        <strong style="font-weight: bold;">상처치유 촉진:</strong> <br> 깨끗한
                                                        환경에서 상처가 치유되기 때문에, 세척을 통해 상처를 청결하게 유지하면 치유 과정이 더 원활하게 진행됩니다.<br><br>
                                                        <strong style="font-weight: bold;">통증 완화:</strong> <br>긁힘 부위에 있는
                                                        이물질이나 먼지를 제거하면 자극이 줄어들어 통증이 완화될 수 있습니다. 깨끗한 상태를 유지하는 것이
                                                        중요합니다.<br><br>
                                                    </p>
                                                </div>
                                            </div>
                                            <!-- Slide 2 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3"><br>
                                                    <a class="d-block blur-shadow-image" style="outline: none;">
                                                        <img class="d-block blur-shadow-image mx-auto" id="imageToReplace2"
                                                             src="${pageContext.request.contextPath}/img/kpaas/sodok.webp"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             style="width: 600px; height: 400px; object-fit: cover;"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        긁힌 상처 소독하기
                                                    </h4>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">감염예방:</strong><br>
                                                        소독은 세균, 바이러스, 곰팡이 등 병원체를 제거하여 감염의 위험을 줄이는 데 도움을 줍니다. 특히 상처나 수술
                                                        부위에서 감염이 발생할 경우, 치유 과정이 지연되거나 심각한 합병증이 발생할 수 있습니다.<br><br>
                                                        <strong style="font-weight: bold;">위생유지: </strong><br>
                                                        소독은 환경이나 도구의 위생을 유지하는 데 필수적입니다. 병원, 클리닉, 식품 가공업체 등에서는 소독을 통해 질병의
                                                        전파를 방지하고, 안전한 환경을 조성합니다.<br><br>
                                                        <strong style="font-weight: bold;">면역 체계 보호: </strong><br>
                                                        소독을 통해 병원체의 노출을 줄이면, 면역 체계가 과도하게 반응하지 않도록 도와줍니다. 이는 특히 면역력이
                                                        약한사람들(예: 노인, 어린이, 만성 질환자)에게 중요합니다.<br><br>


                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 3 -->
                                            <div class="carousel-item">
                                                <div class="card-body py-3"><br>
                                                    <div class="card-body px-0 py-3"><br>
                                                        <a class="d-block blur-shadow-image" style="outline: none;">
                                                            <img class="d-block blur-shadow-image mx-auto"  id="imageToReplace3"
                                                                 src="${pageContext.request.contextPath}/img/kpaas/dressing.png"
                                                                 alt="img-blur-shadow"
                                                                 class="img-fluid shadow border-radius-lg"
                                                                 style="width: 600px; height: 400px; object-fit: cover;"
                                                                 loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                        </a>
                                                        <br>
                                                        <h4 class="text-dark font-weight-bold">
                                                            긁힌 상처 드레싱하기
                                                        </h4>
                                                        <p class="text-dark fs-5">
                                                            <strong style="font-weight:bold; ">드레싱 하는이유:</strong><br>
                                                            드레싱은 상처를 외부 환경으로부터 보호하여 세균이나 오염물질이 침투하는 것을 막고, 상처의 치유를
                                                            촉진합니다.<br><br>
                                                            <strong style="font-weight:bold; ">상처 청소:</strong><br>
                                                            드레싱을 하기 전에 상처 부위를 깨끗이 청소합니다. 소독제를 사용하여 상처 주변의 피부를 소독하고, 상처
                                                            자체도 부드러운 생리식염수 등으로 세척하여 이물질을 제거합니다.<br><br>
                                                            <strong style="font-weight:bold; ">드레싱 부착:</strong><br>
                                                            청소한 후, 드레싱 패드를 상처에 부착합니다. 이때 드레싱이 상처를 충분히 덮고, 너무 꽉 조이지 않도록
                                                            주의합니다. 드레싱이 잘 고정되도록 테이프나 밴드를 사용하여 고정합니다.<br><br>


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