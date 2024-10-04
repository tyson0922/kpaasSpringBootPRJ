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
                                    <img src="${pageContext.request.contextPath}/img/down-arrow-dark.svg" alt="down-arrow"
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
                                    <img src="${pageContext.request.contextPath}/img/down-arrow-dark.svg" alt="down-arrow"
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
                                                    <img src="${pageContext.request.contextPath}/img/down-arrow.svg" alt="down-arrow"
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
                                                    <img src="${pageContext.request.contextPath}/img/down-arrow.svg" alt="down-arrow"
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
                                                    <img src="${pageContext.request.contextPath}/img/down-arrow.svg" alt="down-arrow"
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
                                                    <img src="${pageContext.request.contextPath}/img/down-arrow.svg" alt="down-arrow"
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
                                                    <img src="${pageContext.request.contextPath}/img/down-arrow.svg" alt="down-arrow"
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
                                    <img src="${pageContext.request.contextPath}/img/down-arrow-dark.svg" alt="down-arrow"
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
    <div class="card card-body blur shadow-blur mx-5 mx-md-7 mx-lg-9 mx-xl-10 mx-xxl-12 my-9 mx-auto" style="max-width: 80%;">
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
                                                                 src="${pageContext.request.contextPath}/img/kpaas/nengjimjil.webp"
                                                                 alt="img-blur-shadow"
                                                                 class="img-fluid shadow border-radius-lg"
                                                                 loading="lazy">
                                                        </a>
                                                        <br>

                                                    </div>
                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        멍이 들었을때 냉찜질하기

                                                    </h4>
                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">부기 감소:</strong><br>
                                                        냉찜질은 혈관을 수축시켜서 혈액의 흐름을 줄여 부기를 감소시킵니다.<br><br>
                                                        <strong style="font-weight: bold;">통증완화: </strong><br>
                                                        차가운 온도가 신경 수용체를 마비시켜 통증을 감소시키는 효과가 있습니다. 따라서 멍이 생긴 부위의 통증을 완화하는 데 도움이 됩니다.<br><br>
                                                        <strong style="font-weight: bold;">염증 억제: </strong><br>
                                                        냉찜질은 염증 반응을 줄여주어 상처 치유 과정에서의 불필요한 염증을 억제합니다. 이로 인해 회복이 더 빨라질 수 있습니다.<br><br>
                                                        <strong style="font-weight: bold;">*냉찜질은 부상 초기 24-48시간 내에 가장 효과적입니다.* </strong><br>
                                                    </p><br><br>

                                                </div>
                                            </div>
                                            <!-- Slide 2 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3"><br>
                                                    <a class="d-block blur-shadow-image" style="outline: none;">
                                                        <img id="imageToReplace2"
                                                             src="${pageContext.request.contextPath}/img/kpaas/abback.webp"
                                                             alt="img-blur-shadow"
                                                             class="img-fluid shadow border-radius-lg"
                                                             loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                    </a>
                                                    <br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        멍이 들었을때 압박하기
                                                    </h4>

                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight:bold; ">혈액 순환 개선:</strong><br>
                                                        압박을 통해 혈관을 압축하면 혈액의 흐름을 조절하여 멍이 생긴 부위의 혈액 순환을 개선할 수 있습니다.<br><br>
                                                        <strong style="font-weight: bold;">부기 감소: </strong><br>
                                                        압박은 염증과 부기를 줄이는 데 도움을 줍니다. 부위에 가해지는 압력이 체액의 축적을 막아 부풀어 오르는 것을 예방합니다.<br><br>
                                                        <strong style="font-weight: bold;">지지 제공: </strong><br>
                                                        압박은 부상당한 부위를 지지하여 움직임을 제한하고 추가적인 손상을 방지하는 역할을 합니다. 이는 회복 과정에서 중요한 요소입니다.<br><br>
                                                        <strong style="font-weight: bold;">*압박을 할 때는 너무 세게 하지 않도록 주의해야 합니다.* </strong><br>





                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 3 -->
                                            <div class="carousel-item">
                                                <div class="card-body py-3"><br>
                                                    <div class="card-body px-0 py-3"><br>
                                                        <a class="d-block blur-shadow-image" style="outline: none;">
                                                            <img id="imageToReplace3"
                                                                 src="${pageContext.request.contextPath}/img/kpaas/rest.webp"
                                                                 alt="img-blur-shadow"
                                                                 class="img-fluid shadow border-radius-lg"
                                                                 loading="lazy"><!-- 이미지 경로를 적절히 수정하세요 -->

                                                        </a>
                                                        <br>
                                                        <h4 class="text-dark font-weight-bold">
                                                            멍이 들었을때 충분한 휴식
                                                        </h4>
                                                        <p class="text-dark fs-5">
                                                            <strong style="font-weight:bold; ">회복 촉진:</strong><br>
                                                            부상당한 부위를 쉬게 하면 몸이 자연적으로 치유할 시간을 갖게 됩니다. 이는 부상 회복을 빠르게 도와줍니다.<br><br>
                                                            <strong style="font-weight:bold; ">통증 완화:</strong><br>
                                                            과도한 움직임이나 사용은 통증을 악화시킬 수 있습니다. 충분한 휴식은 통증을 줄이고 불편함을 최소화하는 데 도움이 됩니다.<br><br>
                                                            <strong style="font-weight:bold; ">재부상 방지:</strong><br>
                                                            부상을 당한 부위를 무리하게 사용하면 재부상의 위험이 커집니다. 휴식을 통해 부위가 충분히 회복되도록 하여 장기적인 건강을 유지할 수 있습니다.<br><br>


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