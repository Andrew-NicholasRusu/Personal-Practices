package com.mcnz.spring.Coding_Practice_1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class CodingPractice1Application {

	@GetMapping("/helloworld")
	public String sayHelloWorld() {
		return "Hello World!";
	}

	public static void main(String[] args) {
		SpringApplication.run(CodingPractice1Application.class, args);
	}

}
