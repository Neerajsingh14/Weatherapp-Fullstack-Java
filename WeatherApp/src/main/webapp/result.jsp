<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weather App - Weather Details</title>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
    /* ---- GLOBAL ---- */
    body {
        margin: 0;
        padding: 0;
        font-family: "Poppins", sans-serif;
        background: #eef2f3;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    /* ---- MAIN CONTAINER ---- */
    .container {
        width: 450px;
        background: #fff;
        padding: 35px 30px;
        border-radius: 16px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        text-align: center;
        margin: auto;
        margin-top: 80px;
        animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    /* ---- TITLE ---- */
    h1 {
        font-size: 28px;
        font-weight: 600;
        color: #222;
        margin-bottom: 20px;
    }

    /* ---- WEATHER IMAGE + TEMP ---- */
    .weather-image-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 25px;
    }

    .weather-image-container img {
        width: 120px;
        height: 120px;
        margin-bottom: 10px;
    }

    .temp-city h2 {
        margin: 6px 0;
        color: #333;
        font-size: 20px;
        font-weight: 500;
    }

    .temp-city i {
        color: #0078ff;
        margin-right: 8px;
    }

    /* ---- WEATHER INFORMATION BOX ---- */
    .weather-info {
        text-align: left;
        background: #f7f9fc;
        padding: 18px;
        border-radius: 10px;
        border-left: 4px solid #0078ff;
        margin-bottom: 30px;
        font-size: 15px;
        color: #444;
    }

    .weather-info p {
        margin: 8px 0;
        display: flex;
        align-items: center;
    }

    .weather-info i {
        color: #0078ff;
        margin-right: 10px;
        font-size: 15px;
    }

    /* ---- BACK TO HOME LINK ---- */
    .back-button {
        display: block;
        width: 100%;
        padding: 12px;
        text-align: center;
        background: #0078ff;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-size: 16px;
        transition: 0.3s ease;
        margin-top: 10px;
    }

    .back-button:hover {
        background: #005bcc;
        transform: scale(1.03);
    }

    /* ---- FOOTER ---- */
    footer {
        text-align: center;
        margin-top: auto;
        padding: 12px 0;
        background: #ffffff90;
        border-top: 1px solid #ccc;
        width: 100%;
    }

    footer p {
        color: #333;
        font-size: 14px;
        margin: 0;
        letter-spacing: .5px;
    }
</style>

</head>

<body>

    <div class="container">
        <h1>Weather Details</h1>

        <!-- Weather Image + Temperature + City -->
        <div class="weather-image-container">
           

            <div class="temp-city">
                <h2><i class="fas fa-city"></i> ${city}</h2>
                <h2><i class="fas fa-thermometer-half"></i> ${temperature}&deg;C</h2>
            </div>
        </div>

        <!-- Weather Information -->
        <div class="weather-info">
            <p><i class="fas fa-calendar-alt"></i> Date: ${date}</p>
            <p><i class="fas fa-clock"></i> Current Time: ${currentTime}</p>
            <p><i class="fas fa-cloud-sun"></i> Condition: ${weatherCondition}</p>
            <p><i class="fas fa-eye"></i> Visibility: ${visibility} km</p>
            <p><i class="fas fa-wind"></i> Wind Speed: ${windSpeed} km/hr</p>
            <p><i class="fas fa-cloud"></i> Cloud Cover: ${cloudCover}%</p>
        </div>

        <!-- Back to Home -->
        <h2 style="color:#222; margin-bottom:10px;">Find Other Places Weather</h2>

        <a href="index.jsp" 
   style="color:#0078ff; font-size:16px; text-decoration:none;"
   onmouseover="this.style.textDecoration='underline'"
   onmouseout="this.style.textDecoration='none'">
   ← Back to Home (Search Another City)
</a>

    </div>

    <script src="script.js"></script>
</body>

<footer>
    <div class="footer-container">
        <p>Developed by NEERAJ SINGH RAJPUROHIT © 2025 | JAVA Servlet JSP Project</p>
    </div>
</footer>

</html>
