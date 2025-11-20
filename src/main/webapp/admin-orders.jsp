<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Orders - QuickBasket</title>
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
<h2 style="text-align:center;">All User Orders</h2>

<div style="width:900px;margin:20px auto;background:#fff;padding:15px;border:1px solid #ccc;">

<table border="1" cellpadding="6" cellspacing="0"
       style="width:100%;border-collapse:collapse;">

<tr>
    <th>Order ID</th>
    <th>User Name</th>
    <th>Email</th>
    <th>Food</th>
    <th>Price</th>
    <th>Date</th>
    <th>Action</th>
</tr>

<%
Connection con=null; PreparedStatement ps=null; ResultSet rs=null;

try {
    con = com.food.DBConnection.getConnection();
    ps = con.prepareStatement(
        "SELECT o.id, u.name AS uname, u.email, f.name, f.price, o.order_time " +
        "FROM orders o " +
        "JOIN users u ON o.user_email=u.email " +
        "JOIN food_items f ON o.food_id=f.id " +
        "ORDER BY o.id DESC");

    rs = ps.executeQuery();

    while (rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("uname") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("name") %></td>
    <td>RS. <%= rs.getDouble("price") %></td>
    <td><%= rs.getTimestamp("order_time") %></td>

    <td>
        <form action="<%=request.getContextPath()%>/DeleteOrderServlet"
              method="post" style="margin:0;">
            <input type="hidden" name="orderId" value="<%= rs.getInt("id") %>">
            <input type="submit" value="Delete" class="btn"
                   style="background:#900;">
        </form>
    </td>
</tr>

<%
    }
} catch(Exception e){ e.printStackTrace(); }
finally { try{
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
} catch(Exception ex){} }
%>

</table>

</div>

</body>
</html>
