<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel - QuickBasket</title>
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
<%@ include file="includes/header.jsp" %>
<h2 style="text-align:center;">Admin Panel</h2>

<div style="width:400px;margin:30px auto;background:#fff;padding:20px;border:1px solid #ccc;">

    <a href="admin-orders.jsp" class="btn" style="display:block;margin-bottom:10px;">
        View All Orders
    </a>

    <a href="add-food.jsp" class="btn" style="display:block;margin-bottom:10px;">
        Add Food Item
    </a>

    <a href="menu.jsp" class="btn" style="display:block;margin-bottom:10px;">
        View Menu
    </a>

    <a href="LogoutServlet" class="btn" style="display:block;background:#900;">
        Logout
    </a>

</div>

</body>
</html>
