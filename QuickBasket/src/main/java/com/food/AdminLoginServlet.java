package com.food;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws IOException {
        String email = request.getParameter("email").trim();
        String pass = request.getParameter("password").trim();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT name FROM users WHERE email=? AND password=? AND role='admin'")) {
            ps.setString(1, email);
            ps.setString(2, pass);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("email", email);
                    session.setAttribute("name", rs.getString("name"));
                    session.setAttribute("role", "admin");
                    response.sendRedirect("admin-panel.jsp");
                } else {
                    response.sendRedirect("admin-login.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-login.jsp");
        }
    }
}
