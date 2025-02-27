<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Train</title>
    <link rel="stylesheet" type="text/css" href="css/registertrain.css">
    <script>
        function validateForm() {
            let isValid = true;

            // Train Number Validation
            let trainNumber = document.getElementById("trainNumber").value;
            if (trainNumber === "" || isNaN(trainNumber)) {
                document.getElementById("trainNumberError").innerText = "Train Number is required and must be a number.";
                isValid = false;
            } else {
                document.getElementById("trainNumberError").innerText = "";
            }

            // Train Name Validation
            let trainName = document.getElementById("trainName").value;
            if (trainName.trim() === "") {
                document.getElementById("trainNameError").innerText = "Train Name is required.";
                isValid = false;
            } else {
                document.getElementById("trainNameError").innerText = "";
            }

            // Origin and Destination Validation
            let origin = document.getElementById("originStation").value;
            let destination = document.getElementById("destinationStation").value;
            if (origin.trim() === "") {
                document.getElementById("originError").innerText = "Origin Station is required.";
                isValid = false;
            } else {
                document.getElementById("originError").innerText = "";
            }
            if (destination.trim() === "") {
                document.getElementById("destinationError").innerText = "Destination Station is required.";
                isValid = false;
            } else if (origin === destination) {
                document.getElementById("destinationError").innerText = "Origin and Destination cannot be the same.";
                isValid = false;
            } else {
                document.getElementById("destinationError").innerText = "";
            }

            // Departure and Arrival Time Validation
            let departure = document.getElementById("departureTime").value;
            let arrival = document.getElementById("arrivalTime").value;
            if (departure === "") {
                document.getElementById("departureError").innerText = "Departure Time is required.";
                isValid = false;
            } else {
                document.getElementById("departureError").innerText = "";
            }
            if (arrival === "") {
                document.getElementById("arrivalError").innerText = "Arrival Time is required.";
                isValid = false;
            } else {
                document.getElementById("arrivalError").innerText = "";
            }

         // Seat and Fare Validation
            let seatIds = ["ac1", "ac2", "ac3", "firstClass", "secondClass"];
            let fareIds = ["fareAc1", "fareAc2", "fareAc3", "fareFirstClass", "fareSecondClass"];

            seatIds.forEach(id => {
                let seatValue = document.getElementById(id).value;
                if (seatValue === "" || seatValue < 1) {
                    document.getElementById(id + "Error").innerText = "Seat count must be at least 1.";
                    isValid = false;
                } else {
                    document.getElementById(id + "Error").innerText = "";
                }
            });

            fareIds.forEach(id => {
                let fareValue = document.getElementById(id).value;
                if (fareValue === "" || fareValue <= 0) {
                    document.getElementById(id + "Error").innerText = "Fare must be greater than 0.";
                    isValid = false;
                } else {
                    document.getElementById(id + "Error").innerText = "";
                }
            });

            return isValid;
        }
    </script>
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
        <h2 class="title">Register Train</h2>
        <form action="TrainServlet" method="get" onsubmit="return validateForm()" class="register">
            <label>Train Number:</label>
            <input type="text" id="trainNumber" name="trainNumber">
            <span class="error" id="trainNumberError"></span>

            <label>Train Name:</label>
            <input type="text" id="trainName" name="trainName">
            <span class="error" id="trainNameError"></span>

            <label>Origin Station:</label>
            <input type="text" id="originStation" name="originStation">
            <span class="error" id="originError"></span>

            <label>Destination Station:</label>
            <input type="text" id="destinationStation" name="destinationStation">
            <span class="error" id="destinationError"></span>

            <label>Departure Time:</label>
            <input type="time" id="departureTime" name="departureTime">
            <span class="error" id="departureError"></span>

            <label>Arrival Time:</label>
            <input type="time" id="arrivalTime" name="arrivalTime">
            <span class="error" id="arrivalError"></span>

            <h3>Number of seats in each class:</h3>
			<div class="grid-container">
				<div class="form-group">
					<label>AC 1 Tier:</label> <input type="number" id="ac1" name="ac1"
						min="1"> <span class="error" id="ac1Error"></span>
				</div>

				<div class="form-group">
					<label>AC 2 Tier:</label> <input type="number" id="ac2" name="ac2"
						min="1"> <span class="error" id="ac2Error"></span>
				</div>

				<div class="form-group">
					<label>AC 3 Tier:</label> <input type="number" id="ac3" name="ac3"
						min="1"> <span class="error" id="ac3Error"></span>
				</div>

				<div class="form-group">
					<label>First Class:</label> <input type="number" id="firstClass"
						name="firstClass" min="1"> <span class="error"
						id="firstClassError"></span>
				</div>

				<div class="form-group">
					<label>Second Class:</label> <input type="number" id="secondClass"
						name="secondClass" min="1"> <span class="error"
						id="secondClassError"></span>
				</div>
			</div>

			<h3>Fare for each class:</h3>
            <div class="grid-container">
            <div class="form-group">
                <label>AC 1 Tier Fare:</label>
                <input type="text" id="fareAc1" name="fareAc1">
                <span class="error" id="fareAc1Error"></span>
            </div>
			
			<div class="form-group">
                <label>AC 2 Tier Fare:</label>
                <input type="text" id="fareAc2" name="fareAc2">
                <span class="error" id="fareAc2Error"></span>
            </div>

			<div class="form-group">
                <label>AC 3 Tier Fare:</label>
                <input type="text" id="fareAc3" name="fareAc3">
                <span class="error" id="fareAc3Error"></span>
           </div>

			<div class="form-group">
                <label>First Class Fare:</label>
                <input type="text" id="fareFirstClass" name="fareFirstClass">
                <span class="error" id="fareFirstClassError"></span>
           </div>
			
			<div class="form-group">
                <label>Second Class Fare:</label>
                <input type="text" id="fareSecondClass" name="fareSecondClass">
                <span class="error" id="fareSecondClassError"></span>
            </div>
            </div>

            <button name="action" value="Register" type="submit" class="btn">Register Train</button>
        </form>
    </div>
</body>
</html>