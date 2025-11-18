<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu - QuickBasket</title>
    <link rel="stylesheet" href="css/menu.css">
</head>
<body>
<%@ include file="includes/header.jsp" %>

<div style="width:760px;margin:20px auto;background:#fff;padding:14px;border:1px solid #ccc;">
    <h3>Menu</h3>
    <table border="1" cellpadding="6" cellspacing="0" style="width:100%;border-collapse:collapse;">
        <tr><th>Food</th><th>Price</th><th>Action</th></tr>
        <%
            Connection con=null; PreparedStatement ps=null; ResultSet rs=null;
            try {
                con = com.food.DBConnection.getConnection();
                ps = con.prepareStatement("SELECT id,name,price FROM food_items ORDER BY id");
                rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td>₹<%= rs.getDouble("price") %></td>
            <td>
                <form action="CartServlet" method="post" style="margin:0;">
                    <input type="hidden" name="id" value="<%= id %>">
                    <input type="submit" value="Add to Cart" class="btn">
                </form>
            </td>
        </tr>
        <%
                }
            } catch(Exception e){ e.printStackTrace(); }
            finally { try{ if(rs!=null) rs.close(); if(ps!=null) ps.close(); if(con!=null) con.close(); }catch(Exception ex){} }
        %>
    </table>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
