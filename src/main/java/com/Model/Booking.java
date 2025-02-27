package com.Model;

public class Booking {
	private int bookingId;
	private int customerId;
	private int trainNumber;
	private int seatNumber;
	private String bookingDate;
	private String seatNumbers;
	private double fare;
	private String clas;
	private String status;
	
	public String getClas() {
		return clas;
	}

	public void setClas(String clas) {
		this.clas = clas;
	}
	
	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getTrainNumber() {
		return trainNumber;
	}

	public void setTrainNumber(int trainNumber) {
		this.trainNumber = trainNumber;
	}

	public int getSeatNumber() {
		return seatNumber;
	}

	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getSeatNumbers() {
		return seatNumbers;
	}

	public void setSeatNumbers(String seatNumbers) {
		this.seatNumbers = seatNumbers;
	}

	public double getFare() {
		return fare;
	}

	public void setFare(double fare) {
		this.fare = fare;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Booking(int bookingId, int customerId, int trainNumber, int seatNumber, String bookingDate,
			String seatNumbers, double fare,String clas, String status) {
		super();
		this.bookingId = bookingId;
		this.customerId = customerId;
		this.trainNumber = trainNumber;
		this.seatNumber = seatNumber;
		this.bookingDate = bookingDate;
		this.seatNumbers = seatNumbers;
		this.fare = fare;
		this.clas = clas;
		this.status = status;
	}
	
}
