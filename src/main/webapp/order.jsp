<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Placed - QuickBasket</title>
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

<div style="width:520px;margin:40px auto;background:#fff;padding:14px;border:1px solid #ccc;text-align:center;">
    <h3>Order Confirmed</h3>
    <p>Thank you! Your order has been placed.</p>
    <a href="menu.jsp" class="btn">Back to Menu</a>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
