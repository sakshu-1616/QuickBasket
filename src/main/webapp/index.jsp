<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>QuickBasket - Home</title>
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

<div class="box">
    <div style="text-align:center;">
        <img src="images/logo_1.png" alt="Logo" style="width:110px; margin-bottom:10px;">
        <h2>QuickBasket</h2>
        <p style="margin-bottom:14px;">Order food quickly. Simple and quick.</p>

        <div>
            <a href="login.jsp" class="btn">Login</a>
            <a href="register.jsp" class="btn">Register</a>
            <a href="admin-login.jsp" class="btn gray">Admin Login</a>
        </div>
    </div>
</div>

</body>
</html>
