<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>QuickBasket - Menu</title>
    <link rel="stylesheet" href="css/menu.css">
    
</head>
<body>

<%@ include file="includes/header.jsp" %>

<h2>Food Menu</h2>

<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>Food</th>
        <th>Price</th>
        <th>Action</th>
    </tr>

<%
    java.util.ArrayList<Integer> ids = (java.util.ArrayList<Integer>) request.getAttribute("ids");
    java.util.ArrayList<String> names = (java.util.ArrayList<String>) request.getAttribute("names");
    java.util.ArrayList<Double> prices = (java.util.ArrayList<Double>) request.getAttribute("prices");

    if (ids != null) {
        for (int i = 0; i < ids.size(); i++) {
%>
    <tr>
        <td><%= names.get(i) %></td>
        <td>₹<%= prices.get(i) %></td>
        <td><a href="CartServlet?id=<%= ids.get(i) %>">Add to Cart</a></td>
    </tr>
<%
        }
    }
%>
</table>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
