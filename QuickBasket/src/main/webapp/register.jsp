<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>QuickBasket - Register</title>
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>
<%@ include file="includes/header.jsp" %>

<h2>Create Account</h2>

<form action="RegisterServlet" method="post">
    Name: <input type="text" name="name"><br><br>
    Email: <input type="text" name="email"><br><br>
    Password: <input type="password" name="password"><br><br>
    <button type="submit">Register</button>
</form>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
