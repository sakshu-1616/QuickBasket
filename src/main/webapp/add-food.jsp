<!DOCTYPE html>
<html>
<head>
    <title>Add Food - QuickBasket</title>
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
<h2 style="text-align:center;">Add Food Item</h2>

<div style="width:350px;margin:20px auto;background:#fff;padding:16px;border:1px solid #ccc;">

    <form action="AddFoodServlet" method="post">
        <label>Food Name</label><br>
        <input type="text" name="name" required style="width:100%;"><br><br>

        <label>Price</label><br>
        <input type="number" name="price" required style="width:100%;" step="0.01"><br><br>

        <input type="submit" value="Add Food" class="btn">
    </form>

</div>
<%
if ("1".equals(request.getParameter("success"))) {
%>
<script>alert("Food Item Added Successfully!");</script>
<%
}
if ("1".equals(request.getParameter("error"))) {
%>
<script>alert("Error! Try again.");</script>
<%
}
%>


</body>
</html>
