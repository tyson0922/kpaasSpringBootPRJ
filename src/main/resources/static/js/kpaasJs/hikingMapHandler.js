// Initialize map-related variables
var map = null;
var markers = [];
var polygon = null;
var infoWindow = null;
var centroidMarker = null;
var clickCount = 0;
var points = [];
const userId = "${userId}";
const tabLinks = document.querySelectorAll('.tabnav a');
const tabContents = document.querySelectorAll('.tabcontent > div');


// Function to initialize the map
function initMap() {
    map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.3595704, 127.105399),
        zoom: 13, // Initial zoom level
        minZoom: 13 // Set the minimum zoom level here
    });

    // Add click event listener to the map for polygon drawing
    naver.maps.Event.addListener(map, 'click', function (e) {
        handleMapClick(e.latlng);
    });
}

// Function to handle map clicks and draw polygons
function handleMapClick(latlng) {
    const pointNumber = ['First', 'Second', 'Third', 'Fourth'];
    console.log(`${pointNumber[clickCount]} point set at Lat: ${latlng.lat()}, Lng: ${latlng.lng()}`);

    if (clickCount < 4) {
        points.push(latlng);
        clickCount++;

        // Add a marker at the clicked location
        var marker = new naver.maps.Marker({
            position: latlng,
            map: map,
            title: `Point ${String.fromCharCode(64 + clickCount)}`
        });
        markers.push(marker);

        drawPolygonOrLines();

        if (clickCount === 4) {
            displayPolygonArea();
            calculateCentroid();
            savePointsToDatabase();
        }
    } else {
        resetMap();
    }
}
function drawPolygonOrLines() {
    // Remove the previous polygon or lines from the map if they exist
    if (polygon) {
        polygon.setMap(null);
    }

    // Draw the polygon with the current set of points
    polygon = new naver.maps.Polygon({
        map: map,
        paths: points,
        fillColor: '#00FF00',
        fillOpacity: 0.4,
        strokeColor: '#00FF00',
        strokeWeight: 2
    });

    // If the polygon has four points, close it by connecting the last point to the first point
    if (clickCount === 4) {
        points.push(points[0]); // Close the polygon by adding the first point at the end
        polygon.setPaths(points); // Update the polygon with the closed path
    }
}

function displayPolygonArea() {
    if (points.length < 4) return; // 다각형이 완성되었는지 확인 (4개 이상의 점 필요)

    // Shoelace 공식을 사용하여 다각형의 면적 계산
    let area = 0;
    for (let i = 0; i < points.length - 1; i++) {
        area += points[i].lng() * points[i + 1].lat() - points[i + 1].lng() * points[i].lat();
    }
    area += points[points.length - 1].lng() * points[0].lat() - points[0].lng() * points[points.length - 1].lat(); // 다각형을 닫기 위한 마지막 계산
    area = Math.abs(area / 2);

    // 면적을 도 단위에서 제곱미터로 변환 (근사 변환)
    const conversionFactor = 111000 * 111000; // 적도에서의 도당 미터 제곱 변환 계수
    const areaInSquareMeters = area * conversionFactor;
    const areaInSquareKilometers = areaInSquareMeters / 1_000_000; // 제곱킬로미터로 변환

    // 면적이 30 제곱킬로미터를 초과할 경우 사용자에게 알림
    if (areaInSquareKilometers > 30) {
        alert(`선택된 영역이 넓어서 부정확한 결과가 나올 수 있습니다. 면적이 ${areaInSquareKilometers.toFixed(2)}km²로, 30km² 제한을 초과합니다`);
    }

    console.log(`면적: ${areaInSquareKilometers.toFixed(2)}km²`);

    // 지도에 면적을 정보 창으로 표시
    infoWindow = new naver.maps.InfoWindow({
        content: `<div style="padding:5px;">면적: ${areaInSquareKilometers.toFixed(2)}km²</div>`, // 면적 정보 표시
        position: points[points.length - 1], // 마지막 점에 정보 창 위치 설정
        borderWidth: 2,
        borderColor: '#00FF00' // 정보 창 테두리 색상 설정
    });

    infoWindow.open(map); // 지도에 정보 창 열기
}


