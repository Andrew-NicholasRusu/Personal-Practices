package com.packet.cardatabase;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/cars")
public class CarDatabaseController {

    @GetMapping
    public String getCars() {
        return "All cars";
    }
}
