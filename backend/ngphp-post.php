
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
$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

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

  case "add_applicant":
    // parse the data
    $parse_applicant = [];
    foreach ($data['user'] as $k => $v)
    {
      $parse_applicant[$k] = $v;
    }

    $name = $parse_applicant['name'];
    $_SESSION['applicantName'] = $name;
    $hash_pwd = password_hash(htmlspecialchars($data['pwd']), PASSWORD_BCRYPT);
    $age = $parse_applicant['age'];
    $hometown_city = $parse_applicant['hometown_city'];
    $hometown_state = $parse_applicant['hometown_state'];
    $profession = $parse_applicant['profession'];
    $reason = $parse_applicant['reason'];

    try {
      addApplicant($name, $hash_pwd, $age, $hometown_city, $hometown_state, $profession, $reason);
      $response['success'] = "true";

    } catch (Exception $e){
      $response['success'] = "false";
      $response['error'] = $e;
    }

    break;

  case "update_applicant":
    // parse the data
    $parse_applicant = [];
    foreach ($data['user'] as $k => $v)
    {
      $parse_applicant[$k] = $v;
    }

    $name = $parse_applicant['name'];
    // $_SESSION['applicantName'] = $name;
    $hash_pwd = password_hash(htmlspecialchars($data['pwd']), PASSWORD_BCRYPT);
    $age = $parse_applicant['age'];
    $hometown_city = $parse_applicant['hometown_city'];
    $hometown_state = $parse_applicant['hometown_state'];
    $profession = $parse_applicant['profession'];
    $reason = $parse_applicant['reason'];

    try {
      updateApplicant($name, $hash_pwd, $age, $hometown_city, $hometown_state, $profession, $reason);
      $response['success'] = "true";

    } catch (Exception $e){
      $response['success'] = "false";
      $response['error'] = $e;
    }

    break;

  case "delete_applicant":
    try {
      deleteApplicant($data['name']);
      $response['success'] = "true";
      
    } catch (Exception $e){
      $response['success'] = "false";
      $response['error'] = $e;
    }
    break;
    
  break;
  default:
    $response['message'] = "Invalid type" . $type;
}

// Send response (in json format) back the front end
echo json_encode($response);

?>