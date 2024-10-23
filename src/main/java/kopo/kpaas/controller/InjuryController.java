package kopo.kpaas.controller;

import jakarta.servlet.http.HttpSession;
import kopo.kpaas.dto.InjuryDTO;
import kopo.kpaas.service.IInjuryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/injuries")
@RequiredArgsConstructor
@Slf4j
public class InjuryController {

    private final IInjuryService injuryService;

    @PostMapping("/save")
    @ResponseBody
    public String saveInjury(@RequestBody InjuryDTO pDTO) {
        log.info("Received request to save injury: Class = {}, Confidence = {}",
                pDTO.getInjuryClass(), pDTO.getConfidenceLevel());

        try {
            injuryService.saveInjury(pDTO);
            log.info("Injury saved successfully.");
            return "Injury saved successfully";
        } catch (Exception e) {
            log.error("Error saving injury: {}", e.getMessage());
            return "Error saving injury";
        }
    }

    @GetMapping("/list")
    public String listInjuries(Model model) {
        log.info("Received request to list all injuries.");
        try {
            List<InjuryDTO> rDTO = injuryService.getInjuries();
            model.addAttribute("injuries", rDTO);
            log.info("Injuries loaded successfully, count: {}", rDTO.size());
            return "main/injuryDetection";  // JSP page
        } catch (Exception e) {
            log.error("Error listing injuries: {}", e.getMessage());
            model.addAttribute("errorMessage", "Error loading injuries.");
            return "main/injuryDetection";  // Same view for errors
        }
    }

    @GetMapping("/latest")
    @ResponseBody
    public ResponseEntity<?> getLatestInjury(HttpSession session) {
        log.info("Received request to get the latest injury.");

        try {
            // Retrieve userId from the session
            String userId = (String) session.getAttribute("SS_USER_ID");

            if (userId == null) {
                log.warn("No userId found in session. Redirecting to login.");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                        .body(Collections.singletonMap("errorMessage", "User not logged in."));
            }

            // Fetch the latest injury for the logged-in user
            InjuryDTO latestInjury = injuryService.getLatestInjury(userId);

            if (latestInjury != null) {
                log.info("Latest Injury: Class = {}, Confidence = {}, Registered At = {}",
                        latestInjury.getInjuryClass(), latestInjury.getConfidenceLevel(), latestInjury.getRegDt());

                return ResponseEntity.ok(latestInjury);
            } else {
                log.info("No injury data found.");
                return ResponseEntity.ok(Collections.singletonMap("errorMessage", "No injury data found."));
            }
        } catch (Exception e) {
            log.error("Error fetching the latest injury: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Collections.singletonMap("errorMessage", "Error loading the latest injury."));
        }
    }

    @GetMapping("/injuryResult")
    public String showInjuryResult(HttpSession session, Model model) throws Exception {
        // Retrieve userId and userName from the session
        String userId = (String) session.getAttribute("SS_USER_ID");
        String userName = (String) session.getAttribute("SS_USER_NAME");

        // If userId is not present in the session, redirect to the login page
        if (userId == null) {
            return "redirect:/user/sign-in";
        }

        // Add userId and userName to the model
        model.addAttribute("userId", userId);
        model.addAttribute("userName", userName);

        // Fetch the latest injury if rDTO is not set in the model
        InjuryDTO rDTO = (InjuryDTO) model.getAttribute("rDTO");
        if (rDTO == null) {
            rDTO = injuryService.getLatestInjury(userId);
            model.addAttribute("rDTO", rDTO);
        }

        // Forward to injuryResult.jsp
        return "injury/injuryResult";
    }

}

