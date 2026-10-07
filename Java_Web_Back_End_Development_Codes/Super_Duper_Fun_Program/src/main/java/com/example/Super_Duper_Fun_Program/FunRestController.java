package com.example.Super_Duper_Fun_Program;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FunRestController {

    @Value ("${coach.name}") // Injects custom property value [8]
    private String coachName;
    @Value("${team.name}") // Injects custom property value [8]
    private String teamName;
    @Value ("${fun.name}")
    private String funName;
    @Value ("${fun.description}")
    private String funDescription;
    @Value ("${activity.name}")
    private String activityName;

    @GetMapping("/teaminfo") // localhost:8080/teaminfo
    public String getTeamInfo() {
        return "Coach: " + coachName + ", Team: " + teamName;
    }

    @GetMapping("/activityinfo") // localhost:8080/activityinfo
    public String getActivityInfo() {
        return "Activity: " + activityName + ", Description: " + funDescription;
    }

    @GetMapping("/funinfo") // localhost:8080/funinfo
    public String getFunInfo() {
        return "Fun: " + funName;
    }
}
