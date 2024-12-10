<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${naverApiClientKey}"></script>

    <script type="text/javascript">
        const naverClientKey = '${naverClientKey}';
        const naverClientSecret = '${naverClientSecret}';
        const userId = '${userId}';
        console.log("User ID:", userId);
    </script>
    <!-- Load hikingMapResult.js before inline scripts -->
    <%--    <script src="${pageContext.request.contextPath}/js/kpaasJs/hikingMapResult.js"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Inline scripts -->
    <script type="text/javascript">
        // Define global variables for map and parsed route data
        let map;
        let polygon;
        let userMarker;
        let selectedRouteLine = null;
        let alertShown = false;
        let savedRoutes = [];
        let savedPolylines = [];
        const hikingRouteData = JSON.parse('${hikingRouteDataJson}'); // Ensure JSON is parsed correctly

        console.log("Parsed Route Data:", hikingRouteData);

        // Set up polygon points from server data
        const polygonPoints = {
            firstPointLat: ${polygonPoints.firstPointLat},
            firstPointLng: ${polygonPoints.firstPointLng},
            secondPointLat: ${polygonPoints.secondPointLat},
            secondPointLng: ${polygonPoints.secondPointLng},
            thirdPointLat: ${polygonPoints.thirdPointLat},
            thirdPointLng: ${polygonPoints.thirdPointLng},
            fourthPointLat: ${polygonPoints.fourthPointLat},
            fourthPointLng: ${polygonPoints.fourthPointLng},
            centroidLat: ${polygonPoints.centroidLat},
            centroidLng: ${polygonPoints.centroidLng}
        };

        window.addEventListener("DOMContentLoaded", function () {
            initMapWithRetry();
            setTimeout(showCurrentLocation, 3000);
        });

        function initMapWithRetry(retries = 5) {
            if (polygonPoints) {
                const points = [
                    new naver.maps.LatLng(polygonPoints.firstPointLat, polygonPoints.firstPointLng),
                    new naver.maps.LatLng(polygonPoints.secondPointLat, polygonPoints.secondPointLng),
                    new naver.maps.LatLng(polygonPoints.thirdPointLat, polygonPoints.thirdPointLng),
                    new naver.maps.LatLng(polygonPoints.fourthPointLat, polygonPoints.fourthPointLng)
                ];
                initMapWithPolygon(polygonPoints.centroidLat, polygonPoints.centroidLng, points);

                hikingRouteData.forEach(route => {
                    viewRouteOnMap(route.geometry, route);
                });
            } else if (retries > 0) {
                setTimeout(() => initMapWithRetry(retries - 1), 500);
            } else {
                console.error("Polygon points data not available after retries.");
            }
        }

        function initMapWithPolygon(centroidLat, centroidLng, points) {
            if (!map) {
                map = new naver.maps.Map('map', {
                    center: new naver.maps.LatLng(centroidLat, centroidLng), // Initial center set to centroid
                    zoom: 13,
                    minZoom: 13
                });
            }
            drawPolygonFromPoints(map, points);
        }

        function drawPolygonFromPoints(map, points) {
            polygon = new naver.maps.Polygon({
                map: map,
                paths: points,
                fillOpacity: 0,
                strokeColor: '#00FF00',
                strokeWeight: 2
            });
        }

        function viewRouteOnMap(geometry, routeInfo) {
            console.log("Entering viewRouteOnMap with routeInfo:", routeInfo);
            const coordinates = geometry.match(/[-+]?\d*\.\d+|\d+/g);
            const path = [];

            for (let i = 0; i < coordinates.length; i += 2) {
                const lat = parseFloat(coordinates[i + 1]);
                const lng = parseFloat(coordinates[i]);
                path.push(new naver.maps.LatLng(lat, lng));
            }

            const routeLine = new naver.maps.Polyline({
                map: map,
                path: path,
                strokeColor: '#058700', // Default color
                strokeWeight: 5,
                clickable: true
            });

            routeLine.routeInfo = routeInfo;

            naver.maps.Event.addListener(routeLine, 'mouseover', () => {
                map.getElement().style.cursor = 'pointer';
            });
            naver.maps.Event.addListener(routeLine, 'mouseout', () => {
                map.getElement().style.cursor = 'grab';
            });

            naver.maps.Event.addListener(routeLine, 'click', () => {
                console.log("Polyline clicked, passing routeInfo to updateCardInfo:", routeInfo);

                if (selectedRouteLine === routeLine) {
                    routeLine.setOptions({
                        strokeColor: '#058700' // Original color
                    });
                    selectedRouteLine = null;
                    updateCardInfo({});
                } else {
                    if (selectedRouteLine) {
                        selectedRouteLine.setOptions({
                            strokeColor: '#058700'
                        });
                    }
                    routeLine.setOptions({
                        strokeColor: '#0000FF'
                    });
                    selectedRouteLine = routeLine;
                    updateCardInfo(routeInfo);
                }
            });
        }

        function updateCardInfo(routeInfo) {
            console.log("Updating card with routeInfo:", routeInfo);
            console.log("routeInfo : ", routeInfo)
            document.getElementById('section-length').innerText = routeInfo.secLen || "등산로를 선택하세요";
            document.getElementById('uphill-time').innerText = routeInfo.upMin || "등산로를 선택하세요";
            document.getElementById('downhill-time').innerText = routeInfo.downMin || "등산로를 선택하세요";
            document.getElementById('category').innerText = routeInfo.catNam || "등산로를 선택하세요";
            document.getElementById('mountain-name').innerText = routeInfo.mntnNm || "등산로를 선택하세요";
        }

        function saveSelectedRoute() {
            // Ensure a line is selected
            if (!selectedRouteLine || !selectedRouteLine.routeInfo) {
                Swal.fire({
                    title: '등산로 선택 필요 🌲',
                    text: '저장할 등산로를 선택하세요.',
                    icon: 'warning',
                    confirmButtonText: '확인',
                    background: '#d4edda',
                    color: '#155724',
                    confirmButtonColor: '#28a745'
                });
                return;
            }

            const routeId = selectedRouteLine.routeInfo.routeId;

            // Prevent duplicate saves
            if (savedRoutes.includes(routeId)) {
                Swal.fire({
                    title: '중복 저장 경고 🌿',
                    text: '이미 저장된 등산로입니다.',
                    icon: 'warning',
                    confirmButtonText: '확인',
                    background: '#d4edda',
                    color: '#155724',
                    confirmButtonColor: '#28a745'
                });
            } else {
                savedRoutes.push(routeId);
                Swal.fire({
                    title: '저장 완료 ✅',
                    text: '등산로가 저장되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인',
                    background: '#d4edda',
                    color: '#155724',
                    confirmButtonColor: '#28a745'
                });
            }

            console.log("Saved Routes:", savedRoutes);
        }


        function fetchSavedRoutes() {
            if (savedRoutes.length === 0) {
                Swal.fire({
                    title: '저장된 경로 없음 🚫',
                    text: '저장된 등산로가 없습니다.',
                    icon: 'info',
                    confirmButtonText: '확인',
                    background: '#d4edda',
                    color: '#155724',
                    confirmButtonColor: '#28a745' // Neutral gray button color
                });
                return;
            }


            fetch('/api/hiking-route/aggregate', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(savedRoutes), // Send saved route IDs
            })
                .then(response => response.json())
                .then(data => {
                    console.log("Aggregated Route Data:", data);

                    if (data) {
                        updateAggregatedInfo(data); // Update aggregated info in the UI
                    } else {
                        console.error("No data received from backend.");
                    }
                })
                .catch(error => {
                    console.error("Error fetching saved routes:", error);
                });
        }


        function updateAggregatedInfo(aggregatedInfo) {
            if (!aggregatedInfo) {
                console.error("No aggregated info available.");

                return;
            }

            console.log("Aggregated Info:", aggregatedInfo);
            console.log("Total Up Min:", aggregatedInfo.totalUpMin);
            console.log("Total Down Min:", aggregatedInfo.totalDownMin);

            const totalLengthElem = document.getElementById('total-length');
            const difficultySummaryElem = document.getElementById('difficulty-summary');
            const uphillTimeElem = document.getElementById('totalUphill-time');
            const downhillTimeElem = document.getElementById('totalDownhill-time');
            const mountainsElem = document.getElementById('mountains');

            if (totalLengthElem) totalLengthElem.innerText = aggregatedInfo.totalSecLen || "정보 없음";
            if (difficultySummaryElem) difficultySummaryElem.innerText = aggregatedInfo.uniqueCatNam.join(", ") || "정보 없음";
            if (uphillTimeElem) uphillTimeElem.innerText = aggregatedInfo.totalUpMin || "정보 없음";
            if (downhillTimeElem) downhillTimeElem.innerText = aggregatedInfo.totalDownMin || "정보 없음";
            if (mountainsElem) mountainsElem.innerText = aggregatedInfo.distinctMountainName.join(", ") || "정보 없음";

            if (aggregatedInfo.geometries && Array.isArray(aggregatedInfo.geometries)) {
                displayIndividualGeometries(aggregatedInfo.geometries);
            } else {
                console.warn("No geometries found.");
            }
        }

        function displayIndividualGeometries(geometries) {
            if (!Array.isArray(geometries) || geometries.length === 0) {
                console.error("Invalid geometries data:", geometries);
                return;
            }

            geometries.forEach((geometry, index) => {
                if (!geometry || typeof geometry !== 'string') {
                    console.warn(`Invalid geometry at index ${index}:`, geometry);
                    return;
                }

                console.log(`Displaying Geometry ${index + 1}:`, geometry);

                const coordinates = geometry.match(/[-+]?\d*\.\d+|\d+/g);

                if (!coordinates || coordinates.length % 2 !== 0) {
                    console.error("Invalid coordinates extracted from geometry:", coordinates);
                    return;
                }

                const path = [];
                for (let i = 0; i < coordinates.length; i += 2) {
                    const lat = parseFloat(coordinates[i + 1]);
                    const lng = parseFloat(coordinates[i]);
                    path.push(new naver.maps.LatLng(lat, lng));
                }

                const polyline = new naver.maps.Polyline({
                    map: map,
                    path: path,
                    strokeColor: '#00FF00', // Green for individual routes
                    strokeWeight: 4
                });

                savedPolylines.push(polyline);
            });
        }

        // Function to delete saved routes
        function deleteSavedRoutes() {
            if (savedRoutes.length === 0) {
                Swal.fire({
                    title: '삭제 불가 🚫',
                    text: '저장된 경로가 없습니다.',
                    icon: 'info',
                    confirmButtonText: '확인',
                    background: '#f8d7da',
                    color: '#721c24',
                    confirmButtonColor: '#dc3545'
                });
                return;
            }

            Swal.fire({
                title: '확인 요청 ⚠️',
                text: '저장된 경로를 삭제하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '삭제',
                cancelButtonText: '취소',
                background: '#f8d7da',
                color: '#721c24',
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d'
            }).then((result) => {
                if (result.isConfirmed) {
                    savedRoutes = []; // Clear saved routes


                    savedPolylines.forEach(polyline => {
                        polyline.setMap(null); // Remove the polyline from the map
                    });
                    savedPolylines = []; // Clear the array

                    Swal.fire({
                        title: '삭제 완료 ✅',
                        text: '모든 저장된 경로가 삭제되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인',
                        background: '#d4edda',
                        color: '#155724',
                        confirmButtonColor: '#28a745'
                    });
                    console.log("Saved Routes cleared:", savedRoutes);
                }
            });
        }


        function showCurrentLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.watchPosition(
                    (position) => {
                        const accuracy = position.coords.accuracy;
                        const userLat = position.coords.latitude;
                        const userLng = position.coords.longitude;
                        const userLocation = new naver.maps.LatLng(userLat, userLng);

                        if (!userMarker) {
                            userMarker = new naver.maps.Marker({
                                position: userLocation,
                                map: map,
                                title: "현재 위치",
                                icon: {
                                    content: `
                                                <div style="text-align: center;">
                                                    <div style="width: 12px; height: 12px; background-color: red; border-radius: 50%; margin: 0 auto;"></div>
                                                    <div style="font-size: 12px; color: black; margin-top: 4px;">현재 위치</div>
                                                </div>
                                              `,
                                    anchor: new naver.maps.Point(6, 18)
                                }
                            });
                        } else {
                            userMarker.setPosition(userLocation);
                        }

                        // Alert if accuracy is low (example: 100 meters threshold)
                        if (accuracy > 100 && !alertShown) {
                            Swal.fire({
                                title: '위치 부정확 🌲',
                                text: '현재 위치가 GPS를 사용하지 않으므로 부정확할 수 있습니다.',
                                icon: 'warning',
                                confirmButtonText: '확인',
                                background: '#d4edda', // 초록색 배경
                                color: '#155724', // 초록색 텍스트
                                confirmButtonColor: '#28a745', // 초록색 버튼
                                showClass: {
                                    popup: 'animate__animated animate__fadeInDown' // 등장 애니메이션
                                },
                                hideClass: {
                                    popup: 'animate__animated animate__fadeOutUp' // 사라짐 애니메이션
                                }
                            }).then(() => {
                                alertShown = true;
                            });
                        }

                    },
                    (error) => {
                        console.error("Error fetching user location:", error);
                    },
                    {
                        enableHighAccuracy: true,
                        timeout: 5000,
                        maximumAge: 0
                    }
                );
            } else {
                console.error("Geolocation is not supported by this browser.");
            }
        }


        function centerOnUserLocation() {
            if (userMarker) {
                map.setCenter(userMarker.getPosition());
            } else {
                console.error("User location not available yet.");
            }
        }

        function centerOnCentroid() {
            const centroidLocation = new naver.maps.LatLng(polygonPoints.centroidLat, polygonPoints.centroidLng);
            map.setCenter(centroidLocation);
        }


    </script>
    <style>
        .custom-tabs .nav-link {
            color: #388e3c; /* Green text for tabs */
            border: 1px solid transparent;
        }

        .custom-tabs .nav-link:hover {
            color: #1b5e20; /* Darker green on hover */
        }

        .custom-tabs .nav-link.active {
            background-color: #a5d6a7; /* Light green background for active tab */
            color: #ffffff; /* White text for active tab */
            border-color: #4caf50; /* Green border for active tab */
        }


        .custom-button {
            background-color: #4caf50; /* Green background */
            color: #ffffff; /* White text */
            border: none;
        }

        .custom-button:hover {
            background-color: #388e3c; /* Darker green on hover */
            color: #ffffff; /* White text */
        }

        .tab-content {
            background-color: #e8f5e9; /* Light green background */
            border: 1px solid #4caf50; /* Green border */
            border-radius: 8px; /* Rounded corners */
            padding: 1rem; /* Add padding */
        }

        h3 {
            color: #2e7d32; /* Green header text */
        }

        .small-text {
            font-size: 0.85rem; /* Adjust the font size to make it smaller */
            padding: 0.375rem 0.75rem; /* Adjust padding for smaller text */
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

    <%--    산 지도 및 파라미터 시작--%>
    <div class="card card-body blur shadow-blur mx-auto my-9"
         style="width: 90%; height: calc(100vh - 6rem); margin-top: 3rem; margin-bottom: 3rem; overflow-y: scroll;">
        <div class="row h-100">
            <!-- Map Container -->
            <div id="map-wrapper" class="col-md-9 col-12 overflow-auto" style="flex-grow: 1;">
                <div id="map" style="height: 100%; min-height: 600px;"></div>
            </div>
            <!-- Route Details Card -->
            <div id="route-details"
                 class="col-md-3 col-12 d-flex flex-column align-items-start overflow-auto"
                 style="padding: 1rem;">
                <!-- Tab Navigation -->
                <ul class="nav nav-tabs custom-tabs w-70 justify-content-between" id="routeDetailsTabs" role="tablist">
                    <li class="nav-item flex-fill" role="presentation">
                        <button class="nav-link active custom-tab-link flex-fill" id="selected-route-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#selected-route" type="button" role="tab" aria-controls="selected-route"
                                aria-selected="true">
                            선택한 등산로
                        </button>
                    </li>
                    <li class="nav-item flex-fill" role="presentation">
                        <button class="nav-link custom-tab-link flex-fill" id="saved-routes-tab" data-bs-toggle="tab"
                                data-bs-target="#saved-routes" type="button" role="tab" aria-controls="saved-routes"
                                aria-selected="false">
                            저장된 등산로
                        </button>
                    </li>
                </ul>

                <!-- Tab Content -->
                <div class="tab-content w-70" id="routeDetailsTabContent"
                     style="background-color: #e8f5e9; border: 1px solid #4caf50; border-radius: 0 0 8px 8px; padding: 1rem;">
                    <!-- Selected Route Tab -->
                    <div class="tab-pane fade show active w-100" id="selected-route" role="tabpanel"
                         aria-labelledby="selected-route-tab">
                        <%--                        <h3 style="color: #2e7d32;">선택한 등산로 상세정보</h3>--%>
                        <p><strong>산 이름:</strong> <span id="mountain-name">등산로를 선택하세요</span></p>
                        <p><strong>거리(m):</strong> <span id="section-length">등산로를 선택하세요</span></p>
                        <p><strong>상행 시간(분):</strong> <span id="uphill-time">등산로를 선택하세요</span></p>
                        <p><strong>하행 시간(분):</strong> <span id="downhill-time">등산로를 선택하세요</span></p>
                        <p><strong>난이도:</strong> <span id="category">등산로를 선택하세요</span></p>
                        <button class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0 custom-button"
                                id="save-route-btn" onclick="saveSelectedRoute()">등산로 저장하기
                        </button>
                        <br>
                    </div>

                    <!-- Saved Routes Tab -->
                    <div class="tab-pane fade w-70" id="saved-routes" role="tabpanel"
                         aria-labelledby="saved-routes-tab">
                        <%--                        <h3 style="color: #2e7d32;">저장된 등산로 상세정보</h3>--%>
                        <p>총 거리: <span id="total-length">정보 없음</span></p>
                        <p>난이도: <span id="difficulty-summary">정보 없음</span></p>
                        <p>오르막 시간: <span id="totalUphill-time">정보 없음</span></p>
                        <p>내리막 시간: <span id="totalDownhill-time">정보 없음</span></p>
                        <p>산 이름: <span id="mountains">정보 없음</span></p>

                        <button class="btn btn-sm bg-gradient-success me-1 custom-button small-text"
                                id="fetch-saved-routes-btn" onclick="fetchSavedRoutes()">저장된 경로 확인
                        </button>

                        <button class="btn btn-sm bg-gradient-danger mt-0 mb-0 custom-button small-text"
                                id="delete-saved-routes-btn" onclick="deleteSavedRoutes()">저장된 경로 삭제하기
                        </button>

                        <br>
                    </div>
                </div>
                <br>
                <button class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0" onclick="centerOnUserLocation()">
                    현재 위치로 이동
                </button>
                <br>
                <button class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0" onclick="centerOnCentroid()">등산로
                    위치로 이동
                </button>
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