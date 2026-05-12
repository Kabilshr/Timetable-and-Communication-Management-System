package com.timetablemanagementsystem.model;

public class Teacher {
    private int teacherId;
    private int userId;
    private String moduleCode;
    
    // Convenience fields for display (populated via JOINs)
    private String teacherName;
    private String teacherEmail;
    private String moduleTitle;

    public Teacher() {}

    public Teacher(int teacherId, int userId, String moduleCode) {
        this.teacherId = teacherId;
        this.userId = userId;
        this.moduleCode = moduleCode;
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

    public String getModuleCode() { return moduleCode; }
    public void setModuleCode(String moduleCode) { this.moduleCode = moduleCode; }

    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }

    public String getTeacherEmail() { return teacherEmail; }
    public void setTeacherEmail(String teacherEmail) { this.teacherEmail = teacherEmail; }

    public String getModuleTitle() { return moduleTitle; }
    public void setModuleTitle(String moduleTitle) { this.moduleTitle = moduleTitle; }
}
