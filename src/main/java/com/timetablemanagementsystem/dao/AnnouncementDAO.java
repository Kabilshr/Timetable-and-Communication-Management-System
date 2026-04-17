package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.Announcement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AnnouncementDAO {
    public boolean addAnnouncement(String title, String content) {
        String query = "INSERT INTO announcements (title, content) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, title);
            stmt.setString(2, content);
            int rows = stmt.executeUpdate();
            System.out.println("DEBUG: Announcement added successfully. Rows affected: " + rows);
            return rows > 0;
        } catch (SQLException e) {
            System.err.println("DEBUG ERROR: Failed to add announcement: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public List<Announcement> getAllAnnouncements() {
        List<Announcement> list = new ArrayList<>();
        String query = "SELECT * FROM announcements ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                list.add(new Announcement(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getTimestamp("created_at")
                ));
            }
            System.out.println("DEBUG: Fetched " + list.size() + " announcements from database.");
        } catch (SQLException e) {
            System.err.println("DEBUG ERROR: Failed to fetch announcements: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteAnnouncement(int id) {
        String query = "DELETE FROM announcements WHERE id = ?";
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
