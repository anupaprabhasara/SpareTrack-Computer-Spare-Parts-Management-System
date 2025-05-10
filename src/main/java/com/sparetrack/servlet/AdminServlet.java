package com.sparetrack.servlet;

import com.sparetrack.model.Admin;
import com.sparetrack.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        super.init();
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

        // Role check
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
            request.setAttribute("admins", adminService.getAllAdmins());
            request.getRequestDispatcher("app/admins/index.jsp").forward(request, response);
        } else if (action.equals("create")) {
            request.getRequestDispatcher("app/admins/create.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin = adminService.getAdmin(id);
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("app/admins/update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            adminService.deleteAdmin(id);
            response.sendRedirect("admin");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullName = request.getParameter("fullName");
            String role = request.getParameter("role");
            String email = request.getParameter("email");

            Admin admin = new Admin();
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setFullName(fullName);
            admin.setRole(role);
            admin.setEmail(email);

            if (adminService.createAdmin(admin)) {
                response.sendRedirect("admin");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullName = request.getParameter("fullName");
            String role = request.getParameter("role");
            String email = request.getParameter("email");

            Admin admin = new Admin();
            admin.setAdminId(id);
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setFullName(fullName);
            admin.setRole(role);
            admin.setEmail(email);

            if (adminService.updateAdmin(admin)) {
                response.sendRedirect("admin");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}