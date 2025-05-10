package com.sparetrack.servlet;

import com.sparetrack.model.Admin;
import com.sparetrack.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // If already logged in, redirect to dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            request.getRequestDispatcher("/app/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = authenticateAdmin(email, password);

        if (admin != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", admin);
            session.setAttribute("userId", admin.getAdminId());
            session.setAttribute("name", admin.getFullName());
            session.setAttribute("role", admin.getRole());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            request.setAttribute("error", "Incorrect email or password!");
            request.getRequestDispatcher("/app/login.jsp").forward(request, response);
        }
    }

    private Admin authenticateAdmin(String email, String password) {
        List<Admin> admins = adminService.getAllAdmins();
        for (Admin admin : admins) {
            if (admin.getEmail().equalsIgnoreCase(email) && admin.getPassword().equals(password)) {
                return admin;
            }
        }
        return null;
    }
}