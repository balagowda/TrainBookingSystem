package com.web;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Booking;
import com.Model.Customer;
import com.Model.ResultData;
import com.controller.BookingController;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		RequestDispatcher rd = null;
		
		BookingController controller = new BookingController();
		
		if("Book".equals(action)) {
			
			String trainNumber = request.getParameter("trainNumber");
		    String bookingDate = request.getParameter("bookingDate");
		    String noOfSeats = request.getParameter("noOfSeats");
		    String fare = request.getParameter("fare");
		    String clas = request.getParameter("class");
		    
		    HttpSession session=request.getSession();
			Customer c = (Customer) session.getAttribute("user");
			
			String seats = "";
			Random random = new Random();
			for(int i=0; i<Integer.parseInt(noOfSeats); i++) {
				seats += (random.nextInt(100) + 1) + ",";
			}
		    
		    Booking b = new Booking(00, c.getUserId(), Integer.parseInt(trainNumber), Integer.parseInt(noOfSeats), bookingDate, seats,Double.parseDouble(fare),clas, "Confirmed");
		    try {
		    	boolean res = controller.registerBooking(b);
		    	if(res) {
		    		rd=request.getRequestDispatcher("home.jsp");
		    	}
		    }catch (Exception e) {
				e.printStackTrace();
				rd=request.getRequestDispatcher("home.jsp");
			}
			
		}else if("Ticket".equals(action)) {
			
			HttpSession session=request.getSession();
			Customer c = (Customer) session.getAttribute("user");
			
			List<Booking> book = controller.viewAllBooking(c.getUserId());
			if(book!=null) {
				rd=request.getRequestDispatcher("viewbooking.jsp");
				request.setAttribute("bookings", book);
			}else {
				rd=request.getRequestDispatcher("home.jsp");
			}
			
		}else if("Cancel".equals(action)) {
			
			HttpSession session=request.getSession();
			Customer c = (Customer) session.getAttribute("user");
			
			String id = request.getParameter("bookingId");
			
			boolean res = controller.delete(Integer.parseInt(id));
			List<Booking> book = controller.viewAllBooking(c.getUserId());
			if(res) {
				rd=request.getRequestDispatcher("viewbooking.jsp");
				request.setAttribute("bookings", book);
			}else {
				rd=request.getRequestDispatcher("viewbooking.jsp");
				request.setAttribute("bookings", book);
			}
			
		}else if ("AllBooking".equals(action)) {
			
			List<ResultData> d=controller.viewAllTicketOfCustomer();
			if(d!=null && d.size()>0) {
				rd=request.getRequestDispatcher("viewcustomer.jsp");
				request.setAttribute("data", d);
			} else {
				rd=request.getRequestDispatcher("failure.jsp");
				request.setAttribute("errorMessage", "No ticket found at this moment");
			}
			
		}
		rd.forward(request, response);
		
	}
	
}
