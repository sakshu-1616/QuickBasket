<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>QuickBasket - Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%@ include file="includes/header.jsp" %>

<h2>Your Profile</h2>

<div style="width:300px; margin:auto; background:white; padding:20px;">

<p><strong>Name:</strong> <%= session.getAttribute("name") %></p>
<p><strong>Email:</strong> <%= session.getAttribute("email") %></p>

</div>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
