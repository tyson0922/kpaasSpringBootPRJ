// Initialize map-related variables
var map = null;
var markers = [];
var polygon = null;
var infoWindow = null;
var centroidMarker = null;
var clickCount = 0;
var points = [];
const userId = "${userId}";

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
    if (points.length < 4) return; // Ensure we have a complete polygon

    // Calculate the area of the polygon using the Shoelace formula
    let area = 0;
    for (let i = 0; i < points.length - 1; i++) {
        area += points[i].lng() * points[i + 1].lat() - points[i + 1].lng() * points[i].lat();
    }
    area += points[points.length - 1].lng() * points[0].lat() - points[0].lng() * points[points.length - 1].lat(); // Close the polygon
    area = Math.abs(area / 2);

    // Convert area from degrees to square meters (approximate conversion)
    const conversionFactor = 111000 * 111000; // Approximate meters per degree squared at the equator
    const areaInSquareMeters = area * conversionFactor;
    const areaInSquareKilometers = areaInSquareMeters / 1_000_000; // Convert to square kilometers

    // Alert the user if the area exceeds 30 square kilometers
    if (areaInSquareKilometers > 30) {
        alert(`선택된 영역이 넓어서 부정확한 결과가 나올 수 있습니다. 면적이 ${areaInSquareKilometers.toFixed(2)}km²로, 30km² 제한을 초과합니다`);
    }

    console.log(`면적: ${areaInSquareKilometers.toFixed(2)}km²`);

    // Display the area on the map as an overlay or info window with the new label format
    infoWindow = new naver.maps.InfoWindow({
        content: `<div style="padding:5px;">면적: ${areaInSquareKilometers.toFixed(2)} km^2</div>`,
        position: points[points.length - 1], // Position the info window at the last point
        borderWidth: 2,
        borderColor: '#00FF00'
    });

    infoWindow.open(map);
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
            window.location.href = '/main/hikingRouteTest';
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

// Initialize the map and handle the mountain search logic
document.addEventListener('DOMContentLoaded', function () {
    initMap();  // Initialize the map
    handleMountainSearch();  // Handle mountain search on button click
});