<%@page import="com.Model.Booking"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Bookings</title>
<link rel="stylesheet" type="text/css" href="css/ticket.css">
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container" style="margin-top:50px;">
        <h2 class="title">My Bookings</h2>
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Train Number</th>
                    <th>Number of seat</th>
                    <th>Booking Date</th>
                    <th>Seat Numbers</th>
                    <th>Fare</th>
                    <th>Class</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                    if (bookings != null && !bookings.isEmpty()) {
                        for (Booking b : bookings) {
                %>
                    <tr>
                        <td><%= b.getBookingId() %></td>
                        <td><%= b.getTrainNumber() %></td>
                        <td><%= b.getSeatNumber() %></td>
                        <td><%= b.getBookingDate() %></td>
                        <td><%= b.getSeatNumbers() %></td>
                        <td>₹<%= b.getFare() %></td>
                        <td><%= b.getClas() %></td>
                        <td><%= b.getStatus() %></td>
                        <td>
                            <% if (!b.getStatus().equals("CANCELLED")) { %>
                                <form action="BookingServlet" method="get">
                                    <input type="hidden" name="bookingId" value="<%= b.getBookingId() %>">
                                    <button name="action" value="Cancel" type="submit" class="cancel-btn">Cancel</button>
                                </form>
                            <% } else { %>
                                <span class="cancelled">Cancelled</span>
                            <% } %>
                        </td>
                    </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="8">No bookings found.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>