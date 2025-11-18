package com.food;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddFoodServlet")
public class AddFoodServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String price = request.getParameter("price");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO food_items(name,price) VALUES(?,?)");

            ps.setString(1, name);
            ps.setString(2, price);

            ps.executeUpdate();
            response.sendRedirect("menu.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
