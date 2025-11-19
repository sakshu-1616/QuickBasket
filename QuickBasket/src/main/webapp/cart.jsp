<%@ page import="java.util.*,java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart - QuickBasket</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%@ include file="includes/header.jsp" %>

<div style="width:650px;margin:30px auto;background:#fff;padding:14px;border:1px solid #ccc;">
    <h3>Your Cart</h3>

    <%
        List<Integer> cart = (List<Integer>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
    %>
        <p>Your cart is empty.</p>
    <%
        } else {

            double total = 0;
    %>

    <table border="1" cellpadding="8" cellspacing="0" style="width:100%;border-collapse:collapse;">
        <tr>
            <th>Food</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <%
            Connection con=null; PreparedStatement ps=null; ResultSet rs=null;

            try {
                con = com.food.DBConnection.getConnection();
                ps = con.prepareStatement("SELECT name,price FROM food_items WHERE id=?");

                Map<Integer, Integer> qtyMap = new HashMap<>();

                for (Integer id : cart)
                    qtyMap.put(id, qtyMap.getOrDefault(id,0) + 1);

                for (Integer id : qtyMap.keySet()) {

                    ps.setInt(1, id);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        double price = rs.getDouble("price");
                        int qty = qtyMap.get(id);

                        total += price * qty;
        %>

        <tr>
            <td><%= rs.getString("name") %></td>
            <td>RS. <%= price %></td>
            <td><%= qty %></td>

            <!-- UPDATE -->
            <td>
                <form action="<%=request.getContextPath()%>/UpdateCartServlet" method="post" style="margin:0;">
                    <input type="hidden" name="id" value="<%= id %>">
                    <input type="number" name="qty" value="<%= qty %>" min="1" style="width:50px;">
                    <input type="submit" value="Update" class="btn">
                </form>
            </td>

            <!-- DELETE -->
            <td>
                <form action="<%=request.getContextPath()%>/RemoveCartServlet" method="post" style="margin:0;">
                    <input type="hidden" name="id" value="<%= id %>">
                    <input type="submit" value="Remove" class="btn" style="background:#900;">
                </form>
            </td>
        </tr>

        <%
                    }
                    rs.close();
                }

            } catch(Exception e){ e.printStackTrace(); }
            finally { try{ if(ps!=null) ps.close(); if(con!=null) con.close(); }catch(Exception ex){} }
        %>

        <tr>
            <td colspan="4" style="text-align:right;"><strong>Total:</strong></td>
            <td>RS. <%= total %></td>
        </tr>

    </table>

    <form action="<%=request.getContextPath()%>/OrderServlet" method="post" style="margin-top:10px;">
        <input type="submit" value="Place Order" class="btn">
    </form>

    <%
        }
    %>

</div>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
