<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Display Points</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Polygon Points</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Point Type</th>
            <th>Latitude</th>
            <th>Longitude</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>First Point</td>
            <td>${points.firstPointLat}</td>
            <td>${points.firstPointLng}</td>
        </tr>
        <tr>
            <td>Second Point</td>
            <td>${points.secondPointLat}</td>
            <td>${points.secondPointLng}</td>
        </tr>
        <tr>
            <td>Third Point</td>
            <td>${points.thirdPointLat}</td>
            <td>${points.thirdPointLng}</td>
        </tr>
        <tr>
            <td>Fourth Point</td>
            <td>${points.fourthPointLat}</td>
            <td>${points.fourthPointLng}</td>
        </tr>
        <tr>
            <td>Centroid</td>
            <td>${points.centroidLat}</td>
            <td>${points.centroidLng}</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
