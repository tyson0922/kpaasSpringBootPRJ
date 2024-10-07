package kopo.kpaas.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class NaverMapController {

    @Value("${naver.api.client.key}")
    private String naverApiClientKey;

    private final RestTemplate restTemplate = new RestTemplate();

    @GetMapping("/reverseGeocode")
    public ResponseEntity<String> reverseGeocode(@RequestParam("lat") double lat, @RequestParam("lng") double lng) {
        String url = "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=" + lng + "," + lat + "&output=json&orders=addr";

        HttpHeaders headers = new HttpHeaders();
        headers.set("X-NCP-APIGW-API-KEY-ID", naverApiClientKey);

        HttpEntity<String> entity = new HttpEntity<>(headers);
        return restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
    }
}
