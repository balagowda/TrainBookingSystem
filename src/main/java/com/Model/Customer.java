package com.Model;

public class Customer {
	private String userName;
	private String email;
	private String password;
	private String address;
	private long contact;
	private int userId;
	private long aadhar;
	
	public long getAadhar() {
		return aadhar;
	}

	public void setAadhar(long aadhar) {
		this.aadhar = aadhar;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getContact() {
		return contact;
	}

	public void setContact(long contact) {
		this.contact = contact;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public Customer(String userName, String email, String password, String address, long contact, int userId, long aadhar) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.address = address;
		this.contact = contact;
		this.userId = userId;
		this.aadhar = aadhar;
	}
	
}
