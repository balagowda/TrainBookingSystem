package com.Model;

public class Train {
	private int trainNumber;
	private String trainName;
	private String originStation;
	private String destinationStation;
	private String departureTime;
	private String arrivalTime;
	private int ac1;
	private int ac2;
	private int ac3;
	private int firstClass;
	private int secondClass;
	private double fareAc1;
	private double fareAc2;
	private double fareAc3;
	private double fareFirstClass;
	private double fareSecondClass;
	
	public int getAc1() {
		return ac1;
	}

	public void setAc1(int ac1) {
		this.ac1 = ac1;
	}

	public int getAc2() {
		return ac2;
	}

	public void setAc2(int ac2) {
		this.ac2 = ac2;
	}

	public int getAc3() {
		return ac3;
	}

	public void setAc3(int ac3) {
		this.ac3 = ac3;
	}

	public int getFirstClass() {
		return firstClass;
	}

	public void setFirstClass(int firstClass) {
		this.firstClass = firstClass;
	}

	public int getSecondClass() {
		return secondClass;
	}

	public void setSecondClass(int secondClass) {
		this.secondClass = secondClass;
	}

	public double getFareAc1() {
		return fareAc1;
	}

	public void setFareAc1(double fareAc1) {
		this.fareAc1 = fareAc1;
	}

	public double getFareAc2() {
		return fareAc2;
	}

	public void setFareAc2(double fareAc2) {
		this.fareAc2 = fareAc2;
	}

	public double getFareAc3() {
		return fareAc3;
	}

	public void setFareAc3(double fareAc3) {
		this.fareAc3 = fareAc3;
	}

	public double getFareFirstClass() {
		return fareFirstClass;
	}

	public void setFareFirstClass(double fareFirstClass) {
		this.fareFirstClass = fareFirstClass;
	}

	public double getFareSecondClass() {
		return fareSecondClass;
	}

	public void setFareSecondClass(double fareSecondClass) {
		this.fareSecondClass = fareSecondClass;
	}

	public int getTrainNumber() {
		return trainNumber;
	}

	public void setTrainNumber(int trainNumber) {
		this.trainNumber = trainNumber;
	}

	public String getTrainName() {
		return trainName;
	}

	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}

	public String getOriginStation() {
		return originStation;
	}

	public void setOriginStation(String originStation) {
		this.originStation = originStation;
	}

	public String getDestinationStation() {
		return destinationStation;
	}

	public void setDestinationStation(String destinationStation) {
		this.destinationStation = destinationStation;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	
	public Train(int trainNumber, String trainName, String originStation, String destinationStation,
			String departureTime, String arrivalTime, int ac1, int ac2, int ac3, int firstClass, int secondClass
			,double fareAc1, double fareAc2, double fareAc3, double farefirstClass, double faresecondClass) {
		super();
		this.trainNumber = trainNumber;
		this.trainName = trainName;
		this.originStation = originStation;
		this.destinationStation = destinationStation;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
		this.ac1 = ac1;
		this.ac2 = ac2;
		this.ac3 = ac3;
		this.firstClass = firstClass;
		this.secondClass = secondClass;
		this.fareAc1 = fareAc1;
		this.fareAc2 = fareAc2;
		this.fareAc3 = fareAc3;
		this.fareFirstClass = farefirstClass;
		this.fareSecondClass = faresecondClass;
		
	}
}
