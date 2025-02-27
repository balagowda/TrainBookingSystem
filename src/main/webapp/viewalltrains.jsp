<%@page import="com.Model.Train"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Trains</title>
<link rel="stylesheet" type="text/css" href="css/viewcustomer.css">
</head>
<body>
	<jsp:include page="Navbar.jsp" />
    <div class="container">
        <h2 class="title">Train List</h2>
        <table>
            <thead>
                <tr>
                    <th>TrainNumber</th>
                    <th>TrainName</th>
                    <th>Origin</th>
                    <th>Destination</th>
                    <th>DepartureTime</th>
                    <th>ArrivalTime</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Train> trains = (List<Train>) request.getAttribute("trains"); 
                    if (trains != null) {
                        for (Train t : trains) {
                %>
                <tr>
                    <td><%= t.getTrainNumber() %></td>
                    <td><%= t.getTrainName() %></td>
                    <td><%= t.getOriginStation() %></td>
                    <td><%= t.getDestinationStation() %></td>
                    <td><%= t.getDepartureTime() %></td>
                    <td><%= t.getArrivalTime() %></td>
                    <td>
                        <form action="TrainServlet" method="get">
                            <input type="hidden" name="trainId" value="<%= t.getTrainNumber() %>">
                            <button name="action" value="Delete" type="submit" class="btn">Delete</button>
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