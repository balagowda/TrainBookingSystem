package com.Model;

public class Admin {
	private final String uname = "admin@tcs.com";
	private String password = "Admn@123";
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUname() {
		return uname;
	}
	
	public boolean login(String uname, String password) {
		if(uname.equals(this.uname) && password.equals(this.password)) {
			return true;
		}
		return false;
	}
}
