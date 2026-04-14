package com.timetablemanagementsystem.model;

public class Teacher {
    private int teacherId;
    private int userId;
    private String subjectId;
    private String teacherName; // Optional: for easier display

    public Teacher() {}

    public Teacher(int teacherId, int userId, String subjectId) {
        this.teacherId = teacherId;
        this.userId = userId;
        this.subjectId = subjectId;
    }

    public int getTeacherId() { return teacherId; }
    public void setTeacherId(int teacherId) { this.teacherId = teacherId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getSubjectId() { return subjectId; }
    public void setSubjectId(String subjectId) { this.subjectId = subjectId; }

    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }
}
