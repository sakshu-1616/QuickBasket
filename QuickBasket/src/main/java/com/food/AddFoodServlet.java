package com.food;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddFoodServlet")
public class AddFoodServlet extends HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws IOException {
        HttpSession s = request.getSession(false);
        if (s == null || !"admin".equals(s.getAttribute("role"))) {
            response.sendRedirect("admin-login.jsp");
            return;
        }
        String name = request.getParameter("name").trim();
        String priceStr = request.getParameter("price").trim();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO food_items(name,price) VALUES(?,?)")) {
            ps.setString(1, name);
            ps.setDouble(2, Double.parseDouble(priceStr));
            ps.executeUpdate();
            response.sendRedirect("admin-panel.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-panel.jsp");
        }
    }
}
