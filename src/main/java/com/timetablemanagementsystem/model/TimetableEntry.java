package com.timetablemanagementsystem.model;

import java.sql.Time;

public class TimetableEntry {
    private int entryId;
    private String moduleCode;
    private int lecturerId;
    private String year;
    private String section;
    private String classType;
    private String day;
    private Time startTime;
    private Time endTime;
    private String block;
    private String room;
    
    // Convenience fields for display (populated via JOINs)
    private String moduleTitle;
    private String lecturerName;

    public TimetableEntry() {}

    public int getEntryId() { return entryId; }
    public void setEntryId(int entryId) { this.entryId = entryId; }

    public String getModuleCode() { return moduleCode; }
    public void setModuleCode(String moduleCode) { this.moduleCode = moduleCode; }

    public int getLecturerId() { return lecturerId; }
    public void setLecturerId(int lecturerId) { this.lecturerId = lecturerId; }

    public String getYear() { return year; }
    public void setYear(String year) { this.year = year; }

    public String getSection() { return section; }
    public void setSection(String section) { this.section = section; }

    public String getClassType() { return classType; }
    public void setClassType(String classType) { this.classType = classType; }

    public String getDay() { return day; }
    public void setDay(String day) { this.day = day; }

    public Time getStartTime() { return startTime; }
    public void setStartTime(Time startTime) { this.startTime = startTime; }

    public Time getEndTime() { return endTime; }
    public void setEndTime(Time endTime) { this.endTime = endTime; }

    public String getBlock() { return block; }
    public void setBlock(String block) { this.block = block; }

    public String getRoom() { return room; }
    public void setRoom(String room) { this.room = room; }

    public String getModuleTitle() { return moduleTitle; }
    public void setModuleTitle(String moduleTitle) { this.moduleTitle = moduleTitle; }

    public String getLecturerName() { return lecturerName; }
    public void setLecturerName(String lecturerName) { this.lecturerName = lecturerName; }
}
