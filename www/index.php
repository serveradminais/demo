<?php
$servername = "172.20.0.3";
$username = "test";
$password = "test@123";
$db = "test";

// Create connection
$conn = new mysqli($servername, $username, $password, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully";


// Show all information, defaults to INFO_ALL
// phpinfo();

?> 