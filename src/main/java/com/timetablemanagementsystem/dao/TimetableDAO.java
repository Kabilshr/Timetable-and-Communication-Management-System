package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.TimetableEntry;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TimetableDAO {
    public boolean addEntry(TimetableEntry entry) {
        String query = "INSERT INTO timetable (module_code, lecturer_id, year, section, class_type, day, start_time, end_time, block, room) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, entry.getModuleCode());
            stmt.setInt(2, entry.getLecturerId());
            stmt.setString(3, entry.getYear());
            stmt.setString(4, entry.getSection());
            stmt.setString(5, entry.getClassType());
            stmt.setString(6, entry.getDay());
            stmt.setTime(7, entry.getStartTime());
            stmt.setTime(8, entry.getEndTime());
            stmt.setString(9, entry.getBlock());
            stmt.setString(10, entry.getRoom());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<TimetableEntry> getTimetable() {
        return getTimetable(null, null, null);
    }

    public List<TimetableEntry> getTimetable(String year, String section, String lecturerName) {
        List<TimetableEntry> list = new ArrayList<>();
        StringBuilder query = new StringBuilder(
            "SELECT t.*, m.module_title, u.name as lecturer_name " +
            "FROM timetable t " +
            "JOIN modules m ON t.module_code = m.module_code " +
            "JOIN teachers te ON t.lecturer_id = te.teacher_id " +
            "JOIN users u ON te.user_id = u.user_id WHERE 1=1"
        );

        if (year != null) query.append(" AND t.year = ?");
        if (section != null) query.append(" AND t.section = ?");
        if (lecturerName != null) query.append(" AND u.name = ?");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query.toString())) {
            
            int paramIndex = 1;
            if (year != null) stmt.setString(paramIndex++, year);
            if (section != null) stmt.setString(paramIndex++, section);
            if (lecturerName != null) stmt.setString(paramIndex++, lecturerName);

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
        entry.setYear(rs.getString("year"));
        entry.setSection(rs.getString("section"));
        entry.setClassType(rs.getString("class_type"));
        entry.setDay(rs.getString("day"));
        entry.setStartTime(rs.getTime("start_time"));
        entry.setEndTime(rs.getTime("end_time"));
        entry.setBlock(rs.getString("block"));
        entry.setRoom(rs.getString("room"));
        entry.setModuleTitle(rs.getString("module_title"));
        entry.setLecturerName(rs.getString("lecturer_name"));
        return entry;
    }
}
