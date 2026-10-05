package com.mcnz.spring.Coding_Practice_1;

import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class ClassController {

    static Score score = new Score(30, 20, 10);

    @GetMapping("/health-check") // GET Request to localhost:8080/health-check
    public String getHealthCheck() {
        return "Situation Normal All Fired Up!";
    }

    @GetMapping("/score") // GET Request to localhost:8080/score
    public Score getScore() {
        return score;
    }

    /** @PostMapping("/score") */
    @PostMapping("/score/wins")
    public Score increaseWins() {
        score.wins++;
        return score;
    }

//    @GetMapping("/score/wins") // GET Request to localhost:8080/score/wins
//    public int getWins() {
//        return score.getWins();
//    }
//
//    @GetMapping("/score/losses") // GET Request to localhost:8080/score/losses
//    public int getLosses() {
//        return score.getLosses();
//    }
//
//    @GetMapping("/score/ties") // GET Request to localhost:8080/score/ties
//    public int getTies() {
//        return score.getTies();
//    }

    /** @PathVariable("winslossesorties") */
    @GetMapping("/score/{winslossesorties}") // GET Request to localhost:8080/score/winslossesorties
    public int getWinsLossesOrTies(@PathVariable("winslossesorties") String winslossesorties) {
        if (winslossesorties.equalsIgnoreCase("wins")) {
            return score.getWins();
        } else if (winslossesorties.equalsIgnoreCase("ties")) { // Case Insensitive
            return score.getTies();
        } else {
            return score.getLosses();
        }
    }
}
