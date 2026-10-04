package com.example.Spring_Security_Practice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DemoController {

    @GetMapping("/")
    public String showHome() {
        return "home"; // Resolves to src/main/resources/templates/home.html
    }
}
