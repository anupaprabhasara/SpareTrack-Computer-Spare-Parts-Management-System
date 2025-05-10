package com.sparetrack.service;

import com.sparetrack.model.UsageLog;
import com.sparetrack.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsageLogService {

    // Create Usage Log
    public boolean createUsageLog(UsageLog log) {
        String query = "INSERT INTO UsageLogs (part_id, quantity_used, used_by, usage_context, usage_date) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, log.getPartId());
            stmt.setInt(2, log.getQuantityUsed());
            stmt.setInt(3, log.getUsedBy());
            stmt.setString(4, log.getUsageContext());
            stmt.setString(5, log.getUsageDate());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Usage Log by ID (from view)
    public UsageLog getUsageLog(int id) {
        String query = "SELECT * FROM view_usagelogs WHERE usage_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                UsageLog log = new UsageLog();
                log.setUsageId(rs.getInt("usage_id"));
                log.setPartId(rs.getInt("part_id"));
                log.setPartName(rs.getString("part_name"));
                log.setQuantityUsed(rs.getInt("quantity_used"));
                log.setUsedBy(rs.getInt("used_by"));
                log.setUsedByName(rs.getString("used_by_name"));
                log.setUsageContext(rs.getString("usage_context"));
                log.setUsageDate(rs.getString("usage_date"));
                return log;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Usage Logs (from view)
    public List<UsageLog> getAllUsageLogs() {
        List<UsageLog> logs = new ArrayList<>();
        String query = "SELECT * FROM view_usagelogs";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                UsageLog log = new UsageLog();
                log.setUsageId(rs.getInt("usage_id"));
                log.setPartId(rs.getInt("part_id"));
                log.setPartName(rs.getString("part_name"));
                log.setQuantityUsed(rs.getInt("quantity_used"));
                log.setUsedBy(rs.getInt("used_by"));
                log.setUsedByName(rs.getString("used_by_name"));
                log.setUsageContext(rs.getString("usage_context"));
                log.setUsageDate(rs.getString("usage_date"));
                logs.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return logs;
    }

    // Update Usage Log
    public boolean updateUsageLog(UsageLog log) {
        String query = "UPDATE UsageLogs SET part_id = ?, quantity_used = ?, used_by = ?, usage_context = ?, usage_date = ? WHERE usage_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, log.getPartId());
            stmt.setInt(2, log.getQuantityUsed());
            stmt.setInt(3, log.getUsedBy());
            stmt.setString(4, log.getUsageContext());
            stmt.setString(5, log.getUsageDate());
            stmt.setInt(6, log.getUsageId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Usage Log
    public boolean deleteUsageLog(int id) {
        String query = "DELETE FROM UsageLogs WHERE usage_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}