<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login - QuickBasket</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@ include file="includes/header.jsp" %>

<div style="width:320px;margin:40px auto;background:#fff;padding:16px;border:1px solid #ccc;">
    <h3>Admin Login</h3>
    <form action="AdminLoginServlet" method="post">
        <label>Admin Email</label><br>
        <input type="email" name="email" required style="width:100%;"><br><br>
        <label>Password</label><br>
        <input type="password" name="password" required style="width:100%;"><br><br>
        <input type="submit" value="Admin Login" class="btn">
    </form>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
