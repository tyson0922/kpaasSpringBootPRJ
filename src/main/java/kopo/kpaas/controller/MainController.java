package kopo.kpaas.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
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

    @GetMapping(value="hikingMap")
    public String hikingMap() {
        log.info(this.getClass().getName()+ ".main/hikingMap");

        return "main/hikingMap";
    }
}
