<%@page import="com.Model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer data page</title>
<link rel="stylesheet" href="css/viewcustomerdata.css">
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
        <h2 class="title">Customer Data</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                    if (customers != null) {
                        for (Customer c : customers) {
                %>
                <tr>
                    <td><%= c.getUserId() %></td>
                    <td><%= c.getUserName() %></td>
                    <td><%= c.getContact() %></td>
                    <td><%= c.getEmail() %></td>
                    <td>
                        <a href="updatecustomer.jsp?customerId=<%= c.getUserId() %>" class="btn">Update</a>
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