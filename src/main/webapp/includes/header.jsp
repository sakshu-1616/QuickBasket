<%@ page session="true" %>
<div style="background:#222;color:#fff;padding:10px;">
    <img src="images/logo_1.png" style="height:36px;vertical-align:middle;margin-right:10px;">
    <span style="font-weight:bold;">QuickBasket</span>

    <span style="float:right;">
        <a href="menu.jsp" style="color:#fff;margin-right:12px;text-decoration:none;">Menu</a>
        <a href="cart.jsp" style="color:#fff;margin-right:12px;text-decoration:none;">Cart</a>
        <a href="profile.jsp" style="color:#fff;margin-right:12px;text-decoration:none;">Profile</a>
        <a href="my-orders.jsp" style="color:#fff;margin-right:12px;text-decoration:none;">My Orders</a>
        <%
if ("admin".equals(session.getAttribute("role"))) {
%>
    <a href="admin-orders.jsp">Admin Orders</a>
<%
}
%>
        
        <%
            if (session.getAttribute("email") == null) {
        %>
            <a href="login.jsp" style="color:#fff;text-decoration:none;">Login</a>
        <%
            } else {
        %>
            <a href="LogoutServlet" style="color:#fff;text-decoration:none;">Logout</a>
        <%
            }
        %>
    </span>
</div>
