package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.TimetableEntry;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TimetableDAO {
    public boolean addEntry(TimetableEntry entry) {
        String query = "INSERT INTO timetable (subject_id, teacher_id, class_time, class_day, room_number) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, entry.getSubjectId());
            stmt.setInt(2, entry.getTeacherId());
            stmt.setTime(3, entry.getClassTime());
            stmt.setString(4, entry.getClassDay());
            stmt.setString(5, entry.getRoomNumber());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<TimetableEntry> getTimetable(String subjectCode, String day) {
        List<TimetableEntry> list = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT tt.*, s.subject_name, u.name as teacher_name " +
                                             "FROM timetable tt " +
                                             "JOIN subjects s ON tt.subject_id = s.subject_code " +
                                             "JOIN teachers t ON tt.teacher_id = t.teacher_id " +
                                             "JOIN users u ON t.user_id = u.user_id WHERE 1=1 ");
        
        if (subjectCode != null && !subjectCode.isEmpty()) query.append("AND tt.subject_id = ? ");
        if (day != null && !day.isEmpty()) query.append("AND tt.class_day = ? ");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query.toString())) {
            int paramIndex = 1;
            if (subjectCode != null && !subjectCode.isEmpty()) stmt.setString(paramIndex++, subjectCode);
            if (day != null && !day.isEmpty()) stmt.setString(paramIndex++, day);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                TimetableEntry entry = new TimetableEntry();
                entry.setEntryId(rs.getInt("entry_id"));
                entry.setSubjectId(rs.getString("subject_id"));
                entry.setTeacherId(rs.getInt("teacher_id"));
                entry.setClassTime(rs.getTime("class_time"));
                entry.setClassDay(rs.getString("class_day"));
                entry.setRoomNumber(rs.getString("room_number"));
                entry.setSubjectName(rs.getString("subject_name"));
                entry.setTeacherName(rs.getString("teacher_name"));
                list.add(entry);
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
}
