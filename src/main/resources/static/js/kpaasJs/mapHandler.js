
    var map = null;
    var startMarker = null;
    var endMarker = null;
    var giantRectangle = null;
    var clickCount = 0;
    var startPoint = null;
    var endPoint = null;

    function initMap() {
    map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.3595704, 127.105399),
        zoom: 10
    });

    naver.maps.Event.addListener(map, 'click', function (e) {
    var latlng = e.latlng;

    console.log('Map clicked at Lat:', latlng.lat(), 'Lng:', latlng.lng());

    if (clickCount === 0) {
    if (startMarker) startMarker.setMap(null);
    startMarker = new naver.maps.Marker({
    position: latlng,
    map: map,
    title: 'Starting Point'
});
    startPoint = latlng;
    console.log('Starting Point set to:', startPoint.lat(), startPoint.lng());
    clickCount++;
} else if (clickCount === 1) {
    if (endMarker) endMarker.setMap(null);
    endMarker = new naver.maps.Marker({
    position: latlng,
    map: map,
    title: 'Ending Point'
});
    endPoint = latlng;
    console.log('Ending Point set to:', endPoint.lat(), endPoint.lng());

    // Draw the giant rectangle
    if (startPoint && endPoint) {
    drawGiantRectangle(startPoint, endPoint);
}

    clickCount++;
} else {
    resetMap();
}
});
}

    function drawGiantRectangle(start, end) {
    // Calculate the direction vector from start to end
    var dx = end.lng() - start.lng();
    var dy = end.lat() - start.lat();
    var lineLength = Math.sqrt(dx * dx + dy * dy);

    // Calculate the unit vector for the perpendicular direction
    var perpendicularUnitVectorX = -(dy / lineLength);
    var perpendicularUnitVectorY = dx / lineLength;

    // Define the height of the giant rectangle (2 km)
    var halfHeightDegreesLat = (1 / 111); // 1 km up and 1 km down in degrees latitude
    var halfHeightDegreesLng = halfHeightDegreesLat / Math.cos(start.lat() * Math.PI / 180); // Adjust for map scale

    // Calculate the four corners of the giant rectangle
    var corner1 = new naver.maps.LatLng(
    start.lat() + halfHeightDegreesLat * perpendicularUnitVectorY,
    start.lng() + halfHeightDegreesLng * perpendicularUnitVectorX
    );
    var corner2 = new naver.maps.LatLng(
    start.lat() - halfHeightDegreesLat * perpendicularUnitVectorY,
    start.lng() - halfHeightDegreesLng * perpendicularUnitVectorX
    );
    var corner3 = new naver.maps.LatLng(
    end.lat() - halfHeightDegreesLat * perpendicularUnitVectorY,
    end.lng() - halfHeightDegreesLng * perpendicularUnitVectorX
    );
    var corner4 = new naver.maps.LatLng(
    end.lat() + halfHeightDegreesLat * perpendicularUnitVectorY,
    end.lng() + halfHeightDegreesLng * perpendicularUnitVectorX
    );

    // Log the individual corners to verify their values
    console.log('Corner 1:', corner1.lat(), corner1.lng());
    console.log('Corner 2:', corner2.lat(), corner2.lng());
    console.log('Corner 3:', corner3.lat(), corner3.lng());
    console.log('Corner 4:', corner4.lat(), corner4.lng());

    // Draw the giant rectangle on the map
    giantRectangle = new naver.maps.Polygon({
    map: map,
    paths: [corner1, corner2, corner3, corner4, corner1],
    fillColor: '#00FF00',
    fillOpacity: 0.4,
    strokeColor: '#00FF00',
    strokeWeight: 2
});

    // Explicitly convert the coordinates to numbers before calculating the bounding box
    var minLat = Math.min(Number(corner1.lat()), Number(corner2.lat()), Number(corner3.lat()), Number(corner4.lat()));
    var minLng = Math.min(Number(corner1.lng()), Number(corner2.lng()), Number(corner3.lng()), Number(corner4.lng()));
    var maxLat = Math.max(Number(corner1.lat()), Number(corner2.lat()), Number(corner3.lat()), Number(corner4.lat()));
    var maxLng = Math.max(Number(corner1.lng()), Number(corner2.lng()), Number(corner3.lng()), Number(corner4.lng()));

    // Log the calculated values before creating the bounding box
    console.log(`minLat: ${minLat}, minLng: ${minLng}, maxLat: ${maxLat}, maxLng: ${maxLng}`);

    // Log the bounding box coordinates in BOX(minx, miny, maxx, maxy) format
    if (!isNaN(minLat) && !isNaN(minLng) && !isNaN(maxLat) && !isNaN(maxLng)) {
    console.log(`BOX(${minLng}, ${minLat}, ${maxLng}, ${maxLat})`);
} else {
    console.error("Error: Invalid coordinates for bounding box.");
}
}

    function resetMap() {
    clickCount = 0;
    if (startMarker) startMarker.setMap(null);
    if (endMarker) endMarker.setMap(null);
    if (giantRectangle) giantRectangle.setMap(null);
    startPoint = null;
    endPoint = null;
    console.log('Markers and rectangle reset. Click to set a new starting point.');
}
