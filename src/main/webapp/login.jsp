<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - TrainBooking</title>
   <link rel="stylesheet" type="text/css" href="css/login.css">
   <link rel="stylesheet" href="css/navbar.css">
    <script>
    function validateForm(event) {
        let username = document.getElementById("username").value;
        let password = document.getElementById("password").value;
        let valid = true;

        if (username.trim() === "") {
            document.getElementById("userError").innerText = "Username cannot be empty";
            valid = false;
        } else {
            document.getElementById("userError").innerText = "";
        }

        if (password.trim() === "") {
            document.getElementById("passError").innerText = "Password cannot be empty";
            valid = false;
        } else {
            document.getElementById("passError").innerText = "";
        }

        if (!valid) {
            event.preventDefault(); // Only stop submission when validation fails
        }
    }
    </script>
</head>
<body>
	<div class="nav-container">
    	<nav class="navbar">
        <div class="logo">
            <img src="https://img.icons8.com/ios-filled/50/ffffff/train.png" alt="Train Logo">
            <h2 class="h2">TrainBooking</h2>
        </div>
        <div class="nav-links">
            <a href="index.jsp" class="nav-link">Home</a>
            <a href="#" class="nav-link">Contact Us</a>
        </div>
    </nav>
    </div>
    <% String msg = (String)request.getAttribute("MSG"); %>
    <% if (msg != null) { %>
        <h3>
            <span style="color: <%= msg.contains("successfully") ? "#00ff00" : "#ff416c" %>;">
                <%= msg %>
            </span>
        </h3>
    <% } %>
    <div class="container">
        <h2 class="title">Login</h2>
        <form action="CustomerServlet" method="get" onsubmit="return validateForm(event)">
            <div class="input-group">
                <label for="username">User name:</label>
                <input type="text" id="username" name="username">
                <span id="userError" class="error"></span>
            </div>
            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password">
                <span id="passError" class="error"></span>
            </div>
            <button name="action" value="Login" type="submit" class="btn">Login</button>
        </form>
        <p>Don't have an account? <a href="register.jsp">Register</a></p>
    </div>
</body>
</html>