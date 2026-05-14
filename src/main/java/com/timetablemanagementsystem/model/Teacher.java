package com.timetablemanagementsystem.model;

public class Teacher {
    private int teacherId;
    private int userId;
    
    // Convenience fields for display (populated via JOINs)
    private String teacherName;
    private String teacherEmail;

    public Teacher() {}

    public Teacher(int teacherId, int userId) {
        this.teacherId = teacherId;
        this.userId = userId;
    }

    // Constructor for display purposes
    public Teacher(int teacherId, String teacherName, String teacherEmail) {
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.teacherEmail = teacherEmail;
    }

    public int getTeacherId() { return teacherId; }
    public void setTeacherId(int teacherId) { this.teacherId = teacherId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }

    public String getTeacherEmail() { return teacherEmail; }
    public void setTeacherEmail(String teacherEmail) { this.teacherEmail = teacherEmail; }
}
