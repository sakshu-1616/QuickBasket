package com.food;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddFoodServlet")
public class AddFoodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, javax.servlet.http.HttpServletResponse res)
            throws IOException {

        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "INSERT INTO food_items(name, price) VALUES(?,?)")) {

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.executeUpdate();

            res.sendRedirect("add-food.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("add-food.jsp?error=1");
        }
    }
}
