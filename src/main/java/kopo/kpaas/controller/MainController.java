package kopo.kpaas.controller;

import jakarta.servlet.http.HttpSession;
import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.dto.UserInfoDTO;
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
    public String hikingMap(Model model) {
        log.info(this.getClass().getName()+ ".main/hikingMap");

        model.addAttribute("naverApiClientKey", naverApiClientKey); // Inject the key into the model
        return "main/hikingMap";
    }

    // New method to handle the hikingRouteTest.jsp
    @GetMapping(value = "hikingRouteTest")
    public String hikingRouteTest(Model model, HttpSession session) {
        log.info(this.getClass().getName() + ".main/hikingRouteTest");

        // Retrieve userId from session
        String userId = (String) session.getAttribute("SS_USER_ID");

        // If userId is not present in the session, redirect to the login page
        if (userId == null) {
            return "redirect:/user/sign-in";
        }

        // Call the service to get and save hiking route data, passing userId
        Map<String, Object> hikingRouteData = hikingRouteService.getAndSaveHikingRoutes(userId);

        // Add data to the model for rendering in the JSP
        model.addAttribute("hikingRouteData", hikingRouteData);
        model.addAttribute("naverClientSecret", naverClientSecret); // Assuming this value is already set elsewhere

        return "hiking/hikingRouteResult";  // Load hikingRouteTest.jsp
    }

}


//@GetMapping("/main")
//public String analyzeMain(HttpSession session, ModelMap model) throws Exception {
//    log.info("{}.analyzeMain Start!", this.getClass().getName());
//
//    String userId = getUserIdFromSession(session);
//    if (userId == null) {
//        return "redirect:/user/login";
//    }
//
//    UserInfoDTO userInfo = userInfoService.getUserInfoById(userId);
//    model.addAttribute("userName", userInfo.getUserName());
//    log.info("userName : {}", userInfo.getUserName());
//
//    return "/analyze/main";
//}
//  <header class="py-5">
//        <div class="container px-5 pb-5">
//            <div class="row gx-5 align-items-center">
//                <div class="section">
//                    <div class="packman"><img src="../assets/packman.png" style="width: 75px; height:auto"></div>
//
//                    <div class="intro">
//안녕하세요.<br>
//${userName}님의 발표 도우미 <span class="pitch-lab">Pitch Lab</span>입니다.<br><br>
//발표 준비를 도와드릴게요!
//                    </div>
//                </div>
//            </div>
//        </div>

