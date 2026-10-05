package com.packet.Spring_Boot_Security_Tutorial.Controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        return "Learning Spring Boot Security";
    }
    @GetMapping("/session")
    public String session(HttpServletRequest request) {
        return "Session ID: " + request.getSession().getId() + "";
    }
}
