package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.Section;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SectionDAO {
    public List<Section> getAllSections() {
        List<Section> sections = new ArrayList<>();
        String query = "SELECT * FROM sections ORDER BY year, section_name";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                sections.add(new Section(
                    rs.getInt("section_id"),
                    rs.getString("year"),
                    rs.getString("section_name")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sections;
    }

    public Section getSectionById(int id) {
        String query = "SELECT * FROM sections WHERE section_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Section(
                    rs.getInt("section_id"),
                    rs.getString("year"),
                    rs.getString("section_name")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Section getSectionByYearAndName(String year, String name) {
        String query = "SELECT * FROM sections WHERE year = ? AND section_name = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, year);
            stmt.setString(2, name);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Section(
                    rs.getInt("section_id"),
                    rs.getString("year"),
                    rs.getString("section_name")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
