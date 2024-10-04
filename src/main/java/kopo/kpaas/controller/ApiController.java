package kopo.kpaas.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {

    @PostMapping("/api/sendResult")
    public void receiveAnalysisResult(@RequestBody String result) {
        // Log the result to the Spring Boot console
        System.out.println("Received analysis result: " + result);
    }
}