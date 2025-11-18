package com.food;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String item = (String) session.getAttribute("cart_item");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO orders(email,food_id) VALUES(?,?)");

            ps.setString(1, email);
            ps.setString(2, item);

            ps.executeUpdate();
            response.sendRedirect("order.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
