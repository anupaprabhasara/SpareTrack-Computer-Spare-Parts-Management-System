package com.sparetrack.service;

import com.sparetrack.model.PurchaseOrder;
import com.sparetrack.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PurchaseOrderService {

    // Create Purchase Order
    public boolean createPurchaseOrder(PurchaseOrder order) {
        String query = "INSERT INTO PurchaseOrders (part_id, supplier_id, quantity_ordered, order_date, received_date, ordered_by) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, order.getPartId());
            stmt.setInt(2, order.getSupplierId());
            stmt.setInt(3, order.getQuantityOrdered());
            stmt.setString(4, order.getOrderDate());
            stmt.setString(5, order.getReceivedDate());
            stmt.setInt(6, order.getOrderedBy());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Purchase Order by ID (using view)
    public PurchaseOrder getPurchaseOrder(int id) {
        String query = "SELECT * FROM view_purchaseorders WHERE order_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                PurchaseOrder order = new PurchaseOrder();
                order.setOrderId(rs.getInt("order_id"));
                order.setPartId(rs.getInt("part_id"));
                order.setPartName(rs.getString("part_name"));
                order.setSupplierId(rs.getInt("supplier_id"));
                order.setSupplierName(rs.getString("supplier_name"));
                order.setQuantityOrdered(rs.getInt("quantity_ordered"));
                order.setOrderDate(rs.getString("order_date"));
                order.setReceivedDate(rs.getString("received_date"));
                order.setOrderedBy(rs.getInt("ordered_by"));
                order.setOrderedByName(rs.getString("ordered_by_name"));
                return order;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Purchase Orders (using view)
    public List<PurchaseOrder> getAllPurchaseOrders() {
        List<PurchaseOrder> orders = new ArrayList<>();
        String query = "SELECT * FROM view_purchaseorders";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                PurchaseOrder order = new PurchaseOrder();
                order.setOrderId(rs.getInt("order_id"));
                order.setPartId(rs.getInt("part_id"));
                order.setPartName(rs.getString("part_name"));
                order.setSupplierId(rs.getInt("supplier_id"));
                order.setSupplierName(rs.getString("supplier_name"));
                order.setQuantityOrdered(rs.getInt("quantity_ordered"));
                order.setOrderDate(rs.getString("order_date"));
                order.setReceivedDate(rs.getString("received_date"));
                order.setOrderedBy(rs.getInt("ordered_by"));
                order.setOrderedByName(rs.getString("ordered_by_name"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Update Purchase Order
    public boolean updatePurchaseOrder(PurchaseOrder order) {
        String query = "UPDATE PurchaseOrders SET part_id = ?, supplier_id = ?, quantity_ordered = ?, order_date = ?, received_date = ?, ordered_by = ? WHERE order_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, order.getPartId());
            stmt.setInt(2, order.getSupplierId());
            stmt.setInt(3, order.getQuantityOrdered());
            stmt.setString(4, order.getOrderDate());
            stmt.setString(5, order.getReceivedDate());
            stmt.setInt(6, order.getOrderedBy());
            stmt.setInt(7, order.getOrderId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Purchase Order
    public boolean deletePurchaseOrder(int id) {
        String query = "DELETE FROM PurchaseOrders WHERE order_id = ?";
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