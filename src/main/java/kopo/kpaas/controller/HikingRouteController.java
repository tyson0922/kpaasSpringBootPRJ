package kopo.kpaas.controller;

import kopo.kpaas.service.impl.HikingRouteService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequiredArgsConstructor
public class HikingRouteController {

    private final HikingRouteService hikingRouteService;

    @PostMapping("/api/hiking-route")
    public ResponseEntity<Map<String, Object>> getHikingRoutes() {
        try {
            // Call your service method to get and save the hiking routes
            Map<String, Object> response = hikingRouteService.getAndSaveHikingRoutes();
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            // Handle any errors
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}
