package com.example.Employee_Database;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccessDeniedController {

    @GetMapping("/access-denied") // localhost:8080/access-denied
    public String showAccessDenied() {
        return "access-denied"; // Resolves to /templates/access-denid.html
    }
}
