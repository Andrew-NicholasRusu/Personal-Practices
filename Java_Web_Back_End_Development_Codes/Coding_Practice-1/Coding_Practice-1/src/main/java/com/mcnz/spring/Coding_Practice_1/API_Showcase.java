package com.mcnz.spring.Coding_Practice_1;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@SuppressWarnings("unused")
@Deprecated
public class API_Showcase {
    public String api_showcase() {
        return "Hello World!";
    }
}
