package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.Teacher;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for Teacher-related database operations.
 * Matches migration schema: teacher_id, teacher_name, teacher_email, subject_id.
 */
public class TeacherDAO {
    public int addTeacher(Teacher teacher) {
        String query = "INSERT INTO teachers (teacher_name, teacher_email, subject_id) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, teacher.getTeacherName());
            stmt.setString(2, teacher.getTeacherEmail());
            stmt.setString(3, teacher.getSubjectId());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public List<Teacher> getAllTeachers() {
        List<Teacher> teachers = new ArrayList<>();
        String query = "SELECT * FROM teachers";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                teachers.add(new Teacher(
                    rs.getInt("teacher_id"),
                    rs.getString("teacher_name"),
                    rs.getString("teacher_email"),
                    rs.getString("subject_id")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }

    public Teacher getTeacherByName(String name) {
        String query = "SELECT * FROM teachers WHERE teacher_name = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Teacher(
                    rs.getInt("teacher_id"),
                    rs.getString("teacher_name"),
                    rs.getString("teacher_email"),
                    rs.getString("subject_id")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteTeacher(int id) {
        String query = "DELETE FROM teachers WHERE teacher_id = ?";
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
