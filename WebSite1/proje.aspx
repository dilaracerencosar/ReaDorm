<%@ Page Language="C#" AutoEventWireup="true" CodeFile="proje.aspx.cs" Inherits="proje" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="readormamblem.jpg" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COME 373 PROJECT</title>


    <style>
  
        body {
            font-family: 'Abril Fatface';
            background-color: #FFE9CC;
            background-image: url("indir.jpg");
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        #intro-container {
            text-align: center;
            max-width: 600px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
      
        h1 {
            
            color: #472003;
            font-family: 'Abril Fatface';
        }

        #login-form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #450202;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        button {
            background-color: #1F4502;
            color: #fff;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div id="intro-container">
        <h1>Welcome to ReaDorm</h1>
        <p>Explore a world of literature and discover your next favorite book.</p>

        <div id="login-form">
            <h2>Login to Your Account</h2>
            <form method="get" runat="server">
                <label for="username">Username:</label>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>

                <label for="password">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Required="true"></asp:TextBox>

                <asp:Button ID="button" runat="server" Text="Login" BackColor="#1F4502" ForeColor="White" Width="100px" OnClick="button_Click"  />
                
            </form>

            <a href="newUser.aspx"><button type="button" id="btnRegister" style="background-color: #1F4502; color: white; width: 100px;" onclick="btnRegister_Click()">Register</button></a>

        </div>
    </div>
</body>
</html>
