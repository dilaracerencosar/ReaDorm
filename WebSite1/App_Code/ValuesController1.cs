using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

public class ValuesController1 : ApiController
{
    private const string ApiKey = "8d3b4bf3bad6533879dcdf0ef8abc083";
    private const string BaseUrl = "http://api.openweathermap.org/data/2.5/weather";

    // GET api/<controller>
    public IEnumerable<string> Get()
    {
        return new string[] { "value1", "value2" };
    }

    // GET api/<controller>/5
    public string Get(int id)
    {
        return "value";
    }

    // POST api/<controller>
    public void Post([FromBody] string value)
    {
    }

    // PUT api/<controller>/5
    public void Put(int id, [FromBody] string value)
    {
    }

    // DELETE api/<controller>/5
    public void Delete(int id)
    {
    }


    [HttpGet]
    [Route("api/values/weather")]
    public async Task<IHttpActionResult> GetWeather(string city)
    {
        if (string.IsNullOrEmpty(city))
        {
            return BadRequest("City parameter is missing");
        }

        string apiKey = "8d3b4bf3bad6533879dcdf0ef8abc083";
        string baseUrl = "http://api.openweathermap.org/data/2.5/weather";
        string apiUrl = $"{baseUrl}?q={city}&appid={apiKey}";

        using (HttpClient client = new HttpClient())
        {
            try
            {
                HttpResponseMessage response = await client.GetAsync(apiUrl);

                if (response.IsSuccessStatusCode)
                {
                    string jsonResponse = await response.Content.ReadAsStringAsync();
                    dynamic data = JObject.Parse(jsonResponse);

                    string weatherDescription = data.weather[0].description;
                    double temperature = data.main.temp;

                    var result = new
                    {
                        city = city,
                        weather_description = weatherDescription,
                        temperature = temperature
                    };

                    return Ok(result);
                }
                else
                {
                    string errorMessage = $"Error from OpenWeatherMap API: {response.ReasonPhrase}";
                    return BadRequest(errorMessage);
                }
            }
            catch (Exception ex)
            {
                return InternalServerError(new Exception($"Error fetching data: {ex.Message}"));
            }
        }
    }
}