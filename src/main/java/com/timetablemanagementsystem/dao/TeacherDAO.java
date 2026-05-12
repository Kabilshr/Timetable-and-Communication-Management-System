package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.Teacher;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAO {
    public int addTeacher(Teacher teacher) {
        String query = "INSERT INTO teachers (user_id, module_code) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, teacher.getUserId());
            stmt.setString(2, teacher.getModuleCode());
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
        String query = "SELECT t.*, u.name as teacher_name, u.email as teacher_email, m.module_title " +
                       "FROM teachers t " +
                       "JOIN users u ON t.user_id = u.user_id " +
                       "LEFT JOIN modules m ON t.module_code = m.module_code";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Teacher t = new Teacher();
                t.setTeacherId(rs.getInt("teacher_id"));
                t.setUserId(rs.getInt("user_id"));
                t.setModuleCode(rs.getString("module_code"));
                t.setTeacherName(rs.getString("teacher_name"));
                t.setTeacherEmail(rs.getString("teacher_email"));
                t.setModuleTitle(rs.getString("module_title"));
                teachers.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }

    public Teacher getTeacherByName(String name) {
        String query = "SELECT t.*, u.name as teacher_name, u.email as teacher_email, m.module_title " +
                       "FROM teachers t " +
                       "JOIN users u ON t.user_id = u.user_id " +
                       "LEFT JOIN modules m ON t.module_code = m.module_code " +
                       "WHERE u.name = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Teacher t = new Teacher();
                t.setTeacherId(rs.getInt("teacher_id"));
                t.setUserId(rs.getInt("user_id"));
                t.setModuleCode(rs.getString("module_code"));
                t.setTeacherName(rs.getString("teacher_name"));
                t.setTeacherEmail(rs.getString("teacher_email"));
                t.setModuleTitle(rs.getString("module_title"));
                return t;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Teacher getTeacherByUserId(int userId) {
        String query = "SELECT t.*, u.name as teacher_name, u.email as teacher_email, m.module_title " +
                       "FROM teachers t " +
                       "JOIN users u ON t.user_id = u.user_id " +
                       "LEFT JOIN modules m ON t.module_code = m.module_code " +
                       "WHERE t.user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Teacher t = new Teacher();
                t.setTeacherId(rs.getInt("teacher_id"));
                t.setUserId(rs.getInt("user_id"));
                t.setModuleCode(rs.getString("module_code"));
                t.setTeacherName(rs.getString("teacher_name"));
                t.setTeacherEmail(rs.getString("teacher_email"));
                t.setModuleTitle(rs.getString("module_title"));
                return t;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Teacher getTeacherById(int id) {
        String query = "SELECT t.*, u.name as teacher_name, u.email as teacher_email, m.module_title " +
                       "FROM teachers t " +
                       "JOIN users u ON t.user_id = u.user_id " +
                       "LEFT JOIN modules m ON t.module_code = m.module_code " +
                       "WHERE t.teacher_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Teacher t = new Teacher();
                t.setTeacherId(rs.getInt("teacher_id"));
                t.setUserId(rs.getInt("user_id"));
                t.setModuleCode(rs.getString("module_code"));
                t.setTeacherName(rs.getString("teacher_name"));
                t.setTeacherEmail(rs.getString("teacher_email"));
                t.setModuleTitle(rs.getString("module_title"));
                return t;
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
