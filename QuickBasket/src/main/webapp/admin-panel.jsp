<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - QuickBasket</title>
    <link rel="stylesheet" href="css/style.css">
       <style>
        body {
            background: url("images/back.png") no-repeat center center fixed;
            background-size: cover;
        }
        .box {
            width: 360px;
            margin: 120px auto;
            background: #fff;
            padding: 22px;
            border: 1px solid #ccc;
        }
        .btn { display:inline-block; padding:8px 14px; background:#000; color:#fff; text-decoration:none; margin:6px; }
        .btn.gray { background:#444; }
    </style>
</head>
<body>
<%@ include file="includes/header.jsp" %>

<%
    if (!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<div style="width:760px;margin:30px auto;background:#fff;padding:14px;border:1px solid #ccc;">
    <h3>Admin Panel</h3>

    <h4>Add Food Item</h4>
    <form action="AddFoodServlet" method="post" style="margin-bottom:12px;">
        <input type="text" name="name" placeholder="Food name" required style="width:50%;">
        <input type="text" name="price" placeholder="Price" required style="width:30%;">
        <input type="submit" value="Add" class="btn">
    </form>

    <h4>Food Items</h4>
    <table border="1" cellpadding="6" cellspacing="0" style="width:100%;border-collapse:collapse;">
        <tr><th>ID</th><th>Name</th><th>Price</th></tr>
        <%
            Connection con = null; PreparedStatement ps = null; ResultSet rs = null;
            try {
                con = com.food.DBConnection.getConnection();
                ps = con.prepareStatement("SELECT id,name,price FROM food_items");
                rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td>rs<%= rs.getDouble("price") %></td>
        </tr>
        <%
                }
            } catch(Exception e) { e.printStackTrace(); }
            finally { try{ if(rs!=null) rs.close(); if(ps!=null) ps.close(); if(con!=null) con.close(); } catch(Exception ex){} }
        %>
    </table>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
