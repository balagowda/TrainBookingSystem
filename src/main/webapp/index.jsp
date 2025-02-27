<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Train booking system</title>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/navbar.css">
</head>
    <!-- Navbar -->
    <div class="nav-container">
    	<nav class="navbar">
        <div class="logo">
            <img src="https://img.icons8.com/ios-filled/50/ffffff/train.png" alt="Train Logo">
            <h2 class="h2">TrainBooking</h2>
        </div>
        <div class="nav-links">
            <a href="index.jsp" class="nav-link">Home</a>
            <a href="#" class="nav-link">Contact Us</a>
        </div>
    </nav>
    </div>

    <!-- Main Content -->
    <section class="main-section">
        <div class="bg-animation">
            <span style="left: 10%; animation-delay: 0s;"></span>
            <span style="left: 30%; animation-delay: 2s;"></span>
            <span style="left: 50%; animation-delay: 4s;"></span>
            <span style="left: 70%; animation-delay: 1s;"></span>
            <span style="left: 90%; animation-delay: 3s;"></span>
        </div>
        <div class="container">
            <h1>Welcome to TrainBooking</h1>
            <p>Book your train tickets effortlessly with the best prices and real-time updates!</p>
            <div class="search-box">
                <a href="login.jsp" class="glowing-button">Login</a>
        		<a href="register.jsp" class="glowing-button">Register</a>
            </div>
            <div class="features">
                <div class="feature-card">
                    <h3>Fast Booking</h3>
                    <p>Book tickets in just a few clicks.</p>
                </div>
                <div class="feature-card">
                    <h3>Live Tracking</h3>
                    <p>Track your train in real-time.</p>
                </div>
                <div class="feature-card">
                    <h3>Best Deals</h3>
                    <p>Exclusive offers just for you.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>© 2025 TrainBooking. All rights reserved.</p>
        <p>
            <a href="#">Privacy Policy</a> | 
            <a href="#">Terms of Service</a> | 
            <a href="#">Help Center</a>
        </p>
    </footer>
</body>
</html>