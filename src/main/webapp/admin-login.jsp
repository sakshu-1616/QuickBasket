<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login - QuickBasket</title>
    <link rel="stylesheet" href="css/style.css">
       <style>
        body {
            background: url("images/back_4.jpg") no-repeat center center fixed;
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
