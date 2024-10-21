package kopo.kpaas.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.kpaas.dto.MountainNameDTO;
import kopo.kpaas.dto.ReverseGeocodeDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api")
public class NaverGeocodingController {

    @Value("${naver.api.search.client.id}")
    private String naverApiSearchClientId;

    @Value("${naver.api.search.client.secret}")
    private String naverApiSearchClientSecret;

    @Value("${naver.api.client.key}")
    private String naverApiClientKey;

    @Value("${naver.api.client.secret}")
    private String naverApiClientSecret;

    private final String NAVER_PLACE_SEARCH_API_URL = "https://openapi.naver.com/v1/search/local.json?query=";
    private final String NAVER_REVERSE_GEOCODE_API_URL = "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=";

    // For mountain name search
    @PostMapping("/geocode")
    public String getCoordinates(@RequestBody MountainNameDTO mountainNameDTO) {
        String mountainName = mountainNameDTO.getMountainName();
        log.info("Received request to search for mountain: {}", mountainName);

        try {
            // Use the raw mountain name directly without encoding
            String apiUrl = NAVER_PLACE_SEARCH_API_URL + mountainName + "&display=1&sort=sim";
            log.info("Final API URL (without encoding): {}", apiUrl);

            RestTemplate restTemplate = new RestTemplate();

            // Set up headers for the API keys
            HttpHeaders headers = new HttpHeaders();
            headers.set("X-Naver-Client-Id", naverApiSearchClientId);
            headers.set("X-Naver-Client-Secret", naverApiSearchClientSecret);
            headers.set("Accept", "application/json");

            HttpEntity<String> entity = new HttpEntity<>(headers);
            log.info("Request headers: {}", headers);

            // Make the API call and get the response
            ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

            log.info("API Response Status Code: {}", response.getStatusCode());
            log.info("API Response Body: {}", response.getBody());

            return response.getBody();

        } catch (Exception e) {
            log.error("Error occurred while calling Naver API: {}", e.getMessage());
            log.debug("Stack trace: ", e);
            return "{\"error\": \"Error occurred: " + e.getMessage() + "\"}";
        }
    }

    // For reverse geocoding UTM-K to WGS84
    @PostMapping("/reverse-geocode")
    public ReverseGeocodeDTO reverseGeocode(@RequestBody Map<String, String> coords) {
        String utmX = coords.get("utmX");
        String utmY = coords.get("utmY");
        log.info("Received request for reverse geocoding, UTM-K coordinates: ({}, {})", utmX, utmY);

        try {
            // Format the URL for reverse geocoding
            String apiUrl = NAVER_REVERSE_GEOCODE_API_URL + utmX + "," + utmY + "&output=json";
            log.info("Reverse geocoding API URL: {}", apiUrl);

            RestTemplate restTemplate = new RestTemplate();

            // Set up headers for the reverse geocoding API keys
            HttpHeaders headers = new HttpHeaders();
            headers.set("X-NCP-APIGW-API-KEY-ID", naverApiClientKey);  // Correct key
            headers.set("X-NCP-APIGW-API-KEY", naverApiClientSecret);  // Correct secret
            headers.set("Accept", "application/json");

            HttpEntity<String> entity = new HttpEntity<>(headers);

            // Make the API call
            ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

            log.info("Reverse geocoding API Response Status Code: {}", response.getStatusCode());
            log.info("Reverse geocoding API Response Body: {}", response.getBody());

            // Parse JSON response and extract WGS84 coordinates
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode root = objectMapper.readTree(response.getBody());
            JsonNode results = root.path("results");

            if (results.isArray() && results.size() > 0) {
                JsonNode region = results.get(0).path("region");

                // Try to get coordinates from area3 or area2 as they seem to have valid coordinates
                JsonNode area3 = region.path("area3").path("coords").path("center");
                JsonNode area2 = region.path("area2").path("coords").path("center");

                // Check if area3 or area2 contains valid coordinates
                String longitude = area3.has("x") ? area3.get("x").asText() : area2.get("x").asText();
                String latitude = area3.has("y") ? area3.get("y").asText() : area2.get("y").asText();

                // Log extracted coordinates
                log.info("Extracted coordinates - Longitude: {}, Latitude: {}", longitude, latitude);

                // Create and return the DTO
                return new ReverseGeocodeDTO(longitude, latitude);
            } else {
                throw new Exception("No results found for reverse geocoding.");
            }

        } catch (Exception e) {
            log.error("Error occurred during reverse geocoding: {}", e.getMessage());
            log.debug("Stack trace: ", e);
            return new ReverseGeocodeDTO("Error", "Error");
        }
    }
}

