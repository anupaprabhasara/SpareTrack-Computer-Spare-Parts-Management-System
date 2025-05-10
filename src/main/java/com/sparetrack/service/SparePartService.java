package com.sparetrack.service;

import com.sparetrack.model.SparePart;
import com.sparetrack.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SparePartService {

    // Create Spare Part
    public boolean createSparePart(SparePart part) {
        String query = "INSERT INTO SpareParts (part_name, category, model_number, brand, quantity_in_stock, unit_price, description) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, part.getPartName());
            stmt.setString(2, part.getCategory());
            stmt.setString(3, part.getModelNumber());
            stmt.setString(4, part.getBrand());
            stmt.setInt(5, part.getQuantityInStock());
            stmt.setDouble(6, part.getUnitPrice());
            stmt.setString(7, part.getDescription());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Spare Part by ID
    public SparePart getSparePart(int id) {
        String query = "SELECT * FROM SpareParts WHERE part_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                SparePart part = new SparePart();
                part.setPartId(rs.getInt("part_id"));
                part.setPartName(rs.getString("part_name"));
                part.setCategory(rs.getString("category"));
                part.setModelNumber(rs.getString("model_number"));
                part.setBrand(rs.getString("brand"));
                part.setQuantityInStock(rs.getInt("quantity_in_stock"));
                part.setUnitPrice(rs.getDouble("unit_price"));
                part.setDescription(rs.getString("description"));
                return part;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Spare Parts
    public List<SparePart> getAllSpareParts() {
        List<SparePart> parts = new ArrayList<>();
        String query = "SELECT * FROM SpareParts";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                SparePart part = new SparePart();
                part.setPartId(rs.getInt("part_id"));
                part.setPartName(rs.getString("part_name"));
                part.setCategory(rs.getString("category"));
                part.setModelNumber(rs.getString("model_number"));
                part.setBrand(rs.getString("brand"));
                part.setQuantityInStock(rs.getInt("quantity_in_stock"));
                part.setUnitPrice(rs.getDouble("unit_price"));
                part.setDescription(rs.getString("description"));
                parts.add(part);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return parts;
    }

    // Update Spare Part
    public boolean updateSparePart(SparePart part) {
        String query = "UPDATE SpareParts SET part_name = ?, category = ?, model_number = ?, brand = ?, quantity_in_stock = ?, unit_price = ?, description = ? WHERE part_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, part.getPartName());
            stmt.setString(2, part.getCategory());
            stmt.setString(3, part.getModelNumber());
            stmt.setString(4, part.getBrand());
            stmt.setInt(5, part.getQuantityInStock());
            stmt.setDouble(6, part.getUnitPrice());
            stmt.setString(7, part.getDescription());
            stmt.setInt(8, part.getPartId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Spare Part
    public boolean deleteSparePart(int id) {
        String query = "DELETE FROM SpareParts WHERE part_id = ?";
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