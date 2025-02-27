package com.controller;

import java.util.List;

import com.DAO.CustomerDAO;
import com.Exception.idAlreadyExistException;
import com.Model.Customer;
import com.Model.ResultData;

public class CustomerController {

	// method to get data from DAO and return it to Web file
	public static List<Customer> viewAllCustomer() {
		CustomerDAO customerDao = new CustomerDAO();
		return customerDao.viewAllCustomer();
	}

	// method to get data from DAO and return it to Web file
	public static Customer searchCustomer(int id) {
		CustomerDAO customerDao = new CustomerDAO();
		return customerDao.searchCustomer(id);
	}

	// method to register the customer
	public static boolean register(Customer c) throws idAlreadyExistException {
		CustomerDAO customerDao = new CustomerDAO();
		return customerDao.registerCustomer(c);
	}
	
	//method to login the customer
	public static Customer login(String uname, String password) {
		CustomerDAO customerDao = new CustomerDAO();
		return customerDao.loginCustomer(uname, password);
	}
	
	// method to update
	public static boolean update(Customer c) {
		CustomerDAO customerDao = new CustomerDAO();
		return customerDao.updateCustomer(c);
	}
		
	// method to update
	public static boolean updateByAdmin(int cid, String username, String email, String contact, String newPassword) {
		CustomerDAO customerDao = new CustomerDAO();
		return customerDao.updateByAdmin(cid, username, email, contact, newPassword);
	}

	// method to delete
	public static boolean delete(int id) {
		CustomerDAO customerDao = new CustomerDAO();
		return customerDao.delete(id);
	}
}
