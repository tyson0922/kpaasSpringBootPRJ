package kopo.kpaas.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.dto.RoutePropertiesDTO;
import kopo.kpaas.mapper.HikingRouteMapper;
import kopo.kpaas.service.IHikingRouteService;
import kopo.kpaas.util.NetworkUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class HikingRouteService implements IHikingRouteService {

    @Value("${hiking.api.key}")
    private String apiKey;

    @Value("${hiking.api.domain}")
    private String apiDomain;

    private final HikingRouteMapper hikingRouteMapper;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public Map<String, Object> getAndSaveHikingRoutes(String userId) {
        PolygonPointsDTO polygonPoints = hikingRouteMapper.getPolygonPoints(userId);
        String geomFilter = formatPointsAsPolygon(polygonPoints);

        log.info("Formatted POLYGON: {}", geomFilter);

        int currentPage = 1;
        Map<String, Object> lastResponseMap = null;
        // Delete existing route data for the user before inserting new data
        hikingRouteMapper.deleteRoutesByUserId(userId);

        while (true) {
            String apiUrl = buildApiUrl(geomFilter, currentPage);
            log.info("API URL for page {}: {}", currentPage, apiUrl);

            try {
                String jsonResponse = NetworkUtil.get(apiUrl);
//                log.info("Raw API Response for page {}: {}", currentPage, jsonResponse);

                if (jsonResponse.startsWith("<html>")) {
                    log.error("Received an error response from the API: {}", jsonResponse);
                    throw new RuntimeException("Error from API: " + jsonResponse);
                }

                // Parse the JSON response
                Map<String, Object> responseMap = objectMapper.readValue(jsonResponse, new TypeReference<>() {});
                lastResponseMap = responseMap;

                // Safely access nested "page" object
                Map<String, Object> response = (Map<String, Object>) responseMap.get("response");
                if (response == null) {
                    throw new RuntimeException("Response object is missing in API response.");
                }
                Map<String, Object> pageInfo = (Map<String, Object>) response.get("page");

                if (pageInfo == null) {
                    log.error("No pagination information found in API response.");
                    throw new RuntimeException("Pagination data is missing from API response.");
                }

                int totalPages = Integer.parseInt(pageInfo.getOrDefault("total", "1").toString());
                int currentPageFromResponse = Integer.parseInt(pageInfo.getOrDefault("current", "1").toString());

                // Save data for the current page
                saveParsedData(jsonResponse, userId, currentPage);

                // Break loop if last page is reached
                if (currentPage >= totalPages) {
                    break;
                }
                currentPage++; // Move to the next page

            } catch (Exception e) {
                log.error("Error fetching hiking routes for page {}: ", currentPage, e);
                throw new RuntimeException("Failed to fetch hiking routes.");
            }
        }
        return lastResponseMap;
    }




    // Method to save parsed data
    public void saveParsedData(String apiResponse, String userId, int page) throws IOException {
        // Parse the API response
        JsonNode root = objectMapper.readTree(apiResponse);
        JsonNode features = root.path("response").path("result").path("featureCollection").path("features");

//        // Delete existing route data for the user before inserting new data
//        hikingRouteMapper.deleteRoutesByUserId(userId);

        // Loop through each feature (hiking route) and save them
        for (JsonNode feature : features) {
            String routeId = feature.path("id").asText();
            String secLen = feature.path("properties").path("sec_len").asText();
            String upMin = feature.path("properties").path("up_min").asText();
            String downMin = feature.path("properties").path("down_min").asText();
            String catNam = feature.path("properties").path("cat_nam").asText();
            String mntnNm = feature.path("properties").path("mntn_nm").asText();

            // Format the MultiLineString for geometry
            JsonNode coordinates = feature.path("geometry").path("coordinates");
            String geometry = formatMultiLineString(coordinates);

            // Log the parsed route properties
            log.info("Saving route: ROUTE_ID = {}, User ID = {}, sec_len = {}, up_min = {}, down_min = {}, cat_nam = {}, mntn_nm = {}, page = {}",
                    routeId, userId, secLen, upMin, downMin, catNam, mntnNm, page);

            // Create DTO and insert new route properties for the user, including page
            RoutePropertiesDTO routeProperties = new RoutePropertiesDTO(userId, routeId, secLen, upMin, downMin, catNam, mntnNm, geometry);
            routeProperties.setPage(page);  // Set the current page number in the DTO
            hikingRouteMapper.insertRouteProperties(routeProperties);
        }
    }






    // Method to format points into POLYGON format
    private String formatPointsAsPolygon(PolygonPointsDTO polygonPoints) {
        return String.format("POLYGON((%f %f, %f %f, %f %f, %f %f, %f %f))",
                polygonPoints.getFirstPointLng(), polygonPoints.getFirstPointLat(),
                polygonPoints.getSecondPointLng(), polygonPoints.getSecondPointLat(),
                polygonPoints.getThirdPointLng(), polygonPoints.getThirdPointLat(),
                polygonPoints.getFourthPointLng(), polygonPoints.getFourthPointLat(),
                polygonPoints.getFirstPointLng(), polygonPoints.getFirstPointLat() // Closing the polygon
        );
    }

    private String buildApiUrl(String geomFilter, int page) {
        try {
            // Encode the dynamically generated polygon
            geomFilter = URLEncoder.encode(geomFilter, StandardCharsets.UTF_8.toString());
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("Error encoding polygon", e);
        }

        return "https://api.vworld.kr/req/data?"
                + "service=data"
                + "&version=2.0"
                + "&request=GetFeature"
                + "&format=json"
                + "&errorformat=json"
                + "&data=LT_L_FRSTCLIMB"
                + "&geomfilter=" + geomFilter
                + "&columns=sec_len,up_min,down_min,cat_nam,mntn_nm,ag_geom"
                + "&geometry=true"
                + "&attribute=true"
                + "&crs=EPSG:4326"
                + "&domain=" + apiDomain
                + "&key=" + apiKey
                + "&page=" + page;  // Add the page parameter
    }
    private String formatMultiLineString(JsonNode coordinates) {
        StringBuilder multiLineStringBuilder = new StringBuilder();
        multiLineStringBuilder.append("MULTILINESTRING(");

        for (JsonNode line : coordinates) {
            multiLineStringBuilder.append("(");
            for (JsonNode point : line) {
                multiLineStringBuilder.append(point.get(0).asText())
                        .append(" ")
                        .append(point.get(1).asText())
                        .append(", ");
            }
            // Remove the last comma and space
            multiLineStringBuilder.setLength(multiLineStringBuilder.length() - 2);
            multiLineStringBuilder.append("), ");
        }
        // Remove the last comma and space
        multiLineStringBuilder.setLength(multiLineStringBuilder.length() - 2);
        multiLineStringBuilder.append(")");

        return multiLineStringBuilder.toString();
    }

    @Override
    public List<RoutePropertiesDTO> getHikingRoutesByUserId(String userId) {
        log.info("Retrieving hiking routes for userId: {}", userId);
        return hikingRouteMapper.findRoutesByUserId(userId);
    }
}
