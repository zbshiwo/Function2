package com.zb.model;

public class StudentInfo {
    private int id;
    private int sid;
    private String module_name;
    private int score;
    private byte limits;

    public byte getLimits() {
        return limits;
    }

    public void setLimits(byte limits) {
        this.limits = limits;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getModule_name() {
        return module_name;
    }

    public void setModule_name(String module_name) {
        this.module_name = module_name;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
