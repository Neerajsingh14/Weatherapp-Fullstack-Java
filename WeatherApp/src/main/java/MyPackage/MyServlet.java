package MyPackage;

import javax.servlet.ServletException;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;


import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MyServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ⭐ STEP 1: Put your API KEY here
    	String myApiKey = "34f48b9ed47baadcf1ecaf32cf4c64c2";


        String city = request.getParameter("city");
        String apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=" 
                        + city + "&appid=" + myApiKey;

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            InputStream inpStream = connection.getInputStream();
            InputStreamReader reader = new InputStreamReader(inpStream);

            StringBuilder responseContent = new StringBuilder();
            Scanner scanner = new Scanner(reader);

            while (scanner.hasNext()) {
                responseContent.append(scanner.nextLine());
            }
            scanner.close();

            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(responseContent.toString(), JsonObject.class);

            // ⭐ Parse Temperature (°C)
            double tempInKelvin = jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
            int tempInCelsius = (int) (tempInKelvin - 273.15);

            // ⭐ Humidity
            int humidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();

            // ⭐ Wind Speed
            double windSpeed = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();

            // ⭐ Visibility
            int visibilityMeters = jsonObject.get("visibility").getAsInt();
            int visibilityKm = visibilityMeters / 1000;

            // ⭐ Weather Condition
            String weatherCondition = jsonObject.getAsJsonArray("weather")
                    .get(0).getAsJsonObject().get("main").getAsString();

            // ⭐ Cloud Cover
            int cloudCover = jsonObject.getAsJsonObject("clouds").get("all").getAsInt();

            // ⭐ Date and Time
            long dateTimestamp = jsonObject.get("dt").getAsLong() * 1000;

            SimpleDateFormat sdfDate = new SimpleDateFormat("EEE MMM dd yyyy");
            SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm");

            String date = sdfDate.format(new Date(dateTimestamp));
            String time = sdfTime.format(new Date());

            // ⭐ Send data to JSP
            request.setAttribute("city", city);
            request.setAttribute("temperature", tempInCelsius);
            request.setAttribute("humidity", humidity);
            request.setAttribute("windSpeed", windSpeed);
            request.setAttribute("visibility", visibilityKm);
            request.setAttribute("weatherCondition", weatherCondition);
            request.setAttribute("cloudCover", cloudCover);
            request.setAttribute("date", date);
            request.setAttribute("currentTime", time);

            // ⭐ Forward to result.jsp
            request.getRequestDispatcher("result.jsp").forward(request, response);

            connection.disconnect();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching weather data.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
