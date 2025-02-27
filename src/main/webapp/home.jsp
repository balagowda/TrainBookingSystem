<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - Train Booking System</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<% 
    if (session.getAttribute("user") == null) { 
        response.sendRedirect("login.jsp");
    }
%> 
	<jsp:include page="Navbar.jsp" />
	<div class="container">
		<h2 class="title">Welcome to Train Booking System</h2>
		<div class="options">
			<a href="update.jsp" class="btn">Update Profile</a> 
			<form action="TrainServlet" method="get">
				<input type="hidden" name="user" value="customer">
				<button name="action" value="View" class="btn">Book Ticket</button>
			</form> 
			<form action="BookingServlet" method="get">
				<button name="action" value="Ticket" class="btn">View Ticket</button>
			</form>
		</div>
		<div class="charts">
			<div class="chart-container">
				<h4>Number of tickets booked per class </h4>
				<canvas id="ticketChart"></canvas>
			</div>
			<div class="chart-container">
			<h4>Sales done per quarter</h4>
				<canvas id="salesChart"></canvas>
			</div>
		</div>
	</div>
	<script>
        var ticketCtx = document.getElementById('ticketChart').getContext('2d');
        var ticketChart = new Chart(ticketCtx, {
            type: 'pie',
            data: {
                labels: ['Ac 1', 'Ac 2', 'Ac 3', 'First', 'Second'],
                datasets: [{
                    data: [20, 30, 40, 50, 90],
                    backgroundColor: ['#007bff', '#28a745', '#dc3545', '#ffc107', '#6610f2'],
                	borderColor: ['#007bff', '#28a745', '#dc3545', '#ffc107', '#6610f2'],
                	borderWidth: 0,
                	borderRadius: 5,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { labels: { color: '#fff' } }
                },
                barThickness: 40,
                categoryPercentage: 0.6,
                barPercentage: 0.8,
            }
        });

        var salesCtx = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(salesCtx, {
        	type: 'pie',
            data: {
                labels: ['Q1','Q2','Q3','Q4'],
                datasets: [{
                    data: [20, 30, 40, 50],
                    backgroundColor: ['#007bff', '#28a745', '#dc3545', '#ffc107'],
                	borderColor: ['#007bff', '#28a745', '#dc3545', '#ffc107'],
                	borderWidth: 0,
                	borderRadius: 5,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { labels: { color: '#fff' } }
                },
                barThickness: 40,
                categoryPercentage: 0.6,
                barPercentage: 0.8,
            }
        });
    </script>
</body>
</html>