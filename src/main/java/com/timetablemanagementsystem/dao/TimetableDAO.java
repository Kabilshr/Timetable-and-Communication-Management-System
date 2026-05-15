package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.TimetableEntry;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TimetableDAO {
    public boolean addEntry(TimetableEntry entry) {
        String query = "INSERT INTO timetable (module_code, lecturer_id, section_id, class_type, day, start_time, end_time, block, room) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, entry.getModuleCode());
            stmt.setInt(2, entry.getLecturerId());
            stmt.setInt(3, entry.getSectionId());
            stmt.setString(4, entry.getClassType());
            stmt.setString(5, entry.getDay());
            stmt.setTime(6, entry.getStartTime());
            stmt.setTime(7, entry.getEndTime());
            stmt.setString(8, entry.getBlock());
            stmt.setString(9, entry.getRoom());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<TimetableEntry> getTimetable() {
        return getTimetable(null, -1, null);
    }

    public List<TimetableEntry> getTimetable(Integer teacherId, Integer sectionId, String day) {
        List<TimetableEntry> list = new ArrayList<>();
        StringBuilder query = new StringBuilder(
            "SELECT t.*, m.module_title, u.name as lecturer_name, sec.year, sec.section_name " +
            "FROM timetable t " +
            "JOIN modules m ON t.module_code = m.module_code " +
            "JOIN teachers te ON t.lecturer_id = te.teacher_id " +
            "JOIN users u ON te.user_id = u.user_id " +
            "JOIN sections sec ON t.section_id = sec.section_id WHERE 1=1"
        );

        if (teacherId != null && teacherId > 0) query.append(" AND t.lecturer_id = ?");
        if (sectionId != null && sectionId > 0) query.append(" AND t.section_id = ?");
        if (day != null) query.append(" AND t.day = ?");
        
        query.append(" ORDER BY t.start_time ASC");
        
        System.out.println("DEBUG: Executing Timetable query: " + query.toString() + " | teacherId=" + teacherId + ", sectionId=" + sectionId + ", day=" + day);

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query.toString())) {
            
            int paramIndex = 1;
            if (teacherId != null && teacherId > 0) stmt.setInt(paramIndex++, teacherId);
            if (sectionId != null && sectionId > 0) stmt.setInt(paramIndex++, sectionId);
            if (day != null) stmt.setString(paramIndex++, day);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToEntry(rs));
            }
            System.out.println("DEBUG: Timetable query returned " + list.size() + " rows");
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("DEBUG: SQL Exception in getTimetable: " + e.getMessage());
        }
        return list;
    }

    public List<TimetableEntry> fetchTimetableBySections(List<Integer> sectionIds) {
        List<TimetableEntry> list = new ArrayList<>();
        if (sectionIds == null || sectionIds.isEmpty()) return list;

        StringBuilder query = new StringBuilder(
            "SELECT t.*, m.module_title, u.name as lecturer_name, sec.year, sec.section_name " +
            "FROM timetable t " +
            "JOIN modules m ON t.module_code = m.module_code " +
            "JOIN teachers te ON t.lecturer_id = te.teacher_id " +
            "JOIN users u ON te.user_id = u.user_id " +
            "JOIN sections sec ON t.section_id = sec.section_id " +
            "WHERE t.section_id IN ("
        );

        for (int i = 0; i < sectionIds.size(); i++) {
            query.append("?");
            if (i < sectionIds.size() - 1) query.append(",");
        }
        query.append(") ORDER BY t.day, t.start_time ASC");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query.toString())) {
            
            for (int i = 0; i < sectionIds.size(); i++) {
                stmt.setInt(i + 1, sectionIds.get(i));
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToEntry(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteEntry(int id) {
        String query = "DELETE FROM timetable WHERE entry_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getClassCount() {
        String query = "SELECT COUNT(*) FROM timetable";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private TimetableEntry mapResultSetToEntry(ResultSet rs) throws SQLException {
        TimetableEntry entry = new TimetableEntry();
        entry.setEntryId(rs.getInt("entry_id"));
        entry.setModuleCode(rs.getString("module_code"));
        entry.setLecturerId(rs.getInt("lecturer_id"));
        entry.setSectionId(rs.getInt("section_id"));
        entry.setClassType(rs.getString("class_type"));
        entry.setDay(rs.getString("day"));
        entry.setStartTime(rs.getTime("start_time"));
        entry.setEndTime(rs.getTime("end_time"));
        entry.setBlock(rs.getString("block"));
        entry.setRoom(rs.getString("room"));
        entry.setModuleTitle(rs.getString("module_title"));
        entry.setLecturerName(rs.getString("lecturer_name"));
        entry.setYear(rs.getString("year"));
        entry.setSectionName(rs.getString("section_name"));
        return entry;
    }
}
