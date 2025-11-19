package com.food;

import java.io.IOException;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, javax.servlet.http.HttpServletResponse res)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        int qty = Integer.parseInt(req.getParameter("qty"));

        HttpSession s = req.getSession();
        List<Integer> cart = (List<Integer>) s.getAttribute("cart");

        if (cart == null) {
            res.sendRedirect("cart.jsp");
            return;
        }

        // Remove old items for this product
        cart.removeIf(item -> item == id);

        // Add new qty
        for (int i = 0; i < qty; i++)
            cart.add(id);

        res.sendRedirect("cart.jsp");
    }
}
