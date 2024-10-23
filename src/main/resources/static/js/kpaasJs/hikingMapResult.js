// Initialize map-related variables
var map = null;
var markers = [];
var polygon = null;
var infoWindow = null;
var centroidMarker = null;
var clickCount = 0;
var points = [];

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

// Initialize the map and handle the mountain search logic
document.addEventListener('DOMContentLoaded', function () {
    initMap();  // Initialize the map
});