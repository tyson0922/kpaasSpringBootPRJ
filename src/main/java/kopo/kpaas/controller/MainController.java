package kopo.kpaas.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequestMapping(value = "/main")
@RequiredArgsConstructor
@Controller
public class MainController {

    @GetMapping(value = "mainPage")
    public String mainPage() {
        log.info(this.getClass().getName() + ".main/mainPage");

        return "main/mainPage";
    }

    @GetMapping(value = "injuryDetection")
    public String injuryDetection() {
        log.info(this.getClass().getName() + ".main/injuryDetection");

        return "main/injuryDetection";
    }

    @Value("${naver.api.client.key}")
    private String naverApiClientKey;

    @GetMapping(value="hikingMap")
    public String hikingMap(Model model) {
        log.info(this.getClass().getName()+ ".main/hikingMap");

        model.addAttribute("naverApiClientKey", naverApiClientKey); // Inject the key into the model
        return "main/hikingMap";
    }
}
