<?php
  require 'connection.php';
  $e_id = $_GET['e_id'];
  $e_password = $_GET['e_password'];
  if ($e_id == "" && $e_password == "") {
    $status = "khali";
    echo json_encode(array('response' => $status));
  }

  $usersSQL = "SELECT * FROM users WHERE e_id = '$e_id' AND e_password = '$e_password'";
  $usersQUERY = mysqli_query($connection, $usersSQL);

  if (!mysqli_num_rows($usersQUERY) > 0) {
    $status = "failed";
    echo json_encode(array('response' => $status));
  } else {
    $usersROW = mysqli_fetch_assoc($usersQUERY);
    $u_id = $usersROW['id'];
    $users_detailsSQL = "SELECT * FROM users_details WHERE u_id = '$u_id'";
    $users_detailsQUERY = mysqli_query($connection, $users_detailsSQL);
    if (!mysqli_num_rows($users_detailsQUERY) > 0) {
      $status = "failed";
      echo json_encode(array('response' => $status));
    } else {
      $employee = array();
      $users_detailsROW = mysqli_fetch_assoc($users_detailsQUERY);
      $status = "ok";
      $firstname = $users_detailsROW['firstname'];
      $lastname = $users_detailsROW['lastname'];
      $nid_number = $users_detailsROW['nid_number'];
      $dob = $users_detailsROW['dob'];
      $blood_group = $users_detailsROW['blood_group'];
      $address = $users_detailsROW['address'];
      $marital_status = $users_detailsROW['marital_status'];
      $created_at = $users_detailsROW['created_at'];
      $employee[] = array(
        'response' => $status,
        'ID' => $e_id,
        'Name' => "$firstname $lastname",
        'NID' => $nid_number,
        'DoB' => $dob,
        'Blood Group' => $blood_group,
        'Address' => $address,
        'Marital Status' => $marital_status,
        'Active Since' => $created_at
      );
      $response['employee'] = $employee;
      echo json_encode($response);
    }
  }

  mysqli_close($connection);
?>
