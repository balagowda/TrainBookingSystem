package com.controller;

import java.util.List;

import com.DAO.BookingDAO;
import com.DAO.CustomerDAO;
import com.Exception.idAlreadyExistException;
import com.Model.Booking;
import com.Model.ResultData;

public class BookingController {

	// method to get data from DAO and return it to Web file
	public static List<Booking> viewAllBooking(int id) {
		BookingDAO bookingDao = new BookingDAO();
		return bookingDao.viewAllBookings(id);
	}
	
	// method to get data from DAO and return it to Web file
	public static List<ResultData> viewAllTicketOfCustomer() {
		BookingDAO bookingDao = new BookingDAO();
		return bookingDao.viewAllTicketOfCustomer();
	}

	// method to register the booking
	public static boolean registerBooking(Booking b) throws idAlreadyExistException {
		BookingDAO bookingDao = new BookingDAO();
		return bookingDao.registerBooking(b);
	}

	// method to delete
	public static boolean delete(int id) {
		BookingDAO bookingDao = new BookingDAO();
		return bookingDao.delete(id);
	}
}
