package kopo.kpaas.controller;

import jakarta.servlet.http.HttpSession;
import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.service.IPointService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/api")
@RequiredArgsConstructor
public class PointController {

    private final IPointService pointService;

    // Save points for the logged-in user
    @PostMapping("/savePoints")
    public ResponseEntity<Map<String, String>> savePoints(HttpSession session, @RequestBody PolygonPointsDTO points) {
        // Get the userId from the session
        String userId = (String) session.getAttribute("SS_USER_ID");

        if (userId == null) {
            // If the user is not logged in, return an error response
            Map<String, String> response = new HashMap<>();
            response.put("error", "User is not logged in");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }

        // Set the userId in the PolygonPointsDTO
        points.setUserId(userId);

        // Save the points using the service
        pointService.savePoints(points);

        // Success response
        Map<String, String> response = new HashMap<>();
        response.put("message", "Points saved successfully");
        return ResponseEntity.ok(response);
    }

    // Display points for the logged-in user
    @GetMapping("/displayPoints")
    public String pointDisplay(HttpSession session, Model model) {
        log.info(this.getClass().getName() + ".main/displayPoints");

        // Get the userId from the session
        String userId = (String) session.getAttribute("SS_USER_ID");

        if (userId == null) {
            // Redirect to login if the user is not logged in
            return "redirect:/login";
        }

        // Fetch the points data for the user
        PolygonPointsDTO points = pointService.getPoints(userId);

        // Add the points data to the model
        model.addAttribute("points", points);

        // Return the view
        return "hiking/displayPoints"; // Ensure this matches the JSP file location
    }

}