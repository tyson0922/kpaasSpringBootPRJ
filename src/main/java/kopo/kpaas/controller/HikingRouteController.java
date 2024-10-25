package kopo.kpaas.controller;

import jakarta.servlet.http.HttpSession;
import kopo.kpaas.mapper.HikingRouteMapper;
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
    public ResponseEntity<Map<String, Object>> getHikingRoutes(HttpSession session) {
        try {
            // Retrieve userId from session
            String userId = (String) session.getAttribute("SS_USER_ID");

            // If userId is not present in the session, return Unauthorized response
            if (userId == null) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
            }

            // Call your service method to get and save the hiking routes, passing userId
            Map<String, Object> response = hikingRouteService.getAndSaveHikingRoutes(userId);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            // Handle any errors
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}
