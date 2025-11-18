package com.food;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws IOException {
        HttpSession s = request.getSession(false);
        if (s == null || s.getAttribute("email")==null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String email = (String) s.getAttribute("email");
        List<Integer> cart = (List<Integer>) s.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO orders(email,food_id) VALUES(?,?)")) {
            for (Integer fid : cart) {
                ps.setString(1, email);
                ps.setInt(2, fid);
                ps.executeUpdate();
            }
            s.removeAttribute("cart");
            response.sendRedirect("order.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp");
        }
    }
}
