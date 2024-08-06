﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pagehome.aspx.cs" Inherits="pagehome" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to the ReaDorm</title>
    <link rel="stylesheet" href="style1.css">
    <script src="https://kit.fontawesome.com/ae7ab48eb0.js" crossorigin="anonymous"></script> 
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>

#inside-content {
  
  padding: 30px;  
 display:block;
 flex-direction: row;
 background-color: #fffbee;

}

       #inside-content ul {
  list-style: none;
  padding: 10px; /* Add 'px' after the value */
}

#inside-content ul li {
  margin-bottom: 40px;
  margin-top: 30px;
  margin-left: 0px;
  margin-right: 10px;
}
#inside-content a {
  text-decoration: none;
  color: rgb(59, 39, 0);
}

#inside-content a:hover {
  color: #a77f37;
}
#inside-content p{
    text-align: center;
            max-width: 1000px;
        font-size: larger;    
}
#inside-content h1{
    text-align: left;
}
#inside-content img {
    max-width: 100%;
    height: auto;
    border-radius: 5px;
    max-height: 250px;
}
#instagram-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            z-index: 1000;
        }

        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        button:hover {
            background-color: #45a049;
        }
        header {
            text-align: center;
        }

        header a {
            float: right;
            color: white; 
            text-decoration: none; 
            transition: color 0.3s; /* Add transition for hover effect */
            margin-right: 10px;
        }
        header a:hover {
            color: #ffdb8e; /* Change text color on hover */
        }
        customButton {
        background-color: #1F4502;
        color: white;
        margin-left: 10px;
    }

    .customLabel {
        margin-left: 10px;
    }
       

    </style>
    <script type="text/javascript">
        function confirmLogout() {
            var confirmLogout = confirm("Are you sure you want to logout?");
            if (confirmLogout) {
                window.location.href = "proje.aspx?action=logout";
            }
        }

        function getWeather(city) {
            $.ajax({
                url: "http://localhost:59713/api/values/weather?city=" + city, // Replace "port" with your actual port number
                type: "GET",
                success: function (data) {
                    // Handle the weather data here
                    displayWeather(data);
                },
                error: function (error) {
                    console.log("Error fetching weather data: " + error.statusText);
                }
            });
        }

        function displayWeather(weatherData) {
            // Assuming the weatherData structure includes city, weather_description, and temperature
            var weatherInfo = `
            <h2>Weather in ${weatherData.city}</h2>
            <p>Description: ${weatherData.weather_description}</p>
            <p>Temperature: ${weatherData.temperature} Â°C</p>
        `;

            // Display the weather information in the weatherInfo div
            $("#weatherInfo").html(weatherInfo);
        }
        function clearTextBoxContent() {
            TextBoxCity.value = '';
        }
    </script>
   
