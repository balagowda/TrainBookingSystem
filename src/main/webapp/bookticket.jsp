<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String trainNumber = request.getParameter("trainNumber");
    String origin = request.getParameter("origin");
    String destination = request.getParameter("destination");
    String departure = request.getParameter("departure");
    String arrival = request.getParameter("arrival");
    String fare = request.getParameter("fare");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Ticket</title>
<link rel="stylesheet" type="text/css" href="css/book.css">
<script>
		function updatePrice() {
    		let seatCount = document.getElementById("noOfSeats").value;
    		let farePerSeat = parseFloat("<%= fare %>");
    		let totalPrice = seatCount * farePerSeat;
    
    		document.getElementById("fare").value = totalPrice;
		}
		
		function validateForm(event) {
		    let bookingDateInput = document.getElementById("bookingDate");
		    let bookingDateError = document.getElementById("bookingDateError");

		    const today = new Date().toISOString().split('T')[0];
	        if (!bookingDate.value || bookingDate.value < today) {
	        	bookingDateError.innerText = "You can't book for date in the past!";
		        event.preventDefault(); 
		        return false;
	        }else {
		        bookingDateError.innerText = ""; 
		    }
		    return true;
		}
    </script>
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
        <h2 class="title">Book Ticket</h2>
        <form action="BookingServlet" method="get" onsubmit="return validateForm(event)">
            <label>Train Number:</label>
            <input type="text" name="trainNumber" value="<%= trainNumber %>" readonly>

            <label>From:</label>
            <input type="text" name="from" value="<%= origin %>" readonly>
            
             <label>To:</label>
            <input type="text" name="to" value="<%= destination %>" readonly>
            
            <label>Arrival:</label>
            <input type="text" name="arrival" value="<%= arrival %>" readonly>
            
            <label>Departure:</label>
            <input type="text" name="departure" value="<%= departure %>" readonly>

            <label>Booking Date:</label>
            <input type="date" name="bookingDate" id="bookingDate">
            <span id="bookingDateError" class="error"></span>

            <label for="noOfSeats"><strong>Number of Seats:</strong></label>
			<select id="noOfSeats" name="noOfSeats" class="seat-select" onchange="updatePrice()">
    			<option value="1">1</option>
    			<option value="2">2</option>
    			<option value="3">3</option>
    			<option value="4">4</option>
    			<option value="5">5</option>
			</select>
			
			<label for="class"><strong>Choose class:</strong></label>
			<select id="class" name="class" class="seat-select">
    			<option value="FirstClass">First Class</option>
    			<option value="SecondClass">Second Class</option>
    			<option value="Ac3tier">Ac 3 tier</option>
    			<option value="Ac2tier">Ac 2 tier</option>
    			<option value="Ac1tier">Ac 1 tier</option>
			</select>

            <label>Fare:</label>
            <input type="text" id="fare" name="fare" value="<%= fare %>" readonly>

            <button name="action" value="Book" type="submit" class="btn">Book Ticket</button>
        </form>
    </div>
</body>
</html>