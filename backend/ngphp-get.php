
<?php

header('Access-Control-Allow-Origin: http://localhost:4200');
// header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Authorization, Accept, Client-Security-Token, Accept-Encoding');
header('Access-Control-Max-Age: 1000');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');

// get the size of incoming data
// $content_length = (int) $_SERVER['CONTENT_LENGTH'];
require('connectdb.php');
require('sql.php');

// retrieve data from the request
$getdata = file_get_contents("php://input");
$request = json_decode($getdata);

// Parse retrieved Data
$parse = []; // indexing request directly didn't work, so manual copy
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

// Start session
if(isset($data['session'])){
  $response['sessionid'] = $data['session'];
  session_id( $data['session']);
}
session_start();

switch ($type) {

  case "display_bachelors":
    // parse the data

    break;

  case "display_contestants":
    // includes professions and school degrees
    break;

  case "display_dates":

    break;

  case "display_courted":
    break;

  case "display_attends":
    break;

  case "display_viewers":
    break;
    
  break;
  default:
    $response['message'] = "Invalid type" . $type;
}

// Send response (in json format) back the front end
echo json_encode($response);

?>