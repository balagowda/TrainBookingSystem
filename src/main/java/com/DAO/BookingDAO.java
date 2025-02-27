package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Exception.idAlreadyExistException;
import com.Helper.Helper;
import com.Model.Booking;
import com.Model.ResultData;

public class BookingDAO {

	// view all booking data
	public List<Booking> viewAllBookings(int id) {
		List<Booking> viewResult = new ArrayList<Booking>();
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("select * from booking where customerId=?");
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int bookingId = rs.getInt(1);
				int customerId = rs.getInt(2);
				int trainNumber = rs.getInt(3);
				int seatNumber = rs.getInt(4);
				String bookingDate = rs.getString(5);
				String seatNumbers = rs.getString(6);
				double fare = rs.getDouble(7);
				String status = rs.getString(8);
				String clas = rs.getString(9);
				
				Booking b = new Booking(bookingId, customerId, trainNumber, seatNumber, bookingDate, seatNumbers, fare, clas,
						status);
				viewResult.add(b);
			}
			Helper.closeAllConnection(cn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return viewResult;
	}
	
	// get no of ticket
	public List<ResultData> viewAllTicketOfCustomer() {
		List<ResultData> viewResult = new ArrayList<ResultData>();
		try {
			Connection cn = Helper.createConnection();
			String sql = "select c.userId, b.trainNumber, c.userName, c.contact, b.totalSeatsPerTrain from customer c"+
			" inner join ( select b.customerId, b.trainNumber, SUM(b.seatNumber) AS totalSeatsPerTrain from booking b GROUP BY b.customerId, b.trainNumber) b"+
			" ON c.userId = b.customerId";
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int cid = rs.getInt(1);
				int tid = rs.getInt(2);
				String name = rs.getString(3);
				long contact = rs.getLong(4);
				int count = rs.getInt(5);

				viewResult.add(new ResultData(cid, tid, name, contact, count));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return viewResult;
	}

	// register booking
	public boolean registerBooking(Booking b) throws idAlreadyExistException {
		boolean registerResult = false;
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("insert into booking values (?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, b.getBookingId());
			ps.setInt(2, b.getCustomerId());
			ps.setInt(3, b.getTrainNumber());
			ps.setInt(4, b.getSeatNumber());
			ps.setString(5, b.getBookingDate());
			ps.setString(6, b.getSeatNumbers());
			ps.setDouble(7, b.getFare());
			ps.setString(8, b.getStatus());
			ps.setString(9, b.getClas());

			int number = ps.executeUpdate();
			if (number > 0) {
				registerResult = true;
			}
			Helper.closeAllConnection(cn, ps, null);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new idAlreadyExistException("Booking Id with the value" + b.getBookingId() + " already exist");

		}
		return registerResult;
	}

	// delete booking
	public boolean delete(int id) {
		boolean deleteResult = false;
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("delete from booking where bookingId=?");
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
