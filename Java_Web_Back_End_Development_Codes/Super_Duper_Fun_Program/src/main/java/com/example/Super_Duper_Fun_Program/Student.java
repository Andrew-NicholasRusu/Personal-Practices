package com.example.Super_Duper_Fun_Program;

public class Student {
    private String name;
    private String funName;
    private String funDescription;
    private String activityName;
    private String coachName;
    private String teamName;

    public Student() {
    }

    public Student(String name, String funName, String funDescription, String activityName, String coachName, String teamName) {
        this.name = name;
        this.funName = funName;
        this.funDescription = funDescription;
        this.activityName = activityName;
        this.coachName = coachName;
        this.teamName = teamName;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getCoachName() {
        return coachName;
    }

    public void setCoachName(String coachName) {
        this.coachName = coachName;
    }

    public String getFunDescription() {
        return funDescription;
    }

    public void setFunDescription(String funDescription) {
        this.funDescription = funDescription;
    }

    public String getFunName() {
        return funName;
    }

    public void setFunName(String funName) {
        this.funName = funName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }
}
