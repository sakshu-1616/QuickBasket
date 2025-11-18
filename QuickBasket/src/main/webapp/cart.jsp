<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>QuickBasket - Cart</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%@ include file="includes/header.jsp" %>

<h2>Your Cart</h2>

<%
    String item = (String) session.getAttribute("cart_item");
    if (item == null) {
%>
    <p style="text-align:center;">Your cart is empty.</p>
<%
    } else {
%>
    <p style="text-align:center;">You have 1 item in your cart.</p>

    <div style="text-align:center; margin-top:20px;">
        <form action="OrderServlet" method="post">
            <button type="submit">Place Order</button>
        </form>
    </div>
<%
    }
%>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
