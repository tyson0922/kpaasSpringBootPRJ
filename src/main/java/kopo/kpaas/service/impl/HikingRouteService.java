package kopo.kpaas.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.mapper.HikingRouteMapper;
import kopo.kpaas.service.IHikingRouteService;
import kopo.kpaas.util.NetworkUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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
    public Map<String, Object> getAndSaveHikingRoutes() {
        // Step 1: Retrieve the polygon points from the database
        PolygonPointsDTO polygonPoints = hikingRouteMapper.getPolygonPoints();

        // Step 2: Format the points into POLYGON format
        String geomFilter = formatPointsAsPolygon(polygonPoints);  // Ensure geomFilter is created

        // Log the POLYGON format to verify it's correct
        log.info("Formatted POLYGON: {}", geomFilter);

        // Step 3: Use the POLYGON string in the API call
        String apiUrl = buildApiUrl(geomFilter);  // Pass geomFilter to the buildApiUrl method

        // **Log the full API URL** for debugging
        log.info("Full API URL: {}", apiUrl);

        try {
            // Fetch data from the API using the formatted POLYGON
            String jsonResponse = NetworkUtil.get(apiUrl);

            // Log the raw JSON response for inspection
            log.info("Raw API Response: {}", jsonResponse);

            // Check if the response is HTML (error page) instead of JSON
            if (jsonResponse.startsWith("<html>")) {
                log.error("Received an error response from the API: {}", jsonResponse);
                throw new RuntimeException("Error from API: " + jsonResponse);
            }

            // Parse the JSON response using ObjectMapper
            Map<String, Object> responseMap = objectMapper.readValue(jsonResponse, new TypeReference<>() {
            });
            return responseMap;

        } catch (Exception e) {
            log.error("Error fetching hiking routes: ", e);
            throw new RuntimeException("Failed to fetch hiking routes.");
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

    private String buildApiUrl(String geomFilter) {
        String hardcodedPolygon = "POLYGON((127.023087 37.359161, 127.000943 37.333505, 127.034932 37.316988, 127.057935 37.332413, 127.023087 37.359161))";
        try {
            hardcodedPolygon = URLEncoder.encode(hardcodedPolygon, StandardCharsets.UTF_8.toString());
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
                + "&geomfilter=" + hardcodedPolygon
                + "&columns=sec_len,up_min,down_min,cat_nam,mntn_nm,ag_geom"
                + "&geometry=true"
                + "&attribute=true"
                + "&crs=EPSG:4326"
                + "&domain=" + apiDomain
                + "&key=" + apiKey;
    }
}