function calculateCentroid() {
    let sumLat = 0, sumLng = 0, numPoints = points.length - 1; // Exclude the repeated first point
    console.log(`Number of unique points used for centroid calculation: ${numPoints}`);

    // Calculate the centroid by averaging the latitude and longitude values
    for (let i = 0; i < numPoints; i++) {
        console.log(`Point ${i + 1}: Lat: ${points[i].lat()}, Lng: ${points[i].lng()}`);
        sumLat += points[i].lat();
        sumLng += points[i].lng();
    }

    const centroidLat = sumLat / numPoints;
    const centroidLng = sumLng / numPoints;

    // Debugging statements to verify the centroid calculation
    console.log(`Sum of latitudes: ${sumLat}, Sum of longitudes: ${sumLng}`);
    console.log(`Calculated centroid coordinates: Lat: ${centroidLat}, Lng: ${centroidLng}`);

    // Check if centroid values are valid
    if (isNaN(centroidLat) || isNaN(centroidLng)) {
        console.error("Centroid calculation error: Invalid latitude or longitude values.");
        return; // Exit if the centroid coordinates are invalid
    }

// Create a button element to be displayed as a marker
    const buttonElement = `
    <button type="button" class="btn btn-primary" onclick="fetchHikingRouteAndRedirect();"
        style="padding: 5px 10px; font-size: 12px; white-space: normal; line-height: 1.2; width: auto; height: auto;">
        등산로 <br/> 조회
    </button>`;

    // Remove the existing centroid marker (if any)
    if (centroidMarker) {
        centroidMarker.setMap(null);
        centroidMarker = null;
    }

    // Display the button as a marker at the centroid location
    centroidMarker = new naver.maps.Marker({
        position: new naver.maps.LatLng(centroidLat, centroidLng),
        map: map,
        icon: {
            content: buttonElement,
            anchor: new naver.maps.Point(12, 12)
        }
    });

    console.log('Centroid button successfully added to the map.');
}

function savePointsToDatabase() {
    const data = {
        userId: userId,
        firstPointLat: points[0].lat(),
        firstPointLng: points[0].lng(),
        secondPointLat: points[1].lat(),
        secondPointLng: points[1].lng(),
        thirdPointLat: points[2].lat(),
        thirdPointLng: points[2].lng(),
        fourthPointLat: points[3].lat(),
        fourthPointLng: points[3].lng(),
        centroidLat: centroidMarker.getPosition().lat(),
        centroidLng: centroidMarker.getPosition().lng()
    };
    if (!userId) {
        console.error("User is not logged in. Cannot save points.");
        alert("You need to be logged in to save points.");
        return;
    }
    fetch('/api/savePoints', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
        .then(response => response.json())
        .then(result => {
            console.log('Data successfully saved:', result);
        })
        .catch(error => {
            console.error('Error saving data:', error);
        });
}

function resetMap() {
    // Reset all markers, polygon, and counters
    clickCount = 0;
    points = [];

    // Remove markers from the map
    markers.forEach(marker => marker.setMap(null));
    markers = [];

    // Remove the centroid marker from the map
    if (centroidMarker) {
        centroidMarker.setMap(null);
        centroidMarker = null;
    }

    // Remove the polygon from the map
    if (polygon) {
        polygon.setMap(null);
        polygon = null;
    }

    // Close the info window if it exists
    if (infoWindow) {
        infoWindow.close();
        infoWindow = null;
    }

    console.log('Markers and polygon reset. Click to start a new polygon.');
}
function fetchHikingRouteAndRedirect() {
    const apiUrl = '/api/hiking-route';  // Your API endpoint

    // Optionally show a loading message here
    console.log('Fetching hiking routes...');

    // Send the API request
    fetch(apiUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            userId: userId // Include userId in the request
        })
    })

        .then(response => response.json())  // Parse the response as JSON
        .then(data => {
            // Log the API response for debugging
            console.log("API Response:", data);

            // After receiving and logging the response, redirect to hikingRouteTest.jsp
            window.location.href = '/main/hikingRouteResult';
        })
        .catch(error => {
            console.error('Error fetching hiking routes:', error);
            alert('Failed to fetch hiking routes.');
        });
}

// Function to handle mountain search
function handleMountainSearch() {
    const button = document.getElementById('searchButton');  // Get the search button

    if (!button) {
        console.error('Search button not found!');  // Check if the button exists
        return;
    }

    // Add click event listener to the button
    button.addEventListener('click', function () {
        const mountainName = document.getElementById('mountainName').value;
        console.log('Search button clicked, mountain name:', mountainName);  // Debugging log
        fetchCoordinatesAndMoveMap(mountainName);  // Trigger the mountain search
        fetchMountainData(mountainName);
    });
}

// Function to fetch coordinates and move the map to the location
function fetchCoordinatesAndMoveMap(mountainName) {
    console.log('Starting fetch request for mountain:', mountainName);
    fetch('/api/geocode', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ mountainName: mountainName })
    })
        .then(response => {
            console.log('Fetch completed, response:', response);
            return response.json();
        })
        .then(data => {
            console.log('Parsed data:', data);
            if (data.items && data.items.length > 0) {
                let utmX = data.items[0].mapx;  // UTM-K X coordinate
                let utmY = data.items[0].mapy;  // UTM-K Y coordinate

                console.log(`UTM-K coordinates (mapx, mapy): (${utmX}, ${utmY})`);

                // Convert UTM-K to WGS84 using Naver reverse geocoding API
                convertToWGS84(utmX, utmY);
            } else {
                console.log('No items found in API response.');
                alert('산을 찾을 수 없습니다. 다른 이름을 입력하세요.');
            }
        })
        .catch(error => {
            console.error('Error occurred during fetch:', error);
            alert('네이버 API에서 데이터를 가져오는 중 오류가 발생했습니다.');
        });
}

