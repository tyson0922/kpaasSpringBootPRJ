package kopo.kpaas.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import jakarta.servlet.http.HttpSession;
import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.dto.RoutePropertiesDTO;
import kopo.kpaas.dto.UserInfoDTO;
import kopo.kpaas.mapper.HikingRouteMapper;
import kopo.kpaas.service.IHikingRouteService;
import kopo.kpaas.service.IPointService;
import kopo.kpaas.service.IUserInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping(value = "/main")
@RequiredArgsConstructor
@Controller
public class MainController {

    private final IUserInfoService userInfoService;
    private final IHikingRouteService hikingRouteService;  // Inject your service
    @GetMapping(value = "mainPage")
    public String mainPage() {
        log.info(this.getClass().getName() + ".main/mainPage");

        return "main/mainPage";
    }
    @GetMapping(value = "hikingInfo")
    public String hikingInfo() {
        log.info(this.getClass().getName() + ".main/hikingInfo");

        return "main/hikingInfo";
    }
    @GetMapping(value = "injuryDetection")
    public String injuryDetection(HttpSession session, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".main/injuryDetection Start!");

        // Check if session is null or if userId is present
        if (session == null) {
            log.error("Session is null. Redirecting to login page.");
            return "redirect:/user/sign-in";  // Redirect to login if session is null
        }

        // Get userId from session
        String userId = (String) session.getAttribute("SS_USER_ID");
        log.info("Session attribute SS_USER_ID: {}", userId);

        if (userId == null) {
            log.warn("No userId found in session. Redirecting to login page.");
            return "redirect:/user/sign-in";  // Redirect to login if not logged in
        }

        // Pass userId and userName to the frontend
        model.addAttribute("userId", userId);
        model.addAttribute("userName", session.getAttribute("SS_USER_NAME"));

        log.info("UserId and userName added to the model. Rendering injuryDetection page.");

        return "main/injuryDetection";
    }


    @Value("${naver.api.client.key}")
    private String naverApiClientKey;

    @Value("${naver.api.client.secret}")
    private String naverClientSecret;
    @GetMapping(value="hikingMap")
    public String hikingMap(HttpSession session, Model model) {
        log.info(this.getClass().getName() + ".main/hikingMap");

        // Retrieve userId and userName from the session
        String userId = (String) session.getAttribute("SS_USER_ID");
        String userName = (String) session.getAttribute("SS_USER_NAME");

        if (userId == null) {
            // Redirect to login if user is not logged in
            return "redirect:/user/sign-in";
        }

        // Inject the naverApiClientKey, userId, and userName into the model
        model.addAttribute("naverApiClientKey", naverApiClientKey);
        model.addAttribute("userId", userId);
        model.addAttribute("userName", userName);

        return "main/hikingMap"; // Make sure this matches the correct JSP view
    }
    private final HikingRouteMapper hikingRouteMapper;
    // New method to handle the hikingRouteTest.jsp

    @GetMapping(value = "hikingRouteTest")
    public String hikingRouteTest(Model model, HttpSession session) {
        log.info(this.getClass().getName() + ".main/hikingRouteTest");

        // Retrieve userId from session
        String userId = (String) session.getAttribute("SS_USER_ID");

        // Redirect to login if user is not logged in
        if (userId == null) {
            return "redirect:/user/sign-in";
        }

        // Retrieve saved hiking route data without re-fetching and saving
        List<RoutePropertiesDTO> hikingRoutes = hikingRouteService.getHikingRoutesByUserId(userId);

        // Try serializing hikingRoutes to JSON for the frontend
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.registerModule(new JavaTimeModule());

            String hikingRouteDataJson = objectMapper.writeValueAsString(hikingRoutes);
            model.addAttribute("hikingRouteDataJson", hikingRouteDataJson);
        } catch (JsonProcessingException e) {
            log.error("Error serializing hiking routes to JSON", e);
            model.addAttribute("hikingRouteDataJson", "[]"); // Fallback to an empty JSON array
        }

        model.addAttribute("naverApiClientKey", naverApiClientKey);
        model.addAttribute("naverClientSecret", naverClientSecret);

        // Add polygon points data for use in the frontend
        PolygonPointsDTO polygonPoints = hikingRouteMapper.getPolygonPoints(userId);
        model.addAttribute("polygonPoints", polygonPoints);

        return "hiking/hikingRouteResult";  // Load hikingRouteResult.jsp
    }
}