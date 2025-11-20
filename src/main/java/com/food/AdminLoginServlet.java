package com.food;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, javax.servlet.http.HttpServletResponse res)
            throws IOException {

        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "SELECT name FROM admins WHERE email=? AND password=?")) {

            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession s = req.getSession();
                s.setAttribute("email", email);
                s.setAttribute("name", rs.getString("name"));
                s.setAttribute("role", "admin");

                res.sendRedirect("admin-panel.jsp");
            } else {
                res.sendRedirect("admin-login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("admin-login.jsp");
        }
    }
}
