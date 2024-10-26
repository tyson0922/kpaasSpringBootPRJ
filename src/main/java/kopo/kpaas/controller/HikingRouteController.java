package kopo.kpaas.controller;

import jakarta.servlet.http.HttpSession;
import kopo.kpaas.mapper.HikingRouteMapper;
import kopo.kpaas.service.impl.HikingRouteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
public class HikingRouteController {

    private final HikingRouteService hikingRouteService;

    @PostMapping("/api/hiking-route")
    public ResponseEntity<Map<String, Object>> getHikingRoutes(HttpSession session) {
        log.info("Entering getHikingRoutes in HikingRouteController");  // Log entry point
        try {
            // Retrieve userId from session
            String userId = (String) session.getAttribute("SS_USER_ID");

            // Log the retrieved userId
            log.info("User ID retrieved from session: {}", userId);

            // If userId is not present in the session, return Unauthorized response
            if (userId == null) {
                log.warn("User ID not found in session; returning UNAUTHORIZED status.");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
            }

            // Call your service method to get and save the hiking routes, passing userId
            log.info("Calling hikingRouteService.getAndSaveHikingRoutes for userId: {}", userId);
            Map<String, Object> response = hikingRouteService.getAndSaveHikingRoutes(userId);

            log.info("Hiking routes successfully fetched and saved for userId: {}", userId);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            // Handle any errors
            log.error("Error occurred in getHikingRoutes: ", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

}
