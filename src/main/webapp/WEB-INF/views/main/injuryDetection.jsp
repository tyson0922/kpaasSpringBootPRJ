<%--<%@ page import="kopo.kpaas.dto.InjuryDTO" %>--%>
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
    <%--    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>--%>
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
    <!-- CSS Files -->
    <link id="pagestyle" href="${pageContext.request.contextPath}/css/material-kit.css?v=3.0.4" rel="stylesheet"/>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <%--    <!-- Bootstrap JavaScript and dependencies -->--%>
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
                                        <a href="/user/sign-in" class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0">로그인</a>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- If logged in, show "프로필" and "로그아웃" buttons -->
                                        <a href="myPage.jsp" class="btn btn-sm bg-gradient-success mb-0 me-1 mt-2 mt-md-0">마이페이지</a>
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

    <div class="card card-body blur shadow-blur mx-5 mx-md-7 mx-lg-9 mx-xl-10 mx-xxl-12 my-9 mx-auto"
         style="max-width: 80%;">
        <!-- START Testimonials w/ user image & text & info -->

        <!-- START Blogs w/ 4 cards w/ image & text & link -->
        <section class="py-3">
            <div class="container">
                <div class="row">
                    <!-- Left Section: 1/3 of the screen -->
                    <div class="col-lg-4 col-sm-4">
                        <div class="card card-plain" style="border: none; box-shadow: none;">
                            <div class="card-header p-0 position-relative" style="border: none;">
                                <a class="d-block blur-shadow-image" style="outline: none;">
                                    <!-- The existing image that will be replaced -->
                                    <img id="imageToReplace"
                                         src="${pageContext.request.contextPath}/img/kpaas/hikingTrail.webp"
                                         alt="img-blur-shadow"
                                         class="img-fluid shadow border-radius-lg" loading="lazy">
                                </a>
                            </div>
                            <!-- Button below the image -->
                            <div class="card-body text-center mt-3 p-0" style="border: none; box-shadow: none;">
                                <!-- Hidden file input -->
                                <input type="file" id="fileInput" accept="image/*" style="display: none;" onchange="handleFileUpload(this)">

                                <!-- Button to trigger file input -->
                                <button type="button" class="btn btn-outline-success" style="width: 100%;" onclick="document.getElementById('fileInput').click();">
                                    사진 업로드
                                </button>

                                <!-- "상처 분석 시작" Button (Initially hidden) -->
                                <button type="button" id="analyzeButton" class="btn btn-outline-success" style="display: none; width: 100%;" onclick="startAnalysis()">
                                    상처 분석 시작
                                </button>

                                <!-- Progress Bar (Initially hidden) -->
                                <div id="progressBar" class="progress" style="height: 30px; display: none; background-color: #e9ecef;">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success d-flex justify-content-center align-items-center"
                                         role="progressbar" style="width: 100%; height: 100%;">
                                        분석 중
                                    </div>
                                </div>

                                <!-- "분석 결과" Button (Visible after analysis is complete) -->
                                <button type="button" id="resultButton" class="btn btn-outline-success" style="display: none; width: 100%; margin-bottom: 0 !important;">
                                    분석 결과
                                </button>

                            </div>
                        </div>
                    </div>


                    <!-- Right Section: 2/3 of the screen (contains the carousel) -->
                    <div class="col-lg-8 col-sm-8">
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
                                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
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
                                                    <h4 class="text-dark font-weight-bold">
                                                        사진 촬영 또는 업로드
                                                    </h4>
                                                    <p class="text-dark fs-5">
                                                        <strong style="font-weight: bold;">모바일에서:</strong> <br>휴대폰 카메라로
                                                        상처 사진을 새로 촬영하거나 갤러리에서 사진을 선택할 수
                                                        있습니다.<br><br>
                                                        <strong style="font-weight: bold;">컴퓨터에서:</strong> <br>웹캠을 사용해
                                                        사진을 촬영하거나 컴퓨터에서 파일을 업로드할 수 있습니다.<br><br>
                                                        <strong style="font-weight: bold;">중요:</strong> <br>상처가 선명하게
                                                        보이도록 하세요. 상처를 너무 멀리 또는 가까이에서 촬영하면 부정확한 결과가 나올 수
                                                        있습니다.<br><br>
                                                    </p>
                                                </div>
                                            </div>
                                            <!-- Slide 2 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3"><br><br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        업로드 버튼 클릭
                                                    </h4>
                                                    <p class="text-dark fs-5">
                                                        사진을 선택하거나 촬영한 후, 업로드 버튼을 클릭하여 분석을 위해 제출하세요.
                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 3 -->
                                            <div class="carousel-item">
                                                <div class="card-body py-3"><br><br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        몇 초간 기다리세요
                                                    </h4>
                                                    <p class="text-dark fs-5">
                                                        이미지가 분석되는 동안 잠시 기다려 주세요. 몇 초가 걸릴 수 있습니다.
                                                    </p><br><br>
                                                </div>
                                            </div>
                                            <!-- Slide 4 -->
                                            <div class="carousel-item">
                                                <div class="card-body px-0 py-3"><br><br>
                                                    <h4 class="text-dark font-weight-bold">
                                                        진단 결과 확인
                                                    </h4>
                                                    <p class="text-dark fs-5">
                                                        분석이 완료되면 상처에 대한 정보와 추가 조치에 대한 제안이 표시됩니다.
                                                    </p><br><br>
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

