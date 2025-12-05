<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Weather App - Home</title>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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

    /* ---- CARD ---- */
    .container {
        width: 420px;
        background: #fff;
        padding: 35px 30px;
        border-radius: 16px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        text-align: center;
        margin: auto;
        margin-top: 170px;
        animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .container h1 {
        font-size: 28px;
        margin-bottom: 8px;
        color: #222;
        font-weight: 600;
    }

    .container p {
        font-size: 15px;
        margin-bottom: 22px;
        color: #555;
    }

    /* ---- INPUT ---- */
    .input-wrapper {
        display: flex;
        flex-direction: column;
        gap: 14px;
    }

    .input-wrapper input {
        padding: 12px;
        border-radius: 8px;
        border: 1px solid #ccc;
        outline: none;
        font-size: 16px;
        color: #333;
        transition: 0.2s ease;
    }

    .input-wrapper input:focus {
        border-color: #0078ff;
        box-shadow: 0 0 4px rgba(0,120,255,0.4);
    }

    /* ---- BUTTON ---- */
    .input-wrapper button {
        padding: 12px;
        border: none;
        border-radius: 8px;
        background: #0078ff;
        color: white;
        font-size: 17px;
        cursor: pointer;
        transition: 0.3s ease;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 6px;
    }

    .input-wrapper button:hover {
        background: #005bcc;
        transform: scale(1.02);
    }

    #errorMsg {
        font-size: 14px;
        color: red;
        display: none;
        margin-top: -5px;
    }

    /* ---- FOOTER ---- */
    footer {
        margin-top: auto;
        text-align: center;
        padding: 12px 0;
        background: #ffffff90;
        border-top: 1px solid #ccc;
    }

    footer p {
        color: #333;
        font-size: 14px;
        letter-spacing: .5px;
        margin: 0;
    }
</style>

</head>

<body>

    <div class="container">
        <h1>Simple Weather App</h1>
        <p>Check the weather forecast for any place!</p>

        <form id="weatherForm" action="MyServlet" method="post">
            <div class="input-wrapper">
                <input type="text" id="city" name="city" placeholder="Enter a city name">
                
                <button type="submit">
                    <i class="fas fa-search"></i> Get Weather
                </button>

                <p id="errorMsg">Please enter the name of the place.</p>
            </div>
        </form>
    </div>

    <script src="script.js"></script>
</body>

<footer>
    <p>Developed by NEERAJ SINGH RAJPUROHIT © 2025 | JAVA Servlet JSP Project</p>
</footer>

</html>
