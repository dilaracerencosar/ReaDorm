<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aabout.aspx.cs" Inherits="aabout" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="style1.css">
    <link rel="icon" href="readormamblem.jpg" type="image/x-icon">
    <script src="https://kit.fontawesome.com/ae7ab48eb0.js" crossorigin="anonymous"></script> 
    <style>
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
    
    #topic{
        font-size: 60;
        margin: 0 auto;
    }
    
    #inside-content {
        text-align: center;
            color: #450202;
            max-width: 800px;
            margin: 0 auto;
            
        }
    #image-container {
            display: flex;
            justify-content: space-between;
            max-width: 800px;
            margin: 0 auto;
        }

        #topic {
            font-size: 18px; /* Yazı boyutunu ayarlayabilirsiniz */
            max-width: 800px;
            margin: 0 auto;
        }

        #main-image {
            max-width: 350px; /* Fotoğraf genişliğini ayarlayabilirsiniz */
            height: auto;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        #text-content {
            max-width: 500px;
        }
        #nav-content {
            text-align: center;
        }
        header {
            text-align: center;
        }

        header a {
            float: right;
            color: white; 
            margin-right: 10px;
            text-decoration: none; 
            transition: color 0.3s; /* Add transition for hover effect */
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
        function confirmLoginandout() {
            var confirmLogout = confirm("Are you sure you want to login again?");
            if (confirmLogout) {
                window.location.href = "proje.aspx?action=logout";
            }
        }
    </script>
</head>
<body>
              <header>
    ReaDorm
   <a href="#" onclick="confirmLoginandout()">Login</a> 
    
        <a href="#" onclick="confirmLogout()">Logout</a>
   
</header>
    <div id="inside-content">
        <img id="main-image" src="readormamblem.jpg" alt="ReaDorm Logo" style="float:center;width:500px;height:700px;">
        <h1> Wanna Know About Us?</h1>
        <p id="topic">
            ReaDorm is a captivating digital haven for bibliophiles, meticulously designed to cater to the literary cravings of book enthusiasts. Functioning as a panoramic hub of knowledge, ReaDorm seamlessly combines an extensive collection of books with insightful summaries and user-generated comments, creating a dynamic and immersive digital library experience. Users can delve into a rich tapestry of literary works, explore detailed book summaries, and engage in a community of fellow readers, sharing their thoughts and recommendations. With ReaDorm, the joy of reading extends beyond the pages, fostering a vibrant online ecosystem where literature comes to life, and connections are forged through the shared love of books.
        </p>

        <p id="topic">
            Our journey into the realm of literature began as a conversation about a specialized webpage dedicated solely to books. The inception of this discussion revolved around the idea of creating a unique digital space, tailor-made for book enthusiasts and readers seeking a dedicated platform for literary exploration. From the initial exchange, the focus was clear crafting a webpage that not only showcases an extensive collection of books but also provides insightful summaries and a community-driven space for discussions. The vision unfolded as we explored design elements, coding nuances, and user experience, culminating in the concept of a virtual library named ReaDorm. Our dialogue seamlessly transitioned from conceptualizing the webpage's layout to refining its features, aiming to offer an immersive and enriching reading experience for users passionate about the written word.

        </p>
        <p id="topic">
            In short, our love for books was the cause of ReaDorm's birth.

        </p>
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
</body>
</html>
