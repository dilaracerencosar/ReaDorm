<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $conn = new mysqli('localhost', 'username', 'password', 'BOOKWEBSITE');

    if ($conn->connect_error) {
        die('Connection failed: ' . $conn->connect_error);
    }

    $sql = "INSERT INTO Users (username, password) VALUES ('$username', '$password')";

    if ($conn->query($sql) === TRUE) {
        echo 'Registration successful!';
    } else {
        echo 'Error registering user.';
    }

    $conn->close();
}
?>
