<%@ Page Language="C#" AutoEventWireup="true" Debug="true" CodeFile="blog.aspx.cs" Inherits="blog" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style1.css">
    <link rel="icon" href="readormamblem.jpg" type="image/x-icon">
    <script src="https://kit.fontawesome.com/ae7ab48eb0.js" crossorigin="anonymous"></script> 
    <title>My Blog</title>
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
#user-info {
        text-align: center;
        margin-bottom: 20px;
    }
    #user-photo {
        border-radius: 50%;
        max-width: 150px;
        margin-bottom: 10px;
    }
    #books-container {
        border: 1px solid #ddd;
        padding: 20px;
    }
    .book {
        border-bottom: 1px solid #ddd;
        padding: 10px 0;
        display: block;
        
    }
   
    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
      
        color: white;
    }

    #text {
        flex-grow: 1; /* Allow the text to grow and take up available space */
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
  .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-button {
        background-color: #1F4502;
        color: white;
        padding: 10px;
        border: none;
        cursor: pointer;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        z-index: 1;
        right: 0; /* Position the dropdown to the right */
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {
        background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
        display: block;
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
              <div id="text">ReaDorm</div>

     <div class="dropdown">
    <button class="dropdown-button">Dropdown</button>
    <div class="dropdown-content">
        <a href="#"onclick="confirmLoginandout()">Login</a>
        <a href="#"onclick="confirmLogout()">Logout</a>

    </div>
</div>

</header>
    <div id="inside-content">

    <div id="user-info">
         
        <asp:Repeater ID="rptMemberData" runat="server">
            <ItemTemplate>
                <div class="book">
            <img id="user-photo" src="user.jpg" alt="User Photo">
            <h2>Name: <%# Eval("memberf_name") %> <%# Eval("memberm_name") %> <%# Eval("memberl_name") %></h2>
            <p>Email: <%# Eval("email") %></p>
        </div>
            </ItemTemplate>
        </asp:Repeater>
       
    </div>

    <div id="books-container">
        <h2>My Bookshelf</h2>
        <asp:Repeater ID="rptBooks" runat="server">
            <ItemTemplate>
                 <div class="book">
            <img id="unknownBook-photo" src="unknownBook.png" alt="Book Photo" style="width: 150px; height: 150px;">
            <h3><%# Eval("book_name") %></h3>
            <p>Author: <%# Eval("author_name") %></p>
            <!-- Add other book details as needed -->
        </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

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