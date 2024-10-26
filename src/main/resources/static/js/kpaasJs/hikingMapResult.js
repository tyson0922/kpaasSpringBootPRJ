console.log("hikingMapResult.js loaded successfully");

// Wrapper for initializing after window load
window.onload = function () {
    console.log("Window onload event fired in hikingMapResult.js.");
    initMapWithRetry();
};

// Define initMapWithRetry at the top level of hikingMapResult.js
function initMapWithRetry(retries = 5) {
    if (typeof polygonPoints !== 'undefined' && polygonPoints) {
        console.log("Polygon points available. Initializing map with data:", polygonPoints);

        const points = [
            new naver.maps.LatLng(polygonPoints.firstPointLat, polygonPoints.firstPointLng),
            new naver.maps.LatLng(polygonPoints.secondPointLat, polygonPoints.secondPointLng),
            new naver.maps.LatLng(polygonPoints.thirdPointLat, polygonPoints.thirdPointLng),
            new naver.maps.LatLng(polygonPoints.fourthPointLat, polygonPoints.fourthPointLng)
        ];

        initMapWithPolygon(polygonPoints.centroidLat, polygonPoints.centroidLng, points);
    } else if (retries > 0) {
        console.log("Polygon points not available yet. Retrying...");
        setTimeout(() => initMapWithRetry(retries - 1), 500);
    } else {
        console.error("Polygon points data not available after retries.");
    }
}

// Initialize map and set polygon from provided points
function initMapWithPolygon(centroidLat, centroidLng, points) {
    const map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(centroidLat, centroidLng),
        zoom: 13,
        minZoom: 13
    });

    drawPolygonFromPoints(points, centroidLat, centroidLng);
}

// Draw the polygon from points and add the centroid button
function drawPolygonFromPoints(points, centroidLat, centroidLng) {
    const polygon = new naver.maps.Polygon({
        map: map,
        paths: points,
        fillColor: '#00FF00',
        fillOpacity: 0.4,
        strokeColor: '#00FF00',
        strokeWeight: 2
    });


    const centroidMarker = new naver.maps.Marker({
        position: new naver.maps.LatLng(centroidLat, centroidLng),
        map: map,
        icon: {
            content: buttonElement,
            anchor: new naver.maps.Point(12, 12)
        }
    });
}
