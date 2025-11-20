<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>My Orders - QuickBasket</title>
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

<div style="width:700px;margin:20px auto;background:#fff;padding:15px;border:1px solid #ccc;">
<h3>My Orders</h3>

<table border="1" cellpadding="6" cellspacing="0" style="width:100%;border-collapse:collapse;">
<tr>
    <th>Order ID</th>
    <th>Food</th>
    <th>Price</th>
    <th>Date</th>
</tr>

<%
String email = (String) session.getAttribute("email");
Connection con=null; PreparedStatement ps=null; ResultSet rs=null;

try {
    con = com.food.DBConnection.getConnection();
    ps = con.prepareStatement(
        "SELECT o.id,f.name,f.price,o.order_time FROM orders o " +
        "JOIN food_items f ON o.food_id=f.id " +
        "WHERE o.user_email=? ORDER BY o.id DESC");

    ps.setString(1, email);
    rs = ps.executeQuery();

    while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td>RS. <%= rs.getDouble("price") %></td>
    <td><%= rs.getTimestamp("order_time") %></td>
</tr>

<%
    }
} catch(Exception e){ e.printStackTrace(); }
finally { try{ if(rs!=null)rs.close(); if(ps!=null)ps.close(); if(con!=null)con.close(); } catch(Exception ex){} }
%>

</table>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
