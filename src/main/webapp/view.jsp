<%@page import="java.util.List"%>
<%@page import="com.Model.Train"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Train</title>
	<link rel="stylesheet" type="text/css" href="css/view.css">
</head>
<body>
	<% List<Train> trains = (List<Train>) request.getAttribute("trains"); 
		String from=(String)request.getAttribute("from");
		String to=(String)request.getAttribute("to");
	%>
	<jsp:include page="Navbar.jsp" />
	<div class="search-container">
		<form action="TrainServlet" method="GET">
			<input type="text" name="from" placeholder="From" required value="<%= from!=null? from: "" %>"> <input
				type="text" name="to" placeholder="To" required value="<%= to!=null? to: "" %>">
			<button name="action" value="Search" type="submit">Search</button>
		</form>
	</div>
	<% for(Train t: trains){ %>
	<div class="container train-details">
		<div class="train-info-box">
			<div class="train-header">
				<div class="timing-info">
					<p>
						<strong>Train Number:</strong>
						<%= t.getTrainNumber() %></p>
				</div>
				<div class="timing-info">
					<p>
						<strong>Arrival Time:</strong>
						<%= t.getArrivalTime() %></p>
					<p>
						<strong>Departure:</strong>
						<%= t.getDepartureTime() %></p>
				</div>
			</div>
			<div class="train-info">
				<div class="left-section">
					<p>
						<strong>Origin:</strong>
						<%= t.getOriginStation() %></p>
				</div>
				<div class="separator"></div>
				<div class="right-section">
					<p>
						<strong>Destination:</strong>
						<%= t.getDestinationStation() %></p>
				</div>
			</div>
			<div class="parent">
				<div class="child">
					<p class="name">Ac 1</p>
					<p class="class"><%= t.getFareAc1() %></p>
				</div>
				<div class="child">
					<p class="name">Ac 2</p>
					<p class="class"><%= t.getFareAc2() %></p>
				</div>
				<div class="child">
					<p class="name">Ac 3</p>
					<p class="class"><%= t.getFareAc3() %></p>
				</div>
				<div class="child">
					<p class="name">First Class</p>
					<p class="class"><%= t.getFareFirstClass() %></p>
				</div>
				<div class="child">
					<p class="name">Second Class</p>
					<p class="class"><%= t.getFareSecondClass() %></p>
				</div>
			</div>
			<div class="book-ticket-container">
				<a
					href="bookticket.jsp?trainNumber=<%=t.getTrainNumber()%>&origin=<%= t.getOriginStation() %>&destination=<%= t.getDestinationStation() %>&fare=<%= t.getFareSecondClass() %>&departure=<%= t.getDepartureTime() %>&arrival=<%= t.getArrivalTime() %>"
					class="book-ticket"> Book Ticket </a>
			</div>

		</div>
	</div>
	<% } %>
</body>
</html>