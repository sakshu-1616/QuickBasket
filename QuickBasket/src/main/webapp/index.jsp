<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>QuickBasket - Home</title>
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>

<%@ include file="includes/header.jsp" %>

<h2>Welcome to QuickBasket</h2>
<p>Your food delivery partner.</p>

<!-- Login Button -->
<a href="login.jsp" 
   style="padding:10px 20px; background:#28a745; color:white; text-decoration:none;">
   Login to Continue
</a>

<!-- If user already logged in show Menu -->
<%
    if (session.getAttribute("email") != null) {
%>
    <br><br>
    <a href="menu.jsp"
       style="padding:10px 20px; background:#007bff; color:white; text-decoration:none;">
       Go to Menu
    </a>
<%
    }
%>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
