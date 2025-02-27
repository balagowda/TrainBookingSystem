package com.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.Model.Admin;
import com.Model.Customer;
import com.Model.ResultData;
import com.controller.CustomerController;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		RequestDispatcher rd=null;
		CustomerController controller = new CustomerController();
		
		if("Login".equals(action)) {
			String uname=request.getParameter("username");
			String upassword=request.getParameter("password");
			
			if(new Admin().login(uname, upassword)) {
				
				rd=request.getRequestDispatcher("admin.jsp");
				HttpSession session=request.getSession();
				session.setAttribute("user", uname);
				
			}else {
				Customer c = controller.login(uname, upassword);
				if(c!=null) {
					rd=request.getRequestDispatcher("home.jsp");
					HttpSession session=request.getSession();
					session.setAttribute("user", c);
				}else {
					rd=request.getRequestDispatcher("login.jsp");
					request.setAttribute("MSG", "Invalid Credentials!!!");
				}
			}
			
		}else if("Logout".equals(action)) {

			HttpSession session=request.getSession();
			session.invalidate();
			rd=request.getRequestDispatcher("index.jsp");
			//session.setAttribute("user", null);
			
		}else if ("Search".equals(action)) {
			
			String id = request.getParameter("id");
			Customer p=controller.searchCustomer(Integer.parseInt(id));
			if(p!=null) {
				rd=request.getRequestDispatcher("searchResult.jsp");
			} else {
				rd=request.getRequestDispatcher("failure.jsp");
				request.setAttribute("errorMessage", "Data of "+id+" id not found!");
			}
			
		}else if ("UpdateByAdmin".equals(action)) {
			
			String username = request.getParameter("username");
		    String email = request.getParameter("email");
		    String contact = request.getParameter("mobile");
		    String newPassword = request.getParameter("newPassword");
		    String confirmPassword = request.getParameter("confirmPassword");
		    String userPassword = request.getParameter("userPassword");
		    String cid = request.getParameter("customerId");
		    
		    if (newPassword.isEmpty() && confirmPassword.isEmpty()){
				newPassword = userPassword;
			}
		    
		    boolean res = controller.updateByAdmin(Integer.parseInt(cid), username, email, contact, newPassword);
			if(res) {
				rd=request.getRequestDispatcher("updatecustomer.jsp");
				request.setAttribute("msg", "Customer data updated successfully!!");
			}else {
				rd=request.getRequestDispatcher("updatecustomer.jsp");
				request.setAttribute("msg", "Failed to update customer data!!");
			}
			
		}else if ("Update".equals(action)) {
			
			String username = request.getParameter("username");
		    String email = request.getParameter("email");
		    String address = request.getParameter("address");
		    String contact = request.getParameter("contact");
		    String currentPassword = request.getParameter("currentPassword");
		    String newPassword = request.getParameter("newPassword");
		    String confirmNewPassword = request.getParameter("confirmNewPassword");
		    String aadhar = request.getParameter("aadhar");
		    
		    HttpSession session=request.getSession();
			Customer c = (Customer) session.getAttribute("user");

			if(newPassword.isEmpty() && confirmNewPassword.isEmpty() && currentPassword.isEmpty()) {
				newPassword = c.getPassword();
			}
			
			Customer c1 = new Customer(username, email, newPassword, address, Long.parseLong(contact), c.getUserId(), Long.parseLong(aadhar));
			
			boolean res = controller.update(c1);
			if(res) {
				rd=request.getRequestDispatcher("update.jsp");
				session.setAttribute("user", c1);
				request.setAttribute("msg", "Profile Updated successfully");
			}else {
				rd=request.getRequestDispatcher("update.jsp");
				request.setAttribute("msg", "Failed Update Profile");
			}
			
		}else if ("Delete".equals(action)) {
			
			String cid = request.getParameter("customerId");
			boolean b=controller.delete(Integer.parseInt(cid));
			
			rd=request.getRequestDispatcher("viewcustomerdata.jsp");
			
			if(b==true) {
				request.setAttribute("msg","Customer Id - "+Integer.parseInt(cid)+" deleted successfully!!");
			} else {
				request.setAttribute("msg","Failed to delete Customer Id - "+Integer.parseInt(cid));
			}
			
		}else if("AllData".equals(action)) {
			
			List<Customer> customerList=controller.viewAllCustomer();
			if(customerList.size()!=0) {
				rd=request.getRequestDispatcher("viewcustomerdata.jsp");
				request.setAttribute("customers", customerList);
			}else {
				rd=request.getRequestDispatcher("failure.jsp");
				request.setAttribute("errorMessage", "No data found at this moment");
			}
			
		}
		rd.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		String userId = "00";
		String aadhar = request.getParameter("aadhar");
		
		RequestDispatcher rd=null;
		CustomerController controller = new CustomerController();
		
		Customer c = new Customer(username, email, password, address, Long.parseLong(contact), Integer.parseInt(userId), Long.parseLong(aadhar));
		
		boolean result;
		try {
			result = controller.register(c);
			if(result) {
				rd=request.getRequestDispatcher("login.jsp");
				request.setAttribute("MSG", "Registered successfully please login to continue");
			}
		}catch (Exception e) {
			e.printStackTrace();
			rd = request.getRequestDispatcher("register.jsp");
			request.setAttribute("MSG", "User Already Exists!!!");
		}
		rd.forward(request, response);
	}

}