</head>
<body>
     <form id="form1" runat="server">
     <header>
        ReaDorm
        <a href="proje.aspx">Login</a>
        <a href="#" onclick="confirmLogout()">Logout</a>
        <!-- Add a textbox for the city input -->
        &nbsp;<!-- Add a button to trigger the weather API -->
    
    </header>
    <div id="inside-content">
        <h1> Welcome to the Readorm!!</h1>
        <p>
            Dive into the enchanting world of books where every page unfolds a new adventure, a fresh perspective, and a world of imagination. At "ReaDorm," we celebrate the magic of words and the stories that captivate our hearts and minds.
        </p>
        <p>Explore our vast collection of book reviews, curated recommendations, and insightful commentary from fellow book enthusiasts. From classic literature to contemporary bestsellers, we embrace the diverse landscape of literature and invite you to be a part of the conversation.</p>
      <p> Here is some of the types of the books that we have. Maybe you wanna see!</p>
    
      
        <ul>
       
        <li><a href="https://www.abebooks.com/books/100-books-to-read-in-lifetime/"><i class="fa-solid fa-robot"></i> Fiction</a>
            <br>
            <br>
            <a href="book1.aspx">
                <img src="book1.jpg" alt="Book 1"></a>
                <a href="book2.aspx">
                    <img src="book2.jpg" alt="Book 2"></a>
        <img src="onehundredyearssolitude.jpg" alt="">
        <img src="greatgatsby.jpg" alt="">
        <img src="kiterunner.jpg" alt="">
    </li>
       
        <li><a href="https://time.com/collection/best-mystery-thriller-books/"><i class="fa-solid fa-user-secret"></i> Mystery/Thriller</a>
            <br>
            <br>
        <img src="baskerville.jpg" alt="">
        <img src="biglittlelies.jpg" alt="">
        <img src="gonegirl.jpg" alt="">
        <img src="inthewoods.jpg" alt="">
        <img src="thegirlwithdragontatto.jpg" alt="">
    </li>
        <li><a href="https://www.esquire.com/entertainment/books/g39358054/best-sci-fi-books/"><i class="fa-brands fa-space-awesome"></i> Science Fiction</a>
            <br>
            <br>
        <img src="dune.jpg" alt="">
        <img src="neuromancer.png" alt="">
        <img src="snowcrash.jpg" alt="">
        <img src="endersgame.jpg" alt="">
        <img src="lefthandofdarkness.jpg" alt="">
        </li>
    
        <li><a href="https://www.panmacmillan.com/blogs/history/best-historical-fiction-books"><i class="fa-solid fa-timeline"></i> Historical Fiction</a>
            <br>
            <br>
            <img src="bookthief.jpg" alt="">
        <img src="alltheligthwecannotsee.jpg" alt="">
        <img src="pillars.jpg" alt="">
        <img src="wolfhall.jpg" alt="">
        <img src="nigthingale.jpg" alt=""></li>
    
        <li><a href="https://reedsy.com/discovery/blog/best-romance-novels"><i class="fa-solid fa-heart"></i> Romance</a>
            <br>
            <br>
            <img src="pride.jpg" alt="">
        <img src="outlander.jpg" alt="">
        <img src="mebeforeyou.jpg" alt="">
        <img src="notebook.jpg" alt="">
        <img src="redwhiteblue.jpg" alt="">
    </li>
        <li><a href="https://www.esquire.com/entertainment/books/g42108589/best-biographies/"><i class="fa-solid fa-book-atlas"></i> Biography</a>
            <br>
            <br>
            <img src="thediaryofayounggirl.jpg" alt="">
        <img src="stevejjobs.jpg" alt="">
        <img src="theimmortal.jpg" alt="">
        <img src="unbroken.jpg" alt="">
        <img src="malcolmx.jpg" alt="">
    </li>
        <li><a href="https://fourminutebooks.com/best-self-help-books/"><i class="fa-solid fa-hand-holding-hand"></i> Self-Help</a>
            <br>
            <br>
            <img src="7habits.jpg" alt="">
        <img src="atomic habits.jpg" alt="">
        <img src="powerofnow.jpg" alt="">
        <img src="badass.jpg" alt="">
        <img src="4agreements.jpg" alt="">
            <br/>
         <li><asp:TextBox ID="TextBoxCity" runat="server" Text="Enter your City" onfocus="clearTextBoxContent();"></asp:TextBox>
   <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get Weather" Width="103px" Height="46px" Style="background-color: #1F4502; color: white; margin-left: 10px;" />
<asp:Label ID="LabelResult" runat="server" Text="Here is the Weather" Style="margin-left: 10px;"></asp:Label>
 </li>
    </li>
       </ul>
    </div>



    <div id="nav-content" tabindex="0">
        <ul>
            <li><a href="pagehome.aspx">Home</a></li>
            <li><a href="proje1.aspx">Main Page</a></li>
            <li><a href="blog.aspx">Blog</a></li>
            <li><a href="aabout.aspx">About</a></li>
            <li><a href="ccontact.aspx">Contact</a></li>
            <li class="small">
              <a href="#0" onclick="showInstagramPopup()"><i class="fa-brands fa-facebook"></i>  Facebook</a>
              
          </li>
          <li>
            <a href="#0" onclick="showInstagramPopup()"><i class="fab fa-instagram"></i>  Instagram</a>
          </li>
          <li>
            <a href="#0" onclick="showInstagramPopup()"><i class="fa-brands fa-twitter"></i>  Twitter</a>
          </li>
        </ul>
    </div>
  <br>
  <br>
  
  <div id="instagram-popup">

    <p>We are currently working on this :)</p>
    <button onclick="closeInstagramPopup()">Close</button>
</div>
<div id="overlay"></div>
<script>
    function showInstagramPopup() {
       
        document.getElementById('overlay').style.display = 'block';
        document.getElementById('instagram-popup').style.display = 'block';
    }

    function closeInstagramPopup() {
    
        document.getElementById('overlay').style.display = 'none';
        document.getElementById('instagram-popup').style.display = 'none';
    }
</script>
     </form>
</body>
</html>