<%--<script src="${pageContext.request.contextPath}/js/kpaasJs/uploadHandler.js"></script>--%>
<script>
    // File upload handler
    function handleFileUpload(input) {
        if (input.files && input.files[0]) {
            const file = input.files[0];
            console.log('File selected: ', file.name);

            if (file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    console.log('Image loaded successfully.');
                    const imgElement = document.getElementById('imageToReplace');
                    imgElement.src = e.target.result;

                    const analyzeButton = document.getElementById('analyzeButton');
                    analyzeButton.style.display = 'block';

                    const progressBar = document.getElementById('progressBar');
                    progressBar.style.display = 'none';

                    const resultButton = document.getElementById('resultButton');
                    resultButton.style.display = 'none'; // Hide result button when a new image is uploaded
                };
                reader.readAsDataURL(file);
            } else {
                alert("Please upload a valid image file.");
            }
        }
    }

    // Start the analysis
    function startAnalysis() {
        console.log('Analysis started...');
        const analyzeButton = document.getElementById('analyzeButton');
        analyzeButton.style.display = 'none';

        const progressBar = document.getElementById('progressBar');
        progressBar.style.display = 'block';

        const file = document.getElementById('fileInput').files[0];
        if (!file) {
            alert("Please select a file.");
            return;
        }

        console.log('File selected for analysis: ', file.name);

        getBase64fromFile(file).then(function (base64image) {
            console.log('Base64 image ready for API request...');

            // Resize the image before sending it to the API
            resizeImage(base64image).then(function (resizedImage) {
                sendToAPI(resizedImage);
            });
        });
    }

    // Resize the image to 640x640 before sending to the API
    function resizeImage(base64Str) {
        return new Promise(function (resolve, reject) {
            const img = new Image();
            img.src = base64Str;
            img.onload = function () {
                const canvas = document.createElement("canvas");
                const WIDTH = 640;  // Set width to 640px
                const HEIGHT = 640; // Set height to 640px

                // Set canvas to the required size
                canvas.width = WIDTH;
                canvas.height = HEIGHT;

                const ctx = canvas.getContext("2d");

                // Stretch the image to fit 640x640
                ctx.drawImage(img, 0, 0, WIDTH, HEIGHT);

                // Return resized image as Base64
                resolve(canvas.toDataURL("image/jpeg", 1.0));
            };
            img.onerror = reject;
        });
    }

    // Send the resized image to the API
    function sendToAPI(base64image) {
        const settings = {
            url: "https://classify.roboflow.com/yaralanmalar/1?api_key=C5dYf8a6t6Xgy8BsI3Ml",
            method: "POST",
            data: base64image,
            success: function (response) {
                console.log('API request successful:', response);
                handleAPIResponse(response);
            },
            error: function (error) {
                console.error('API request failed:', error);
                document.getElementById('output').innerHTML = 'API request failed: ' + error.message;
            }
        };

        $.ajax(settings);
    }

    function handleAPIResponse(response) {
        console.log('Full API response:', response);  // Log the full API response for debugging

        // Check if predicted_classes is available and not empty
        if (response.predicted_classes && response.predicted_classes.length > 0) {
            console.log('Predicted classes available:', response.predicted_classes);

            const detectedInjury = response.predicted_classes[0];  // Get the first predicted injury class
            console.log(`Extracted detected injury: ${detectedInjury}`);

            // Check if the predictions object contains the detected injury to get the confidence level
            if (detectedInjury && response.predictions && response.predictions[detectedInjury]) {
                const confidence = response.predictions[detectedInjury].confidence;
                console.log(`Confidence level for ${detectedInjury}: ${confidence}`);

                // Optionally, round the confidence value
                const confidencePercent = (confidence * 100).toFixed(2);

                // Automatically set the detectedAt field (current timestamp)
                const detectedAt = new Date().toISOString();  // Current timestamp in ISO format

                // Send the detected injury data to the backend to save in the database
                saveInjuryDataToDB(detectedInjury, confidencePercent, detectedAt);

                // Display a button that will redirect to result.jsp
                displayResultButton();
            } else {
                console.log(`No confidence data available for ${detectedInjury}`);
            }
        } else {
            console.log('No predicted classes found.');
            displayResult("No predicted classes found.");

        }
    }

    // Function to display the "분석 결과" button that redirects to result.jsp and hide the progress bar
    function displayResultButton() {
        // Find the result button and make it visible
        const resultButton = document.getElementById('resultButton');
        const progressBar = document.getElementById('progressBar');

        if (resultButton) {
            // Show the result button
            resultButton.style.display = 'block';

            // Hide the progress bar
            if (progressBar) {
                progressBar.style.display = 'none';
            }

            // Add click event to redirect to result.jsp when the button is clicked
            resultButton.addEventListener('click', function () {
                window.location.href = '/injuries/injuryResult';
            });
        } else {
            console.error("Result button not found in the DOM.");
        }
    }


    // Function to send the detected injury data to the backend
    function saveInjuryDataToDB(injuryClass, confidenceLevel, detectedAt) {
        const userId = "${userId}";  // Retrieve the userId passed from the backend (via JSP or server-side code)
        const regId = userId;        // Set regId to be the same as userId
        const chgId = userId;        // Set chgId to be the same as userId
        const regDt = detectedAt;    // Set regDt to the detectedAt timestamp
        const chgDt = detectedAt;    // Set chgDt to the detectedAt timestamp

        $.ajax({
            url: '/injuries/save',  // Matches your Spring Boot controller mapping
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                injuryClass: injuryClass,
                confidenceLevel: confidenceLevel,
                userId: userId,     // Adding userId
                regId: regId,       // Adding regId
                chgId: chgId,       // Adding chgId
                regDt: regDt,       // Adding regDt
                chgDt: chgDt        // Adding chgDt
            }),
            success: function (response) {
                console.log('Injury data saved successfully:', response);
            },
            error: function (error) {
                console.error('Error saving injury data:', error);
            }
        });
    }

    // Display result function
    function displayResult(resultText) {
        const resultButton = document.getElementById('resultButton');
        const progressBar = document.getElementById('progressBar'); // Get the progress bar element
        const resultDisplay = document.getElementById('resultDisplay'); // Get the result display area

        // Hide the progress bar once the analysis is done
        if (progressBar) {
            progressBar.style.display = 'none'; // Hide the progress bar
        }

        // Check if the result is "No predicted classes found" to display an alert in Korean
        if (resultText === "No predicted classes found.") {
            alert("상처 분석 중 오류가 발생했습니다. 다른 상처 이미지를 입력해주세요.");
            window.location.href = "/main/injuryDetection";
        }

        if (resultButton) {
            resultButton.innerHTML = resultText;
            resultButton.style.display = 'block'; // Show the result button
        } else {
            console.log('Result button not found in DOM.');
        }

    }

    // Convert image to Base64
    function getBase64fromFile(file) {
        return new Promise(function (resolve, reject) {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function () {
                resolve(reader.result);
            };
            reader.onerror = function (error) {
                reject(error);
            };
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        console.log('DOM fully loaded and parsed.');

    });
</script>


</body>

</html>