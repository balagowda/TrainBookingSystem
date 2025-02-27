<%@page import="com.Model.ResultData"%>
<%@page import="com.Model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Customers</title>
    <link rel="stylesheet" type="text/css" href="css/viewcustomer.css">
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
        <h2 class="title">Customer Ticket List</h2>
        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Train ID</th>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Number of Tickets Booked</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<ResultData> customers = (List<ResultData>) request.getAttribute("data");
                    if (customers != null) {
                        for (ResultData c : customers) {
                %>
                <tr>
                    <td><%= c.getCid() %></td>
                    <td><%= c.getTid() %></td>
                    <td><%= c.getCname() %></td>
                    <td><%= c.getContact() %></td>
                    <td><%= c.getNoOfSeats() %></td>
                    <td>
                        <form action="BookingServlet" method="get">
                            <input type="hidden" name="customerId" value="<%= c.getCid() %>">
                            <button type="submit" class="btn">Cancel</button>
                        </form>
                    </td>
                </tr>
                <%      
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>