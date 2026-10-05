package com.mcnz.spring.Coding_Practice_1;

public class Score {

    // Score Class Variables / Data fields
    private int wins;
    private int ties;
    private int losses;

    public Score() { // No ARGS Constructor
    }

    public Score(int wins, int ties, int losses) { // ARGS Constructor / Default Constructor
        this.wins = wins;
        this.ties = ties;
        this.losses = losses;
    }

    public int getLosses() {
        return losses;
    }

    public void setLosses(int losses) {
        this.losses = losses;
    }

    public int getTies() {
        return ties;
    }

    public void setTies(int ties) {
        this.ties = ties;
    }

    public int getWins() {
        return wins;
    }

    public void setWins(int wins) {
        this.wins = wins;
    }
}
