<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>실시간 날씨 조회하기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            let lon, lat;

            navigator.geolocation.getCurrentPosition(function (position) {
                lat = position.coords.latitude; // 위도
                lon = position.coords.longitude; // 경도

                $.ajax({
                    url: "${pageContext.request.contextPath}/weather/getWeather",
                    type: "get",
                    dataType: "JSON",
                    data: {
                        "lon": lon,
                        "lat": lat
                    },
                    success: function (json) {
                        $("#currentTemp").append(json.currentTemp);

                        const dailyList = json.dailyList; // List 구조의 일별 날씨 정보

                        for (const daily of dailyList) {
                            let day = daily.day; // 기준 일자
                            let sunrise = daily.sunrise; // 해뜨는 시간
                            let sunset = daily.sunset; // 해지는 시간
                            let moonrise = daily.moonrise; // 달뜨는 시간
                            let moonset = daily.moonset; // 달지는 시간
                            let dayTemp = daily.dayTemp; // 평균 기온
                            let dayTempMax = daily.dayTempMax; // 최고 기온
                            let dayTempMin = daily.dayTempMin; // 최저 기온

                            $("#daily_weather").append("<div class='divTableRow'>");
                            $("#daily_weather").append("<div class='divTableCell'>" + day + " </div>");
                            $("#daily_weather").append("<div class='divTableCell'>" + sunrise + " </div>");
                            $("#daily_weather").append("<div class='divTableCell'>" + sunset + " </div>");
                            $("#daily_weather").append("<div class='divTableCell'>" + moonrise + " </div>");
                            $("#daily_weather").append("<div class='divTableCell'>" + moonset + " </div>");
                            $("#daily_weather").append("<div class='divTableCell'>" + dayTemp + " </div>");
                            $("#daily_weather").append("<div class='divTableCell'>" + dayTempMax + " </div>");
                            $("#daily_weather").append("<div class='divTableCell'>" + dayTempMin + " </div>");
                            $("#daily_weather").append("</div>");
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<h2>오늘의 날씨 실시간 조회</h2>
<hr/>
<br/>
<div class="divTable minimalistBlack">
    <div class="divTableHeading">
        <div class="divTableRow">
            <div class="divTableCell" style="width: 40%">현재 기온</div>
            <div class="divTableCell" style="width: 40%" id="currentTemp"></div>
        </div>
    </div>
</div>
<br/><br/>
<h2>주간 날씨 실시간 조회</h2>
<hr/>
<br/>
<div class="divTable minimalistBlack">
    <div class="divTableHeading">
        <div class="divTableRow">
            <div class="divTableHead">날짜</div>
            <div class="divTableHead">해뜨는 시간</div>
            <div class="divTableHead">해지는 시간</div>
            <div class="divTableHead">달뜨는 시간</div>
            <div class="divTableHead">달지는 시간</div>
            <div class="divTableHead">평균 기온</div>
            <div class="divTableHead">최고 기온</div>
            <div class="divTableHead">최저 기온</div>
        </div>
    </div>
    <div class="divTableBody" id="daily_weather">
        <!-- 날씨 정보가 여기에 추가됩니다. -->
    </div>
</div>
</body>
</html>
