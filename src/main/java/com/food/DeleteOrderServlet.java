package com.food;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int orderId = Integer.parseInt(req.getParameter("orderId"));

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "DELETE FROM orders WHERE id=?")) {

            ps.setInt(1, orderId);
            ps.executeUpdate();

            res.sendRedirect("admin-orders.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("admin-orders.jsp");
        }
    }
}
