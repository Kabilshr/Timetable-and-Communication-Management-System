package com.timetablemanagementsystem.dao;

import com.timetablemanagementsystem.config.DBConnection;
import com.timetablemanagementsystem.model.Module;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ModuleDAO {
    public boolean addModule(Module module) {
        String query = "INSERT INTO modules (module_code, module_title) VALUES (?, ?) ON DUPLICATE KEY UPDATE module_title = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, module.getModuleCode());
            stmt.setString(2, module.getModuleTitle());
            stmt.setString(3, module.getModuleTitle());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Module getModuleByCode(String code) {
        String query = "SELECT * FROM modules WHERE module_code = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, code);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Module(rs.getString("module_code"), rs.getString("module_title"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Module> getAllModules() {
        List<Module> modules = new ArrayList<>();
        String query = "SELECT * FROM modules";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                modules.add(new Module(rs.getString("module_code"), rs.getString("module_title")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modules;
    }
}
