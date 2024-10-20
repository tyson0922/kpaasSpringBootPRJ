var map = null;
var markers = [];
var polygon = null;
var infoWindow = null; // Store the info window reference
var centroidMarker = null; // Store the centroid marker reference
var clickCount = 0;
var points = [];

function initMap() {
    map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.3595704, 127.105399),
        zoom: 13, // Initial zoom level
        minZoom: 13 // Set the minimum zoom level here
    });

    naver.maps.Event.addListener(map, 'click', function (e) {
        var latlng = e.latlng;

        const pointNumber = ['First', 'Second', 'Third', 'Fourth']; // Labels for the points
        console.log(`${pointNumber[clickCount]} point set at Lat: ${latlng.lat()}, Lng: ${latlng.lng()}`);

        if (clickCount < 4) {
            // Add the clicked point to the list of points
            points.push(latlng);
            clickCount++;

            // Add a marker at the clicked location
            var marker = new naver.maps.Marker({
                position: latlng,
                map: map,
                title: `Point ${String.fromCharCode(64 + clickCount)}`
            });
            markers.push(marker);

            // Draw the polygon or connecting lines dynamically
            drawPolygonOrLines();

            // If four points have been clicked, calculate and display the area
            if (clickCount === 4) {
                displayPolygonArea();
                calculateCentroid(); // Calculate and display the centroid
                savePointsToDatabase(); // Save the points and centroid to the database
            }
        } else {
            // If the fifth click, reset the map and allow starting a new polygon
            resetMap();
        }
    });
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
        alert(`Warning: The polygon area is too large! The area is approximately ${areaInSquareKilometers.toFixed(2)} square kilometers, which exceeds the 30 square kilometer limit.`);
    }

    console.log(`Area calculated: 면적: ${areaInSquareKilometers.toFixed(2)} km^2`);

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
        }
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