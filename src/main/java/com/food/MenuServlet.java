package com.food;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<String> foodNames = new ArrayList<>();
        ArrayList<Double> foodPrices = new ArrayList<>();
        ArrayList<Integer> foodIds = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM food_items");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                foodIds.add(rs.getInt("id"));
                foodNames.add(rs.getString("name"));
                foodPrices.add(rs.getDouble("price"));
            }

            request.setAttribute("ids", foodIds);
            request.setAttribute("names", foodNames);
            request.setAttribute("prices", foodPrices);

            RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
