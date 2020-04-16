<?php

header('Access-Control-Allow-Origin: http://localhost:4200');
// header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Authorization, Accept, Client-Security-Token, Accept-Encoding');
header('Access-Control-Max-Age: 1000');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');

require('connectdb.php');
require('sql.php');
session_start();

$getdata = $_GET['str'];     // param sent from Angular is named 'str'

// Process data
// (this example simply extracts the data and restructures them back)

// Extract json format to PHP array
$request = json_decode($getdata);
$parse = [];
foreach ($request as $k => $v)
{
  $parse[$k] = $v;
}

$type = $parse['type'];
$data = [];
foreach ($parse['data'] as $k => $v)
{
  $data[$k] = $v;
}
$response = [];
$response['success'] = false;
// $response['data'] = false;

switch ($type) {
  case "display_bachelors":
    // hello
    break;

  case "display_contestants":
    // hello
    break;

  case "display_contestant_professions":
    // hello
    break;

  case "display_contestant_school_degrees":
    // hello
    break;

  case "display_dates":
    // hello
    break;

  case "display_applicants":
    break;

  case "display_courted":
    // hello
    break;

  case "display_attends":
    // hello
    break;

  case "display_applies_to_date":
    // hello
    break;

  case "display_viewers":
    // hello
    break;

  case "profile":
    // hello
    break;
}

// Send response (in json format) back the front end
echo json_encode($response);

?>