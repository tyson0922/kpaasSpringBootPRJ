package kopo.kpaas.controller;

import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.service.IPointService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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

    @PostMapping("/savePoints")
    public ResponseEntity<Map<String, String>> savePoints(@RequestBody PolygonPointsDTO points) {
        pointService.savePoints(points);
        Map<String, String> response = new HashMap<>();
        response.put("message", "Points saved successfully");
        return ResponseEntity.ok(response);
    }

    @GetMapping(value = "displayPoints")
    public String pointDisplay(Model model) {
        log.info(this.getClass().getName() + ".main/displayPoints");

        PolygonPointsDTO points = pointService.getPoints(); // Fetch the points data from the service
        model.addAttribute("points", points); // Add the points data to the model

        return "hiking/displayPoints"; // Ensure this matches the JSP file location
    }

}
