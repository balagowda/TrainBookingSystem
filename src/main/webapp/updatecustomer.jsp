<%@page import="com.controller.CustomerController"%>
<%@page import="com.Model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String customerId = request.getParameter("customerId");
    Customer customer = null;

    if (customerId != null) {
    	CustomerController controller = new CustomerController();
        customer = controller.searchCustomer(Integer.parseInt(customerId));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Customer</title>
    <link rel="stylesheet" href="css/updatecustomer.css">
</head>
<body>
    <jsp:include page="Navbar.jsp" />
    <%
	String msg = (String) request.getAttribute("msg");
	%>
	<%
	if (msg != null) {
	%>
	<h3 align="center" style="margin-top:60px;">
		<span
			style="color: <%=msg.contains("successfully") ? "green" : "red"%>;">
			<%=msg%></span>
	</h3>
	<%} %>
    
    <div class="container">
        <h2 class="title">Update Customer</h2>
        <form action="CustomerServlet" method="get" onsubmit="return validateForm()">
            <input type="hidden" name="customerId" value="<%= customer.getUserId() %>">

            <label>User name:</label>
            <input type="text" name="username" id="username" value="<%= customer.getUserName() %>">
            <span id="usernameError" class="error"></span>

            <label>Mobile Number:</label>
            <input type="text" name="mobile" id="mobile" value="<%= customer.getContact() %>">
            <span id="mobileError" class="error"></span>

            <label>Email:</label>
            <input type="email" name="email" id="email" value="<%= customer.getEmail() %>">
            <span id="emailError" class="error"></span>

            <div class="password-toggle">
                <input type="checkbox" id="changePassword" onchange="togglePasswordFields()"> Change Password
            </div>

            <div id="passwordFields" style="display: none;">
                <label>New Password:</label>
                <input type="password" name="newPassword" id="newPassword">
                <span id="passwordError" class="error"></span>

                <label>Confirm Password:</label>
                <input type="password" name="confirmPassword" id="confirmPassword">
                <span id="confirmPasswordError" class="error"></span>
            </div>
				<input type="hidden" name="userPassword" value="<%= customer.getPassword() %>"/>
            <button name="action" value="UpdateByAdmin" type="submit" class="update-btn">Update</button>
        </form>

        <form action="CustomerServlet" method="post" onsubmit="return confirmDelete()">
            <input type="hidden" name="customerId" value="<%= customer.getUserId() %>">
            <button name="action" value="Delete" type="submit" class="delete-btn">Delete Customer</button>
        </form>
    </div>

    <script>
        function togglePasswordFields() {
            let passwordFields = document.getElementById("passwordFields");
            passwordFields.style.display = document.getElementById("changePassword").checked ? "block" : "none";
        }

        function validateForm() {
            let username = document.getElementById("username").value;
            let mobile = document.getElementById("mobile").value;
            let email = document.getElementById("email").value;
            let newPassword = document.getElementById("newPassword").value;
            let confirmPassword = document.getElementById("confirmPassword").value;
            let errors = false;

            // Username Validation (6+ characters, no special chars/numbers)
            if (username.length < 6 || /[^a-zA-Z]/.test(username)) {
                document.getElementById("usernameError").innerText = "Invalid username.";
                errors = true;
            } else {
                document.getElementById("usernameError").innerText = "";
            }

            // Mobile Number Validation (10 digits, starts with 6-9)
            if (!/^[6-9]\d{9}$/.test(mobile)) {
                document.getElementById("mobileError").innerText = "Invalid mobile number.";
                errors = true;
            } else {
                document.getElementById("mobileError").innerText = "";
            }

            // Email Validation
            if (!/^[^@]+@[^@]+\.[a-zA-Z]{2,}$/.test(email)) {
                document.getElementById("emailError").innerText = "Invalid email.";
                errors = true;
            } else {
                document.getElementById("emailError").innerText = "";
            }

            // Password Validation (if updating)
            if (document.getElementById("changePassword").checked) {
            	let passwordPattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                if (!passwordPattern.test(newPassword)) {
                    document.getElementById("passwordError").innerText = "password must have 1 upper, 1 lower, 1 speacial, 1 number";
                    errors = true;
                } else {
                    document.getElementById("passwordError").innerText = "";
                }

                if (newPassword !== confirmPassword) {
                    document.getElementById("confirmPasswordError").innerText = "Passwords do not match.";
                    errors = true;
                } else {
                    document.getElementById("confirmPasswordError").innerText = "";
                }
            }

            return !errors;
        }

        function confirmDelete() {
            return confirm("Are you sure you want to delete this customer?");
        }
    </script>
</body>
</html>
