<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile - QuickBasket</title>
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

<div style="width:420px;margin:40px auto;background:#fff;padding:14px;border:1px solid #ccc;">
    <h3>Your Profile</h3>
    <p><strong>Name:</strong> <%= session.getAttribute("name") != null ? session.getAttribute("name") : "-" %></p>
    <p><strong>Email:</strong> <%= session.getAttribute("email") != null ? session.getAttribute("email") : "-" %></p>
    <p><strong>Role:</strong> <%= session.getAttribute("role") != null ? session.getAttribute("role") : "visitor" %></p>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
