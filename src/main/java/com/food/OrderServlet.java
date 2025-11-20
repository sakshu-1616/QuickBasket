package com.food;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, javax.servlet.http.HttpServletResponse res)
            throws IOException {

        HttpSession s = req.getSession();
        String email = (String) s.getAttribute("email");
        var cart = (java.util.List<Integer>) s.getAttribute("cart");

        if (email == null || cart == null || cart.isEmpty()) {
            res.sendRedirect("cart.jsp");
            return;
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "INSERT INTO orders(user_email, food_id) VALUES(?,?)")) {

            for (Integer id : cart) {
                ps.setString(1, email);
                ps.setInt(2, id);
                ps.executeUpdate();
            }

            // clear cart
            s.removeAttribute("cart");

            // redirect with popup message
            res.sendRedirect("cart.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("cart.jsp?error=1");
        }
    }
}
