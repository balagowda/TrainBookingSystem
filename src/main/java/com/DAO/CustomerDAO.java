package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Exception.idAlreadyExistException;
import com.Helper.Helper;
import com.Model.Customer;
import com.Model.ResultData;

public class CustomerDAO {

	// view all customer data
	public List<Customer> viewAllCustomer() {
		List<Customer> viewResult = new ArrayList<Customer>();
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("select * from customer");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int userId = rs.getInt(1);
				String userName = rs.getString(2);
				String email = rs.getString(3);
				String password = rs.getString(4);
				String address = rs.getString(5);
				long contact = rs.getLong(6);
				long aadhar = rs.getLong(7);
				
				Customer c = new Customer(userName, email, password, address, contact, userId, aadhar);
				viewResult.add(c);
			}
			Helper.closeAllConnection(cn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return viewResult;
	}

	// search customer
	public Customer searchCustomer(int id) {
		Customer customer = null;
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("select * from customer where userId=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int userId = rs.getInt(1);
				String userName = rs.getString(2);
				String email = rs.getString(3);
				String password = rs.getString(4);
				String address = rs.getString(5);
				long contact = rs.getLong(6);
				long aadhar = rs.getLong(7);
				
				customer = new Customer(userName, email, password, address, contact, userId, aadhar);
			}
			Helper.closeAllConnection(cn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customer;
	}

	// register customer
	public boolean registerCustomer(Customer c) throws idAlreadyExistException {
		boolean registerResult = false;
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("insert into customer values (?,?,?,?,?,?,?)");
			ps.setInt(1, c.getUserId());
			ps.setString(2, c.getUserName());
			ps.setString(3, c.getEmail());
			ps.setString(4, c.getPassword());
			ps.setString(5, c.getAddress());
			ps.setLong(6, c.getContact());
			ps.setLong(7, c.getAadhar());
			
			int number = ps.executeUpdate();
			if (number > 0) {
				registerResult = true;
			}
			Helper.closeAllConnection(cn, ps, null);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new idAlreadyExistException("customer Id with the value" + c.getUserId() + " already exist");

		}
		return registerResult;
	}
	
	//Login customer
	public Customer loginCustomer(String uname, String upassword) {
		Customer customer = null;
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("SELECT * FROM Customer WHERE userName=? AND password=?");
			ps.setString(1, uname);
			ps.setString(2, upassword);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int userId = rs.getInt(1);
				String userName = rs.getString(2);
				String email = rs.getString(3);
				String password = rs.getString(4);
				String address = rs.getString(5);
				long contact = rs.getLong(6);
				long aadhar = rs.getLong(7);
				
				customer = new Customer(userName, email, password, address, contact, userId, aadhar);
			}
			Helper.closeAllConnection(cn, ps, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return customer;
	}
	
	// update customer
		public boolean updateCustomer(Customer c) {
			boolean updateResult = false;
			try {
				Connection cn = Helper.createConnection();
				PreparedStatement ps = cn.prepareStatement("UPDATE Customer SET userName = ?, email = ?, password = ?, address = ?, contact = ?, aadhar = ? WHERE userId = ?");
				ps.setString(1,c.getUserName());
				ps.setString(2, c.getEmail());
				ps.setString(3,c.getPassword());
				ps.setString(4, c.getAddress());
				ps.setLong(5, c.getContact());
				ps.setLong(6, c.getAadhar());
				ps.setInt(7, c.getUserId());
				
				int number = ps.executeUpdate();
				if (number > 0) {
					updateResult = true;
				}
				Helper.closeAllConnection(cn, ps, null);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return updateResult;
		}
		
		// update customer
		public boolean updateByAdmin(int cid, String username, String email, String contact, String newPassword) {
			boolean updateResult = false;
			try {
				Connection cn = Helper.createConnection();
				PreparedStatement ps = cn.prepareStatement(
						"UPDATE Customer SET userName = ?, email = ?, password = ?, contact = ? WHERE userId = ?");
				
				ps.setString(1,username);
				ps.setString(2, email);
				ps.setString(3,newPassword);
				ps.setString(4, contact);
				ps.setInt(5, cid);
				
				int number = ps.executeUpdate();
				if (number > 0) {
					updateResult = true;
				}
				Helper.closeAllConnection(cn, ps, null);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return updateResult;
		}

	// delete customer
	public boolean delete(int id) {
		boolean deleteResult = false;
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("delete from customer where id=?");
			ps.setInt(1, id);
			int number = ps.executeUpdate();
			if (number > 0) {
				deleteResult = true;
			}
			Helper.closeAllConnection(cn, ps, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleteResult;
	}

}
