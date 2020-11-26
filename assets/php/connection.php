<?php
  $host = "localhost";
  $userName = "root";
  $userPassword = "";
  $dbName = "Asiatic360";

  $connection = mysqli_connect($host, $userName, $userPassword, $dbName);
  if (!$connection) {
    echo "Error: " . mysqli_connect_error();
    exit();
  }
?>
