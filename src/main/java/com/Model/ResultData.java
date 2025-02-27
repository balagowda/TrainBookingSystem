package com.Model;

public class ResultData {
	private int cid;
	private int tid;
	private String cname;
	private long contact;
	private int noOfSeats;

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public long getContact() {
		return contact;
	}
	public void setContact(long contact) {
		this.contact = contact;
	}
	public int getNoOfSeats() {
		return noOfSeats;
	}
	public void setNoOfSeats(int noOfSeats) {
		this.noOfSeats = noOfSeats;
	}
	
	public ResultData(int cid, int tid, String cname, long contact, int noOfSeats) {
		super();
		this.cid = cid;
		this.tid = tid;
		this.cname = cname;
		this.contact = contact;
		this.noOfSeats = noOfSeats;
	}
	
}
