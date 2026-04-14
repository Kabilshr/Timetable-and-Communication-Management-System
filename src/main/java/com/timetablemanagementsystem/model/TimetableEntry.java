package com.timetablemanagementsystem.model;

import java.sql.Time;

public class TimetableEntry {
    private int entryId;
    private String subjectId;
    private int teacherId;
    private Time classTime;
    private String classDay;
    private String roomNumber;

    // For display purposes
    private String subjectName;
    private String teacherName;

    public TimetableEntry() {}

    public int getEntryId() { return entryId; }
    public void setEntryId(int entryId) { this.entryId = entryId; }

    public String getSubjectId() { return subjectId; }
    public void setSubjectId(String subjectId) { this.subjectId = subjectId; }

    public int getTeacherId() { return teacherId; }
    public void setTeacherId(int teacherId) { this.teacherId = teacherId; }

    public Time getClassTime() { return classTime; }
    public void setClassTime(Time classTime) { this.classTime = classTime; }

    public String getClassDay() { return classDay; }
    public void setClassDay(String classDay) { this.classDay = classDay; }

    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }

    public String getSubjectName() { return subjectName; }
    public void setSubjectName(String subjectName) { this.subjectName = subjectName; }

    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }
}
