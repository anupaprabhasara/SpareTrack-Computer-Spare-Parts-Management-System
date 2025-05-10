package com.sparetrack.servlet;

import com.sparetrack.model.UsageLog;
import com.sparetrack.model.SparePart;
import com.sparetrack.model.Admin;
import com.sparetrack.service.UsageLogService;
import com.sparetrack.service.SparePartService;
import com.sparetrack.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/usage")
public class UsageLogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UsageLogService usageLogService;
    private SparePartService sparePartService;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        usageLogService = new UsageLogService();
        sparePartService = new SparePartService();
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
            request.setAttribute("usages", usageLogService.getAllUsageLogs());
            request.getRequestDispatcher("app/usages/index.jsp").forward(request, response);
        } else if (action.equals("create")) {
            populateReferenceData(request);
            request.getRequestDispatcher("app/usages/create.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            UsageLog log = usageLogService.getUsageLog(id);
            request.setAttribute("log", log);
            populateReferenceData(request);
            request.getRequestDispatcher("app/usages/update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            usageLogService.deleteUsageLog(id);
            response.sendRedirect("usage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            int partId = Integer.parseInt(request.getParameter("partId"));
            int quantityUsed = Integer.parseInt(request.getParameter("quantityUsed"));
            int usedBy = Integer.parseInt(request.getParameter("usedBy"));
            String usageContext = request.getParameter("usageContext");
            String usageDate = request.getParameter("usageDate");

            UsageLog log = new UsageLog();
            log.setPartId(partId);
            log.setQuantityUsed(quantityUsed);
            log.setUsedBy(usedBy);
            log.setUsageContext(usageContext);
            log.setUsageDate(usageDate);

            if (usageLogService.createUsageLog(log)) {
                response.sendRedirect("usage");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }

        } else if (action.equals("update")) {
            int usageId = Integer.parseInt(request.getParameter("usageId"));
            int partId = Integer.parseInt(request.getParameter("partId"));
            int quantityUsed = Integer.parseInt(request.getParameter("quantityUsed"));
            int usedBy = Integer.parseInt(request.getParameter("usedBy"));
            String usageContext = request.getParameter("usageContext");
            String usageDate = request.getParameter("usageDate");

            UsageLog log = new UsageLog();
            log.setUsageId(usageId);
            log.setPartId(partId);
            log.setQuantityUsed(quantityUsed);
            log.setUsedBy(usedBy);
            log.setUsageContext(usageContext);
            log.setUsageDate(usageDate);

            if (usageLogService.updateUsageLog(log)) {
                response.sendRedirect("usage");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }

    private void populateReferenceData(HttpServletRequest request) {
        List<SparePart> parts = sparePartService.getAllSpareParts();
        List<Admin> admins = adminService.getAllAdmins();

        request.setAttribute("parts", parts);
        request.setAttribute("admins", admins);
    }
}