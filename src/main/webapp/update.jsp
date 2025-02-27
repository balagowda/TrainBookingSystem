<%@page import="com.Model.Customer"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
           Customer c = (Customer) session.getAttribute("user");
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Update Profile</title>
    <link rel="stylesheet" type="text/css" href="css/update.css">
    <script>
        function togglePasswordFields() {
            var checkbox = document.getElementById("updatePassword");
            var passwordFields = document.getElementById("passwordFields");
            passwordFields.style.display = checkbox.checked ? "block" : "none";
        }

        function validateForm(event) {
        	var currentPassword = document.getElementsByName("currentPassword")[0].value;
            var newPassword = document.getElementsByName("newPassword")[0].value;
            var confirmNewPassword = document.getElementsByName("confirmNewPassword")[0].value;
            var email = document.getElementsByName("email")[0].value;
            var address = document.getElementsByName("address")[0].value;
            var contact = document.getElementsByName("contact")[0].value;
            var aadhar = document.getElementsByName("aadhar")[0].value;
            var storedPassword = "<%= c.getPassword() %>";
            
            var passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var contactRegex = /^[6-9]\d{9}$/;
            var aadharRegex = /^[0-9]{12}$/;
            
            document.getElementById("emailError").innerText = "";
            document.getElementById("contactError").innerText = "";
            document.getElementById("currentPasswordError").innerText = "";
            document.getElementById("newPasswordError").innerText = "";
            document.getElementById("confirmNewPasswordError").innerText = "";
            document.getElementById("addressError").innerText = "";
            document.getElementById("aadharError").innerText = "";

            if (!emailRegex.test(email)) {
                document.getElementById("emailError").innerText = "Invalid email format.";
                event.preventDefault();
                return false;
            }
            if(address==="" || address==="null"){
            	document.getElementById("addressError").innerText = "Invalid address.";
            	event.preventDefault();
                return false;
            }
            if (!contactRegex.test(contact)) {
                document.getElementById("contactError").innerText = "Contact must start with 6-9 and be 10 digits long.";
                event.preventDefault();
                return false;
            }
            if (!aadharRegex.test(aadhar)) {
                document.getElementById("aadharError").innerText = "Invalid Aadhar (Must be 12 digits)";
                event.preventDefault();
                return false;
            }
            

            if (document.getElementById("updatePassword").checked) {
                if (currentPassword === "" || newPassword === "" || confirmNewPassword === "") {
                    document.getElementById("currentPasswordError").innerText = "All password fields are required.";
                    event.preventDefault();
                    return false;
                }
                if (newPassword !== confirmNewPassword) {
                    document.getElementById("confirmNewPasswordError").innerText = "New Password and Confirm Password must match.";
                    event.preventDefault();
                    return false;
                }
                if (!passwordRegex.test(newPassword)) {
                    document.getElementById("newPasswordError").innerText = "New Password must be at least 8 characters long, contain an uppercase letter, a number, and a special character.";
                    event.preventDefault();
                    return false;
                }
                if (currentPassword !== storedPassword) {
                    document.getElementById("currentPasswordError").innerText = "Current Password does not match.";
                    event.preventDefault();
                    return false;
                }
            }
        }
    </script>
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<%
		String msg = (String) request.getAttribute("msg");
	%>
	<%
		if (msg != null) {
	%>
	<h3 align="center">
		<span
			style="color: <%=msg.contains("successfully") ? "green" : "red"%>;">
			<%=msg%></span>
	</h3>
	<%} %>
	<div class="container">
        <h2 class="title">Update Profile</h2>
        <form action="CustomerServlet" method="get" onsubmit="validateForm(event)" class="update-form">
            <label>Username:</label>
            <input type="text" name="username" value="<%= c.getUserName() %>" readonly>
            
            <label>Email:</label>
            <input type="email" name="email" value="<%= c.getEmail() %>">
            <span id="emailError" class="error"></span>
            
            <label>Address:</label>
            <input type="text" name="address" value="<%= c.getAddress() %>">
            <span id="addressError" class="error"></span>
            
            <label>Contact:</label>
            <input type="text" name="contact" value="<%= c.getContact() %>">
            <span id="contactError" class="error"></span>
            
            <label>Aadhar:</label>
            <input type="text" name="aadhar" value="<%= c.getAadhar() %>">
            <span id="aadharError" class="error"></span>
            
            <label>
                <input type="checkbox" id="updatePassword" onclick="togglePasswordFields()"> Update Password
            </label>
            
            <div id="passwordFields" style="display: none;">
                <label>Current Password:</label>
                <input type="password" name="currentPassword">
                <span id="currentPasswordError" class="error"></span>
                
                <label>New Password:</label>
                <input type="password" name="newPassword">
                <span id="newPasswordError" class="error"></span>
                
                <label>Confirm New Password:</label>
                <input type="password" name="confirmNewPassword">
                <span id="confirmNewPasswordError" class="error"></span>
            </div>
            
            <button name="action" value="Update" type="submit" class="btn">Update</button>
        </form>
    </div>
</body>
</html>