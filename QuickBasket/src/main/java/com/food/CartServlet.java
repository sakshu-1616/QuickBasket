package com.food;

import java.io.IOException;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        HttpSession session = request.getSession();
        List<Integer> cart = (List<Integer>) session.getAttribute("cart");
        if (cart == null) { cart = new ArrayList<>(); session.setAttribute("cart", cart); }
        cart.add(id);
        response.sendRedirect("menu.jsp");
    }
}