// Function to convert UTM-K to WGS84 using the backend API
function convertToWGS84(utmX, utmY) {
    // POST the UTM-K coordinates to your backend endpoint
    fetch('/api/reverse-geocode', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            utmX: utmX / 10000000,  // Format the coords as required
            utmY: utmY / 10000000
        })
    })
        .then(response => response.json())
        .then(reverseGeocodeData => {
            if (reverseGeocodeData.longitude && reverseGeocodeData.latitude) {
                console.log(`Converted WGS84 coordinates: (${reverseGeocodeData.latitude}, ${reverseGeocodeData.longitude})`);

                // Move the map to the converted WGS84 coordinates
                moveMapToLocation(reverseGeocodeData.latitude, reverseGeocodeData.longitude);
            } else {
                console.log('No results found for reverse geocoding.');
                alert('Coordinates could not be converted. Please try again.');
            }
        })
        .catch(error => {
            console.error('Error occurred during reverse geocoding:', error);
            alert('Error converting coordinates.');
        });
}

// Function to move the map to the specified coordinates
function moveMapToLocation(lat, lng) {
    console.log(`Attempting to move the map to coordinates: (${lat}, ${lng})`);

    if (map) {
        const newLocation = new naver.maps.LatLng(lat, lng);  // Use WGS84 coordinates for map center
        console.log(`Setting map center to: (${lat}, ${lng})`);

        map.setCenter(newLocation);  // Move the map to the new location
        map.setZoom(12);  // Optionally, zoom in for a closer view

        // Add a marker at the new location
        var marker = new naver.maps.Marker({
            position: newLocation,
            map: map,
            title: 'Mountain Location'
        });
        markers.push(marker);  // Store the new marker

        console.log('Map successfully moved and marker added.');
    } else {
        console.error('Map object is not initialized!');
    }
}
function fetchMountainData(mountainName) {
    console.log('Fetching data for mountain:', mountainName);

    fetch('/api/forestInfo', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ mountainName: mountainName })
    })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            console.log('Received data:', data);

            // Display the received data in the UI
            displayMountainData(data);

            // Move the map to the mountain's coordinates, if provided
            if (data.latitude && data.longitude) {
                moveMapToLocation(data.latitude, data.longitude);
            } else {
                console.log('Coordinates not available in response data.');
            }
        })
        .catch(error => {
            console.error('Error fetching mountain data:', error);
            alert('Mountain data could not be retrieved. Please try again.');
        });
}
function decodeHtml(html) {
    const txt = document.createElement("textarea");
    txt.innerHTML = html;
    return txt.value;
}
function displayMountainData(data) {
    const infoSection = document.getElementById('mountainInfo');


    infoSection.innerHTML = `
         <h3>${decodeHtml(data.mountainName)}</h3>
        <p><strong>위치:</strong> ${decodeHtml(data.location)}</p>
        <p><strong>높이:</strong> ${decodeHtml(data.height)} m</p>


        <div class="tab">
          <ul class="tabnav" style="border:none">
            <li><a href="#tab01" class="active" style="border:none">상세설명</a></li>
            <li><a href="#tab02" style="border:none">관광정보</a></li>
            <li><a href="#tab03" style="border:none">추천등산로</a></li>
            <li><a href="#tab04" style="border:none">교통</a></li>
          </ul>
          <div class="tabcontent" style="border:none overflow-wrap: break-word"">
            <div id="tab01" >
              <p>${decodeHtml(data.description)}</p>
            </div>
            <div id="tab02">
              <p>${decodeHtml(data.touristInfo)}</p>
            </div>
            <div id="tab03">
              <p>${decodeHtml(data.hikingCourses)}</p>
            </div>
            <div id="tab04">
              <p>${decodeHtml(data.transportation)}</p>
            </div>
          </div>
        </div>
    `;
    initializeTabs();
}



// Initialize tabs
function initializeTabs() {
    const tabLinks = document.querySelectorAll('.tabnav a');
    const tabContents = document.querySelectorAll('.tabcontent > div');

    // Ensure all tab contents are hidden initially
    tabContents.forEach(content => content.style.display = 'none');

    // Add click event listeners to tab links
    tabLinks.forEach((link, index) => {
        link.addEventListener('click', function (e) {
            e.preventDefault();

            // Deactivate all links and hide all tab contents
            tabLinks.forEach(link => link.classList.remove('active'));
            tabContents.forEach(content => content.style.display = 'none');

            // Activate the clicked tab and show its content
            link.classList.add('active');
            tabContents[index].style.display = 'block';
        });
    });

    // Activate the first tab by default
    if (tabLinks.length > 0) {
        tabLinks[0].click();
    }
}


// Initialize the map and handle the mountain search logic
document.addEventListener('DOMContentLoaded', function () {
    initMap();  // Initialize the map

    handleMountainSearch();  // Handle mountain search on button click
});