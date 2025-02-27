package com.controller;

import java.util.List;

import com.DAO.TrainDAO;
import com.Exception.idAlreadyExistException;
import com.Model.Train;

public class TrainController {

	// method to get data from DAO and return it to Web file
	public static List<Train> viewAllTrains() {
		TrainDAO trainDao = new TrainDAO();
		return trainDao.viewAllTrains();
	}

	// method to get data from DAO and return it to Web file
	public static List<Train> searchTrain(String origin, String destination) {
		TrainDAO trainDao = new TrainDAO();
		return trainDao.searchTrain(origin, destination);
	}

	// method to register the customer
	public static boolean registerTrain(Train t) throws idAlreadyExistException {
		TrainDAO trainDao = new TrainDAO();
		return trainDao.registerTrain(t);
	}

	// method to delete
	public static boolean delete(int id) {
		TrainDAO trainDao = new TrainDAO();
		return trainDao.delete(id);
	}
}
