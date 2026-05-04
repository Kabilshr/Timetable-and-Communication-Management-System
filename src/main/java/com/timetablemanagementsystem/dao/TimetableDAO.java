package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.TimetableEntry;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TimetableDAO {
    public boolean addEntry(TimetableEntry entry) {
        String query = "INSERT INTO timetable (year, section, class_type, module_code, module_title, lecturer, block, room, start_time, end_time, day) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, entry.getYear());
            stmt.setString(2, entry.getSection());
            stmt.setString(3, entry.getClassType());
            stmt.setString(4, entry.getModuleCode());
            stmt.setString(5, entry.getModuleTitle());
            stmt.setString(6, entry.getLecturer());
            stmt.setString(7, entry.getBlock());
            stmt.setString(8, entry.getRoom());
            stmt.setTime(9, entry.getStartTime());
            stmt.setTime(10, entry.getEndTime());
            stmt.setString(11, entry.getDay());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<TimetableEntry> getTimetable() {
        List<TimetableEntry> list = new ArrayList<>();
        String query = "SELECT * FROM timetable";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
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
        entry.setYear(rs.getString("year"));
        entry.setSection(rs.getString("section"));
        entry.setClassType(rs.getString("class_type"));
        entry.setModuleCode(rs.getString("module_code"));
        entry.setModuleTitle(rs.getString("module_title"));
        entry.setLecturer(rs.getString("lecturer"));
        entry.setBlock(rs.getString("block"));
        entry.setRoom(rs.getString("room"));
        entry.setStartTime(rs.getTime("start_time"));
        entry.setEndTime(rs.getTime("end_time"));
        entry.setDay(rs.getString("day"));
        return entry;
    }
}
