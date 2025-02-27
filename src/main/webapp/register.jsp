<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="css/register.css">
<link rel="stylesheet" href="css/navbar.css">
    <script>
        function validateForm() {
            let username = document.getElementById("username").value;
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirmPassword").value;
            let email = document.getElementById("email").value;
            let contact = document.getElementById("contact").value;
            let aadhar = document.getElementById("aadhar").value;
            let address = document.getElementById("address").value;
            let valid = true;

            let usernamePattern = /^[A-Za-z]{6,}$/;
            let passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            let emailPattern = /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/;
            let contactPattern = /^[6-9][0-9]{9}$/;
            let aadharPattern = /^[0-9]{12}$/;

            document.getElementById("userError").innerText = usernamePattern.test(username) ? "" : "user name can't be empty and do not have special chars";
            document.getElementById("passError").innerText = passwordPattern.test(password) ? "" : "password must have 1 upper, 1 lower, 1 speacial, 1 number";
            document.getElementById("confirmPassError").innerText = (password === confirmPassword && confirmPassword !== "") ? "" : "password not matching";
            document.getElementById("emailError").innerText = emailPattern.test(email) ? "" : "Invalid Email";
            document.getElementById("contactError").innerText = contactPattern.test(contact) ? "" : "Invalid Contact (Must start with 6-9 and be 10 digits)";
            document.getElementById("aadharError").innerText = aadharPattern.test(aadhar) ? "" : "Invalid Aadhar (Must be 12 digits)";
            document.getElementById("addressError").innerText = (address !== "" && address !== "null") ? "" : "Please enter valid address";

            return usernamePattern.test(username) && passwordPattern.test(password) && (password === confirmPassword) && emailPattern.test(email) && contactPattern.test(contact) && aadharPattern.test(aadhar);
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
 <% String msg=(String)request.getAttribute("MSG"); %>
 <%if(msg!=null){ %>
 <h3 align="center"><font color="red"><%=msg %></font></h3>
 <%} %>
	<div class="container">
        <h2 class="title">Register</h2>
        <form action="CustomerServlet" method="post" onsubmit="return validateForm()">
            <div class="input-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username">
                <span id="userError" class="error"></span>
            </div>
            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password">
                <span id="passError" class="error"></span>
            </div>
            <div class="input-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword">
                <span id="confirmPassError" class="error"></span>
            </div>
            <div class="input-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email">
                <span id="emailError" class="error"></span>
            </div>
            <div class="input-group">
                <label for="contact">Mobile Number:</label>
                <input type="text" id="contact" name="contact">
                <span id="contactError" class="error"></span>
            </div>
            <div class="input-group">
                <label for="aadhar">Aadhar Number:</label>
                <input type="text" id="aadhar" name="aadhar">
                <span id="aadharError" class="error"></span>
            </div>
            <div class="input-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address">
                <span id="addressError" class="error"></span>
            </div>
            <button name="action" value="Register" type="submit" class="btn">Register</button>
        </form>
        <p>Have an account?<a href="login.jsp">Login</a></p>
    </div>
</body>
</html>