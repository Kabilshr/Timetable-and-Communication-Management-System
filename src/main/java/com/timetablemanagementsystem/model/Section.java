package com.timetablemanagementsystem.model;

public class Section {
    private int sectionId;
    private String year;
    private String sectionName;

    public Section() {}

    public Section(int sectionId, String year, String sectionName) {
        this.sectionId = sectionId;
        this.year = year;
        this.sectionName = sectionName;
    }

    public int getSectionId() { return sectionId; }
    public void setSectionId(int sectionId) { this.sectionId = sectionId; }

    public String getYear() { return year; }
    public void setYear(String year) { this.year = year; }

    public String getSectionName() { return sectionName; }
    public void setSectionName(String sectionName) { this.sectionName = sectionName; }
}
