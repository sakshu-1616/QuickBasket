package com.food;

import java.io.IOException;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RemoveCartServlet")
public class RemoveCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, javax.servlet.http.HttpServletResponse res)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        HttpSession s = req.getSession();
        List<Integer> cart = (List<Integer>) s.getAttribute("cart");

        if (cart != null) {
            cart.removeIf(item -> item == id);
        }

        res.sendRedirect("cart.jsp");
    }
}
