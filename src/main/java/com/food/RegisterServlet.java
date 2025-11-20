package com.food;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "INSERT INTO users(name,email,password) VALUES(?,?,?)")) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);

            ps.executeUpdate();
            res.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("register.jsp");
        }
    }
}
