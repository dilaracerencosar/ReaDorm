<%@ Page Language="C#" AutoEventWireup="true" CodeFile="book11.aspx.cs" Inherits="book11" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="readormamblem.jpg" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Details</title>
    <link rel="stylesheet" href="book2.css">
    <script src="https://kit.fontawesome.com/ae7ab48eb0.js" crossorigin="anonymous"></script>
    <style>
      
h5{
    color:  #450202;
}
button {
  background-color: #1F4502;
  color: #fff;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
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
            margin-right: 10px;
            text-decoration: none; 
            transition: color 0.3s; /* Add transition for hover effect */
        }
        header a:hover {
            color: #ffdb8e; /* Change text color on hover */
        }

        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 26px;
        }
       
#commentsBlock {
    display: block;
    position: relative;
    top: 0px;
    left: 250px;
    padding: 20px;
    z-index: 1;
    width: 75%;
    background-color: #fffbee;
    max-height: 400px; /* Adjust the maximum height as needed */
    overflow-y: auto; /* Add this line to enable vertical scrolling if needed */
}
       #user-comment {
    margin-top: 20px; /* Add margin to the top */
    margin-left: 250px; /* Add left margin as needed */
    margin-bottom: 50px;
   
}

#user-comment form {
    margin-top: 10px; /* Add top margin to the form within user-comment */
}
#book-details{
    margin-top: 250px;
}

    </style>
    <script>
        function submitComment() {
            // Check if the user is logged in (you need to implement this check)

            // Get values from the form
            var commentMessage = document.getElementById("commentMessage").value;
            var starRating = document.getElementById("starRating").value;

            // Make an AJAX request to your server to save the comment and rating
            // You may want to use a library like jQuery or Fetch API for this

            // After successfully saving the comment, update the comments section on the page
            // You may reload the comments from the server or dynamically append the new comment
        }

    </script>
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
        
            <div id="nav-content" tabindex="0">
                <ul>
                    <li><a href="pagehome.aspx">Home</a></li>
                    <li><a href="proje1.aspx">Main Page</a></li>
                    <li><a href="blog.aspx">Blog</a></li>
                    <li><a href="aabout.aspx">About</a></li>
                    <li><a href="ccontact.aspx">Contact</a></li>
                    <li class="small">
                      <a href="#0" onclick="showInstagramPopup()"><i class="fa-brands fa-facebook"></i> Facebook</a>
                    </li>
                    <li>
                      <a href="#0" onclick="showInstagramPopup()"><i class="fab fa-instagram"></i> Instagram</a>
                    </li>
                    <li>
                        <a href="#0" onclick="showInstagramPopup()"><i class="fa-brands fa-twitter"></i>  Twitter</a>
                    </li>
                </ul>
            </div>

    <br>
    <div class="bookPage">
        <div id="bookPage-left">
            <div id="book-image">
                <div>
                    <img id="responsiveImg" src="martineden.jpg" alt="Book 11">
                </div>    
                
            </div>
        </div>
        <div id="bookPage-right">
            <div id="book-details">
                <h2>Martin Eden</h2>
                <p id="summary"><span style="color: #450202;"><strong>Summary:</strong></span>The semiautobiographical Martin Eden is the most vital and original character Jack London ever created. Set in San Francisco, this is the story of Martin Eden, an impoverished seaman who pursues, obsessively and aggressively, dreams of education and literary fame. London, dissatisfied with the rewards of his own success, intended Martin Eden as an attack on individualism and a criticism of ambition; however, much of its status as a classic has been conferred by admirers of its ambitious protagonist.
                    Andrew Sinclair's wide-ranging introduction discusses the conflict between London's support of socialism and his powerful self-will. Sinclair also explores the parallels and divergences between the life of Martin Eden and that of his creator, focusing on London's mental depressions and how they affected his depiction of Eden.</p>
                <hr>
                <p id="writer"><span style="color: #450202;"><strong>Writer:</strong></span> Jack London</p>
                <hr>
                <a id="purchase-button" href="https://www.dr.com.tr/Kitap/Martin-Eden-Modern-Klasikler-38/Jack-London/Edebiyat/Roman/Dunya-Klasik/urunno=0000000608697" target="_blank">Purchase</a>
            </div>
        </div>
        <div id="commentsBlock" runat="server">
           <h3><span style="color: #450202;"><strong>Comments About This Book</strong></span></h3>
            
        </div>
   
    <div id="user-comment">
    <h3><span style="color: #450202;"><strong>Add Your Comment and Rating</strong></span></h3>
    <form id="commentForm" runat="server">
        <textarea id="commentMessage1" name="commentMessage" rows="4" cols="50" placeholder="Enter your comment" runat="server"></textarea>
        <br>
        <label for="starRating1" >Star Rating:</label>
        <select id="starRating1" runat="server" name="starRating">
            <option value="1">1 star</option>
            <option value="2">2 stars</option>
            <option value="3">3 stars</option>
            <option value="4">4 stars</option>
            <option value="5">5 stars</option>
             
        </select>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Comment" style="background-color: #1F4502; color: #ffff;"/>
        <br>

    </form>
</div>
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