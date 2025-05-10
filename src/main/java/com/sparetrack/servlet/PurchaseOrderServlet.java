package com.sparetrack.servlet;

import com.sparetrack.model.PurchaseOrder;
import com.sparetrack.model.Admin;
import com.sparetrack.model.Supplier;
import com.sparetrack.model.SparePart;
import com.sparetrack.service.PurchaseOrderService;
import com.sparetrack.service.AdminService;
import com.sparetrack.service.SupplierService;
import com.sparetrack.service.SparePartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/purchase")
public class PurchaseOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PurchaseOrderService purchaseOrderService;
    private SparePartService sparePartService;
    private SupplierService supplierService;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        purchaseOrderService = new PurchaseOrderService();
        sparePartService = new SparePartService();
        supplierService = new SupplierService();
        adminService = new AdminService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setAttribute("name", session.getAttribute("name"));
        request.setAttribute("role", session.getAttribute("role"));

        String role = (String) session.getAttribute("role");
        if (!"Admin".equalsIgnoreCase(role)) {
            response.setContentType("text/html");
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('You do not have permission to access this page.');");
            response.getWriter().println("window.location = '" + request.getContextPath() + "/part';");
            response.getWriter().println("</script>");
            return;
        }

        if (action == null) {
            request.setAttribute("orders", purchaseOrderService.getAllPurchaseOrders());
            request.getRequestDispatcher("app/purchases/index.jsp").forward(request, response);
        } else if (action.equals("create")) {
            populateReferenceData(request);
            request.getRequestDispatcher("app/purchases/create.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            PurchaseOrder order = purchaseOrderService.getPurchaseOrder(id);
            request.setAttribute("order", order);
            populateReferenceData(request);
            request.getRequestDispatcher("app/purchases/update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            purchaseOrderService.deletePurchaseOrder(id);
            response.sendRedirect("purchase");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            int partId = Integer.parseInt(request.getParameter("partId"));
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            int quantityOrdered = Integer.parseInt(request.getParameter("quantityOrdered"));
            String orderDate = request.getParameter("orderDate");
            String receivedDate = request.getParameter("receivedDate");
            int orderedBy = Integer.parseInt(request.getParameter("orderedBy"));

            PurchaseOrder order = new PurchaseOrder();
            order.setPartId(partId);
            order.setSupplierId(supplierId);
            order.setQuantityOrdered(quantityOrdered);
            order.setOrderDate(orderDate);
            order.setReceivedDate(receivedDate);
            order.setOrderedBy(orderedBy);

            if (purchaseOrderService.createPurchaseOrder(order)) {
                response.sendRedirect("purchase");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }

        } else if (action.equals("update")) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int partId = Integer.parseInt(request.getParameter("partId"));
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            int quantityOrdered = Integer.parseInt(request.getParameter("quantityOrdered"));
            String orderDate = request.getParameter("orderDate");
            String receivedDate = request.getParameter("receivedDate");
            int orderedBy = Integer.parseInt(request.getParameter("orderedBy"));

            PurchaseOrder order = new PurchaseOrder();
            order.setOrderId(orderId);
            order.setPartId(partId);
            order.setSupplierId(supplierId);
            order.setQuantityOrdered(quantityOrdered);
            order.setOrderDate(orderDate);
            order.setReceivedDate(receivedDate);
            order.setOrderedBy(orderedBy);

            if (purchaseOrderService.updatePurchaseOrder(order)) {
                response.sendRedirect("purchase");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }

    // Helper method to load reference data for dropdowns
    private void populateReferenceData(HttpServletRequest request) {
        List<SparePart> parts = sparePartService.getAllSpareParts();
        List<Supplier> suppliers = supplierService.getAllSuppliers();
        List<Admin> admins = adminService.getAllAdmins();

        request.setAttribute("parts", parts);
        request.setAttribute("suppliers", suppliers);
        request.setAttribute("admins", admins);
    }
}