<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data not found</title>
<link rel="stylesheet" type="text/css" href="css/failure.css">
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="failure-container">
        <h1>No Data Found!</h1>
        <img src="img/train1.png" alt="Failure Image">
        <p><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "Something went wrong. Please try again!" %></p>
    </div>
</body>
</html>