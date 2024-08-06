using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pagehome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // Get the city from the user input, assuming you have a TextBox for the city
        string city = TextBoxCity.Text; // Replace TextBoxCity with the actual ID of your TextBox

        // Call the function to get weather information
        GetWeather(city);

    }
    private void GetWeather(string city)
    {
        try
        {
            // Replace "YOUR_API_KEY" with your actual OpenWeatherMap API key
            string apiKey = "8d3b4bf3bad6533879dcdf0ef8abc083";
            string baseUrl = "http://api.openweathermap.org/data/2.5/weather";
            string apiUrl = $"{baseUrl}?q={city}&appid={apiKey}";

            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync(apiUrl).Result;

                if (response.IsSuccessStatusCode)
                {
                    string jsonResponse = response.Content.ReadAsStringAsync().Result;
                    dynamic data = JObject.Parse(jsonResponse);

                    string weatherDescription = data.weather[0].description;
                    double temperature = data.main.temp;

                    // Update the UI with the weather information
                    LabelResult.Text = $"Weather in {city}: {weatherDescription}, Temperature: {temperature} °F";
                }
                else
                {
                    string errorMessage = $"Error from OpenWeatherMap API: {response.ReasonPhrase}";
                    // Handle the error, you might want to display it to the user
                    LabelResult.Text = errorMessage;
                }
            }
        }
        catch (Exception ex)
        {
            // Handle exceptions, log or display an error message
            LabelResult.Text = $"Error fetching data: {ex.Message}";
        }

    }
}