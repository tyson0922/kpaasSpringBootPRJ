package kopo.kpaas.controller;

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

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/injuries")
public class InjuryController {

    private final IInjuryService injuryService;  // Injected via constructor

    @PostMapping("/save")
    @ResponseBody
    public String saveInjury(@RequestBody InjuryDTO pDTO) {
        log.info("Received request to save injury: Class = {}, Confidence = {}", pDTO.getInjuryClass(), pDTO.getConfidenceLevel());
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
            return "main/injuryDetection";  // injuryDetection.jsp
        } catch (Exception e) {
            log.error("Error listing injuries: {}", e.getMessage());
            model.addAttribute("errorMessage", "Error loading injuries.");
            return "main/injuryDetection";  // Same view for errors
        }
    }

    @GetMapping("/latest")
    @ResponseBody
    public ResponseEntity<?> getLatestInjury() {
        log.info("Received request to get the latest injury.");
        try {
            InjuryDTO latestInjury = injuryService.getLatestInjury();

            if (latestInjury != null) {
                log.info("Latest Injury: Class = {}, Confidence = {}, Detected At = {}",
                        latestInjury.getInjuryClass(), latestInjury.getConfidenceLevel(), latestInjury.getDetectedAt());

                return ResponseEntity.ok(latestInjury);  // Return injury data as JSON
            } else {
                log.info("No injury data found.");
                return ResponseEntity.ok(Collections.singletonMap("errorMessage", "No injury data found."));
            }
        } catch (Exception e) {
            log.error("Error fetching the latest injury: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("errorMessage", "Error loading the latest injury."));
        }
    }

    @GetMapping("/injuryResult")
    public String showInjuryResult(Model model) {
        InjuryDTO rDTO = (InjuryDTO) model.getAttribute("rDTO");

        // If rDTO is not set in the model, fetch the latest injury from the database
        if (rDTO == null) {
            rDTO = injuryService.getLatestInjury();
            model.addAttribute("rDTO", rDTO);
        }

        // Forward to injuryResult.jsp
        return "injury/injuryResult";
    }
}

