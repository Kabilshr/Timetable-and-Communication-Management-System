package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.Teacher;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAO {
    public boolean addTeacher(Teacher teacher) {
        String query = "INSERT INTO teachers (user_id, subject_id) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, teacher.getUserId());
            stmt.setString(2, teacher.getSubjectId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Teacher> getAllTeachers() {
        List<Teacher> teachers = new ArrayList<>();
        String query = "SELECT t.teacher_id, t.user_id, t.subject_id, u.name FROM teachers t JOIN users u ON t.user_id = u.user_id";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Teacher t = new Teacher(rs.getInt("teacher_id"), rs.getInt("user_id"), rs.getString("subject_id"));
                t.setTeacherName(rs.getString("name"));
                teachers.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
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
