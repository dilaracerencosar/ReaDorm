<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="ccontact.aspx.cs" Inherits="ccontact" %>

<!DOCTYPE html>
<html lang="en">
    <link rel="icon" href="readormamblem.jpg" type="image/x-icon">
    <head runat ="server">
        <title>Contact Us</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style1.css">
        <script src="https://kit.fontawesome.com/ae7ab48eb0.js" crossorigin="anonymous"></script> 
        
        
        
        <style>
              form {
            max-width: 400px;
            margin: 0 auto;
            margin-left: 50px;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }

        input, textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
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
        button {
            background-color: #1F4502;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
        #popup {
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
     
        </style>

        <script type="text/javascript">
            function confirmLogout() {
                var confirmLogout = confirm("Are you sure you want to logout?");
                if (confirmLogout) {
                    window.location.href = "proje.aspx?action=logout";
                }
            }
        </script>
        
    </head>
    <body>
       <header>
    ReaDorm
   <a href="proje.aspx">Login</a> 
    
        <a href="#" onclick="confirmLogout()">Logout</a>
   
</header>
        <div id="Contact">
            <h1>Please Help ReaDorm For Better Service</h1>
            <form runat="server">
    <label for="fname">First Name:</label>
    <asp:TextBox ID="fnamebox" runat="server" ClientIDMode="Static"></asp:TextBox>

    <label for="mname">Middle Name:</label>
    <asp:TextBox ID="mnamebox" runat="server" ClientIDMode="Static"></asp:TextBox>

    <label for="lname">Last Name:</label>
    <asp:TextBox ID="lnamebox" runat="server" ClientIDMode="Static"></asp:TextBox>

    <label for="email">Email:</label>
    <asp:TextBox ID="emailbox" runat="server" ClientIDMode="Static"></asp:TextBox>

    <label for="message">Message:</label>
    <textarea id="message1" name="message" rows="4" runat="server" required></textarea>
<label for="slider">Select a value:</label>
            <input type="range" id="slider" name="slider" min="0" max="5" step="1" value="0" oninput="updateSliderValue(this.value)">

            <p id="sliderValue">Rating: 0</p>

<script>
    function updateSliderValue(value) {
        document.getElementById("sliderValue").innerText = "Give us a rating: " + value;
    }
</script>
    <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="Button1_Click" />
</form>
            <div id="overlay"></div>

    <div id="popup">
        <p>Thank you for contacting us!k="closePopup()"></p>
    </div>
 

    <script>
        function submitForm(event) {
            event.preventDefault();


            document.getElementById('overlay').style.display = 'block';
            document.getElementById('popup').style.display = 'block';

            //  reset the form fields after submission
            document.getElementById('contact-form').reset();
        }

        function closePopup() {

            document.getElementById('overlay').style.display = 'none';
            document.getElementById('popup').style.display = 'none';
        }
    </script>
        </div>


        <div id="nav-content" tabindex="0">
            <ul>
                <li><a href="pagehome.aspx">Home</a></li>
                <li><a href="proje1.aspx">Main Page</a></li>
                <li><a href="blog.aspx">Blog</a></li>
                <li><a href="aabout.aspx">About</a></li>
                <li><a href="ccontact.aspx">Contact</a></li>
                <li class="small">
                  <a href="#0"  onclick="showInstagramPopup()"><i class="fa-brands fa-facebook"></i>  Facebook</a>
                  
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
      <div id="instagram-popup">
  
        <p>We are currently working on this :) </p>
        <button onclick="closeInstagramPopup()">Close</button>
    </div>
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
      <br>
    </body>
</html>