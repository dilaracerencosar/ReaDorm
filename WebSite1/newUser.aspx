<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newUser.aspx.cs" Inherits="newUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="readormamblem.jpg" type="image/x-icon">
    <title>Register Page</title>
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
        border-radius: 4px;
        cursor: pointer;
    }
        .auto-style2 {
            width: 100%;
            height: 425px;
        }
        .auto-style3 {
            height: 61px;
        }
        </style>
</head>
<body>
    <div id="intro-container">
    <h1>Welcome to ReaDorm</h1>
    <p>Explore a world of literature and discover your next favorite book.</p>

    <div id="login-form">
        <h2>Create Your Account</h2>
        <form id="form1" runat="server">
            

            <table class="auto-style2">
                <tr>
                    <td><label for="first_name">First name: </label></td>
                    <td>
                        <asp:TextBox ID="fname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFname" runat="server" ControlToValidate="fname"
                            ErrorMessage="First Name is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><label for="middle_name">Middle name: </label></td>
                    <td>
                        <asp:TextBox ID="mname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><label for="last_name">Last name: </label></td>
                    <td>
                        <asp:TextBox ID="lname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLname" runat="server" ControlToValidate="lname"
                            ErrorMessage="Last name is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><label for="phone_number"> Phone Number: </label></td>
                    <td>
                        <asp:TextBox ID="phone" runat="server" TextMode="Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="phone"
                            ErrorMessage="Phone number is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><label for="age"> Age: </label></td>
                    <td>
                        <asp:TextBox ID="age" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="age"
                            ErrorMessage="Age is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><label for="email"> Email: </label></td>
                    <td>
                        <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="email"
                            ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><label for="password"> Password: </label></td>
                    <td>
                        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password"
                            ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <asp:Button ID="registerButton" runat="server" Text="Register" BackColor="#1F4502" ForeColor="White" Width="100px" OnClick="registerButton_Click"/>
        </form>
    </div>
</div>
</body>
</html>