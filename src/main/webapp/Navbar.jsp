<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/navbar.css">
</head>
<body>
    <nav class="navbar">
        <div class="logo">
            <img src="https://img.icons8.com/ios-filled/50/ffffff/train.png" alt="Train Logo">
            <h2 class="h2">TrainBooking</h2>
        </div>
        <div class="nav-links">
            <a href="home.jsp" class="nav-link">Home</a>
            <a href="#" class="nav-link">Contact Us</a>
            <form action="CustomerServlet" method="get">
            	<button type="submit" name="action" value="Logout" class="lbtn logout">Logout</button>
        	</form>
        </div>
    </nav>
</body>
</html>