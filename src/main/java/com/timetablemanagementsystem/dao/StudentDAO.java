package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.Student;
import java.sql.*;

public class StudentDAO {
    public Student getStudentByUserId(int userId) {
        String query = "SELECT s.*, u.name, u.email, sec.year, sec.section_name " +
                       "FROM students s " +
                       "JOIN users u ON s.user_id = u.user_id " +
                       "LEFT JOIN sections sec ON s.section_id = sec.section_id " +
                       "WHERE s.user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Student student = new Student();
                student.setStudentId(rs.getInt("student_id"));
                student.setUserId(rs.getInt("user_id"));
                student.setSectionId(rs.getInt("section_id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setYear(rs.getString("year"));
                student.setSectionName(rs.getString("section_name"));
                return student;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateStudentSection(int userId, int sectionId) {
        System.out.println("DEBUG: StudentDAO.updateStudentSection called for user_id: " + userId + ", section_id: " + sectionId);
        
        // 1. Check if student record exists
        String checkQuery = "SELECT COUNT(*) FROM students WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
            checkStmt.setInt(1, userId);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                System.out.println("DEBUG: No student record found. Creating new student record for user_id: " + userId);
                String insertQuery = "INSERT INTO students (user_id) VALUES (?)";
                try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                    insertStmt.setInt(1, userId);
                    insertStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.err.println("DEBUG SQL ERROR during student record check/insert: " + e.getMessage());
            e.printStackTrace();
            return false;
        }

        // 2. Perform update
        String updateQuery = "UPDATE students SET section_id = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
            if (sectionId > 0) {
                stmt.setInt(1, sectionId);
            } else {
                stmt.setNull(1, Types.INTEGER);
            }
            stmt.setInt(2, userId);
            
            System.out.println("DEBUG: Executing SQL: " + updateQuery + " with params [" + sectionId + ", " + userId + "]");
            int rowsAffected = stmt.executeUpdate();
            System.out.println("DEBUG: SQL execution completed. Rows affected: " + rowsAffected);
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("DEBUG SQL ERROR in StudentDAO.updateStudentSection: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
