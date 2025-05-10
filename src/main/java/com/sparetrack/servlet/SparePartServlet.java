package com.sparetrack.servlet;

import com.sparetrack.model.SparePart;
import com.sparetrack.service.SparePartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/part")
public class SparePartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SparePartService sparePartService;

    @Override
    public void init() throws ServletException {
        super.init();
        sparePartService = new SparePartService();
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

        if (action == null) {
            request.setAttribute("parts", sparePartService.getAllSpareParts());
            request.getRequestDispatcher("app/parts/index.jsp").forward(request, response);
        } else if (action.equals("create")) {
            request.getRequestDispatcher("app/parts/create.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            SparePart part = sparePartService.getSparePart(id);
            request.setAttribute("part", part);
            request.getRequestDispatcher("app/parts/update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            sparePartService.deleteSparePart(id);
            response.sendRedirect("part");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            String partName = request.getParameter("partName");
            String category = request.getParameter("category");
            String modelNumber = request.getParameter("modelNumber");
            String brand = request.getParameter("brand");
            int quantityInStock = Integer.parseInt(request.getParameter("quantityInStock"));
            double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
            String description = request.getParameter("description");

            SparePart part = new SparePart();
            part.setPartName(partName);
            part.setCategory(category);
            part.setModelNumber(modelNumber);
            part.setBrand(brand);
            part.setQuantityInStock(quantityInStock);
            part.setUnitPrice(unitPrice);
            part.setDescription(description);

            if (sparePartService.createSparePart(part)) {
                response.sendRedirect("part");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }

        } else if (action.equals("update")) {
            int partId = Integer.parseInt(request.getParameter("partId"));
            String partName = request.getParameter("partName");
            String category = request.getParameter("category");
            String modelNumber = request.getParameter("modelNumber");
            String brand = request.getParameter("brand");
            int quantityInStock = Integer.parseInt(request.getParameter("quantityInStock"));
            double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
            String description = request.getParameter("description");

            SparePart part = new SparePart();
            part.setPartId(partId);
            part.setPartName(partName);
            part.setCategory(category);
            part.setModelNumber(modelNumber);
            part.setBrand(brand);
            part.setQuantityInStock(quantityInStock);
            part.setUnitPrice(unitPrice);
            part.setDescription(description);

            if (sparePartService.updateSparePart(part)) {
                response.sendRedirect("part");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}