package kopo.kpaas.controller;

import kopo.kpaas.dto.ForestApiResponseDTO;
import kopo.kpaas.dto.MountainNameDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api")
public class ForestApiController {

    @Value("${forest.api.key}")
    private String forestApiKey;

    private final String FOREST_API_URL = "http://api.forest.go.kr/openapi/service/trailInfoService/getforeststoryservice";

    @PostMapping("/forestInfo")
    public ForestApiResponseDTO getMountainData(@RequestBody MountainNameDTO mountainNameDTO) {
        String mountainName = mountainNameDTO.getMountainName();
        log.info("Received request to search for mountain: {}", mountainName);

        ForestApiResponseDTO forestApiResponse = new ForestApiResponseDTO();

        try {
            // Construct the API URL
            String apiUrl = FOREST_API_URL + "?serviceKey=" + forestApiKey +
                    "&mntnNm=" + mountainName +
                    "&pageNo=1&numOfRows=10";

            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.set("Accept", "application/json");
            HttpEntity<String> entity = new HttpEntity<>(headers);

            log.info("Sending request to Forest API at URL: {}", apiUrl);

            // Make the API call and parse the response
            ResponseEntity<Map<String, Object>> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, new ParameterizedTypeReference<>() {});
            log.info("Received response from Forest API: {}", response.getBody());

            Map<String, Object> responseBody = response.getBody();
            if (responseBody != null && responseBody.containsKey("response")) {
                Map<String, Object> responseContent = (Map<String, Object>) responseBody.get("response");
                Map<String, Object> header = (Map<String, Object>) responseContent.get("header");

                // Log and verify response status
                if (header != null) {
                    log.info("Forest API Response Header: resultCode={}, resultMsg={}", header.get("resultCode"), header.get("resultMsg"));
                }

                Map<String, Object> body = (Map<String, Object>) responseContent.get("body");
                if (body != null) {
                    Map<String, Object> items = (Map<String, Object>) body.get("items");
                    if (items != null) {
                        Object itemObject = items.get("item");

                        if (itemObject instanceof List) {
                            List<Map<String, Object>> itemList = (List<Map<String, Object>>) itemObject;
                            if (!itemList.isEmpty()) {
                                forestApiResponse = mapItemToDto(itemList.get(0));
                            }
                        } else if (itemObject instanceof Map) {
                            Map<String, Object> item = (Map<String, Object>) itemObject;
                            forestApiResponse = mapItemToDto(item);
                        } else {
                            log.warn("Unexpected item structure in the Forest API response.");
                        }
                    }
                }
            }

        } catch (Exception e) {
            log.error("Error occurred while calling Forest API: {}", e.getMessage(), e);
            forestApiResponse.setDescription("Error occurred: " + e.getMessage());
        }

        return forestApiResponse;
    }

    // Helper method to safely parse and map item to ForestApiResponseDTO
    private ForestApiResponseDTO mapItemToDto(Map<String, Object> item) {
        ForestApiResponseDTO dto = new ForestApiResponseDTO();
        dto.setMountainName((String) item.get("mntnnm"));
        dto.setLocation((String) item.get("mntninfopoflc"));
        dto.setHeight(parseAsDouble(item.get("mntninfohght")));
        dto.setDescription((String) item.get("mntninfodscrt"));
        dto.setTouristInfo((String) item.get("crcmrsghtnginfodscrt"));
        dto.setHikingCourses((String) item.get("crcmrsghtnginfoetcdscrt"));
        dto.setTransportation((String) item.get("pbtrninfodscrt"));
        dto.setImage((String) item.getOrDefault("mntnattchimageseq", item.get("hndfmsmtnmapimageseq")));

        log.info("Mapped response to ForestApiResponseDTO: {}", dto);
        return dto;
    }

    // Helper method to safely parse height as Double
    private Double parseAsDouble(Object height) {
        if (height instanceof Integer) {
            return ((Integer) height).doubleValue();
        } else if (height instanceof String) {
            try {
                return Double.parseDouble((String) height);
            } catch (NumberFormatException e) {
                log.warn("Failed to parse height as Double: {}", height);
            }
        }
        return null;  // return null if parsing fails
    }
}
