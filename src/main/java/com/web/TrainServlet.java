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
import com.Model.Train;
import com.controller.TrainController;

@WebServlet("/TrainServlet")
public class TrainServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		RequestDispatcher rd = null;
		
		TrainController controller = new TrainController();

		if ("View".equals(action)) {
			String user = request.getParameter("user");
			
			List<Train> trains = controller.viewAllTrains();
			if(trains!=null) {
				if(user.equals("admin")) {
					rd=request.getRequestDispatcher("viewalltrains.jsp");			
				}else {
					rd=request.getRequestDispatcher("view.jsp");
				}
				request.setAttribute("trains", trains);
			}else {
				rd = request.getRequestDispatcher("failure.jsp");
				request.setAttribute("errorMessage", "Train data not found try again later!!");
			}
			
		}else if("Search".equals(action)) {
			
			String from = request.getParameter("from");
			String to = request.getParameter("to");
			
			List<Train> trains = controller.searchTrain(from, to);
			if(trains!=null) {
				rd=request.getRequestDispatcher("view.jsp");
				request.setAttribute("trains", trains);
				request.setAttribute("from", from);
				request.setAttribute("to", to);
			}else {
				rd = request.getRequestDispatcher("failure.jsp");
				request.setAttribute("errorMessage", "Train not found");
			}
			
		}else if("Delete".equals(action)) {
			
			String id = request.getParameter("trainId");
			
			boolean res = controller.delete(Integer.parseInt(id));
			List<Train> trains = controller.viewAllTrains();
			if(res) {
				rd = request.getRequestDispatcher("viewalltrains.jsp");
			}else {
				rd = request.getRequestDispatcher("viewalltrains.jsp");
			}
			request.setAttribute("trains", trains);
			
		}else if("Register".equals(action)) {
			
			String trainNumber = request.getParameter("trainNumber");
			String trainName = request.getParameter("trainName");
			String originStation = request.getParameter("originStation");
			String destinationStation = request.getParameter("destinationStation");
			String departureTime = request.getParameter("departureTime");
			String arrivalTime = request.getParameter("arrivalTime");
			String ac1 = request.getParameter("ac1");
			String ac2 = request.getParameter("ac2");
			String ac3 = request.getParameter("ac3");
			String firstClass = request.getParameter("firstClass");
			String secondClass = request.getParameter("secondClass");
			String fareAc1 = request.getParameter("fareAc1");
			String fareAc2 = request.getParameter("fareAc2");
			String fareAc3 = request.getParameter("fareAc3");
			String fareFirstClass = request.getParameter("fareFirstClass");
			String fareSecondClass = request.getParameter("fareSecondClass");
			
			Train t = new Train(Integer.parseInt(trainNumber), trainName, originStation, destinationStation, departureTime, arrivalTime, 
								Integer.parseInt(ac1), Integer.parseInt(ac2), Integer.parseInt(ac3),
								Integer.parseInt(firstClass), Integer.parseInt(secondClass), 
								Double.parseDouble(fareAc1), Double.parseDouble(fareAc2), Double.parseDouble(fareAc3)
								,Double.parseDouble(fareFirstClass),Double.parseDouble(fareSecondClass));
			
			try {
				boolean res = controller.registerTrain(t);
				List<Train> trains = controller.viewAllTrains();
				rd=request.getRequestDispatcher("viewalltrains.jsp");
				request.setAttribute("trains", trains);
			}catch (Exception e) {
				e.printStackTrace();
				rd = request.getRequestDispatcher("failure.jsp");
			}
			
		}
		
		rd.forward(request, response);
	}

}
