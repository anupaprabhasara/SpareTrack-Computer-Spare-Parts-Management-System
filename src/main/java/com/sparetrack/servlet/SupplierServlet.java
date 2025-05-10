package com.sparetrack.servlet;

import com.sparetrack.model.Supplier;
import com.sparetrack.service.SupplierService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/supplier")
public class SupplierServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SupplierService supplierService;

    @Override
    public void init() throws ServletException {
        super.init();
        supplierService = new SupplierService();
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
            response.getWriter().println("window.location = '" + request.getContextPath() + "/dashboard';");
            response.getWriter().println("</script>");
            return;
        }

        if (action == null) {
            request.setAttribute("suppliers", supplierService.getAllSuppliers());
            request.getRequestDispatcher("app/suppliers/index.jsp").forward(request, response);
        } else if (action.equals("create")) {
            request.getRequestDispatcher("app/suppliers/create.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Supplier supplier = supplierService.getSupplier(id);
            request.setAttribute("supplier", supplier);
            request.getRequestDispatcher("app/suppliers/update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            supplierService.deleteSupplier(id);
            response.sendRedirect("supplier");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            String supplierName = request.getParameter("supplierName");
            String contactPerson = request.getParameter("contactPerson");
            String contactNumber = request.getParameter("contactNumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            Supplier supplier = new Supplier();
            supplier.setSupplierName(supplierName);
            supplier.setContactPerson(contactPerson);
            supplier.setContactNumber(contactNumber);
            supplier.setEmail(email);
            supplier.setAddress(address);

            if (supplierService.createSupplier(supplier)) {
                response.sendRedirect("supplier");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }

        } else if (action.equals("update")) {
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            String supplierName = request.getParameter("supplierName");
            String contactPerson = request.getParameter("contactPerson");
            String contactNumber = request.getParameter("contactNumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            Supplier supplier = new Supplier();
            supplier.setSupplierId(supplierId);
            supplier.setSupplierName(supplierName);
            supplier.setContactPerson(contactPerson);
            supplier.setContactNumber(contactNumber);
            supplier.setEmail(email);
            supplier.setAddress(address);

            if (supplierService.updateSupplier(supplier)) {
                response.sendRedirect("supplier");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}