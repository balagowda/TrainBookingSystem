package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Exception.idAlreadyExistException;
import com.Helper.Helper;
import com.Model.Train;

public class TrainDAO {

	// view all train data
	public List<Train> viewAllTrains() {
		List<Train> viewResult = new ArrayList<Train>();
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("select * from train");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				int trainNumber = rs.getInt(1);
				String trainName = rs.getString(2);
				String originStation = rs.getString(3);
				String destinationStation = rs.getString(4);
				String departureTime = rs.getString(5);
				String arrivalTime = rs.getString(6);
				int ac1 = rs.getInt(7);
				int ac2 = rs.getInt(8);
				int ac3 = rs.getInt(9);
				int firstClass = rs.getInt(10);
				int secondClass = rs.getInt(11);
				double fareAc1 = rs.getDouble(12);
				double fareAc2 = rs.getDouble(13);
				double fareAc3 = rs.getDouble(14);
				double fareFirstClass = rs.getDouble(15);
				double fareSecondClass = rs.getDouble(16);
				
				Train t = new Train(trainNumber, trainName, originStation, destinationStation, departureTime,
						arrivalTime, ac1, ac2, ac3, firstClass, secondClass, fareAc1, fareAc2, fareAc3, fareFirstClass,
						fareSecondClass);
				viewResult.add(t);
			}
			Helper.closeAllConnection(cn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return viewResult;
	}

	// search train
	public List<Train> searchTrain(String origin, String destination) {
		List<Train> viewResult = new ArrayList<Train>();
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("select * from train where originStation=? and  destinationStation=?");
			ps.setString(1, origin);
			ps.setString(2, destination);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int trainNumber = rs.getInt(1);
				String trainName = rs.getString(2);
				String originStation = rs.getString(3);
				String destinationStation = rs.getString(4);
				String departureTime = rs.getString(5);
				String arrivalTime = rs.getString(6);
				int ac1 = rs.getInt(7);
				int ac2 = rs.getInt(8);
				int ac3 = rs.getInt(9);
				int firstClass = rs.getInt(10);
				int secondClass = rs.getInt(11);
				double fareAc1 = rs.getDouble(12);
				double fareAc2 = rs.getDouble(13);
				double fareAc3 = rs.getDouble(14);
				double fareFirstClass = rs.getDouble(15);
				double fareSecondClass = rs.getDouble(16);
				
				Train t = new Train(trainNumber, trainName, originStation, destinationStation, departureTime,
						arrivalTime, ac1, ac2, ac3, firstClass, secondClass, fareAc1, fareAc2, fareAc3, fareFirstClass,
						fareSecondClass);
				viewResult.add(t);
			}
			Helper.closeAllConnection(cn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return viewResult;
	}

	// register train
	public boolean registerTrain(Train t) throws idAlreadyExistException {
		boolean registerResult = false;
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("insert into train values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, t.getTrainNumber());
			ps.setString(2, t.getTrainName());
			ps.setString(3, t.getOriginStation());
			ps.setString(4, t.getDestinationStation());
			ps.setString(5, t.getDepartureTime());
			ps.setString(6, t.getArrivalTime());
			ps.setInt(7, t.getAc1());
			ps.setInt(8, t.getAc2());
			ps.setInt(9, t.getAc3());
			ps.setInt(10, t.getFirstClass());
			ps.setInt(11, t.getSecondClass());
			ps.setDouble(12, t.getFareAc1());
			ps.setDouble(13, t.getFareAc2());
			ps.setDouble(14, t.getFareAc3());
			ps.setDouble(15, t.getFareFirstClass());
			ps.setDouble(16, t.getFareSecondClass());
			
			int number = ps.executeUpdate();
			if (number > 0) {
				registerResult = true;
			}
			Helper.closeAllConnection(cn, ps, null);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new idAlreadyExistException("Train Id with the value " + t.getTrainNumber() + " already exist");

		}
		return registerResult;
	}

	// delete train
	public boolean delete(int id) {
		boolean deleteResult = false;
		try {
			Connection cn = Helper.createConnection();
			PreparedStatement ps = cn.prepareStatement("delete from train where trainNumber=?");
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
