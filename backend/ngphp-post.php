
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
  case "login":
    $sqldata = getApplicantByName($data['name']);
    if($sqldata){
      // $sqlparse = parse($sqldata[0]);
      $pwd = htmlspecialchars($data['pwd']);
      if (password_verify($pwd, $sqldata[0]['hash_pwd'])){
        //$user = make_user($sqldata[0]);
        // make a user
        $applicant = (object) [
          'name' => $sqldata[0]['name'], 
          'age' => $sqldata[0]['age'], 
          'hometown_city' => $sqldata[0]['hometown_city'], 
          'hometown_state' => $sqldata[0]['hometown_state'], 
          'profession' => $sqldata[0]['profession'], 
          'reason' => $sqldata[0]['reason']
        ];

        $_SESSION['user'] = $applicant;
        $response['data'] = $applicant;
        $response['success'] = true;
        $response['session'] = session_id();
        $response['messsage'] = "Passwords Match!";

      } else{
        $response['messsage'] = "Wrong Password!";
      }
    } else{
      $response['messsage'] = "User does not exist!";
    }
    
    // Start Session
    break;

  case "logout":
    if(empty($data['session'])){
      $response['error'] = "Error: No Session ID provided";
      $response['message'] = "not signed in";

    } else {  // Check if there are session variables
       foreach ($_SESSION as $key => $value)
       {
          unset($_SESSION[$key]);
       }
       session_destroy();     // complete terminate the session
       $response['message'] = "Log Out Success!";
       $response['success'] = true;
    }

    break;

  case "upvote_bachelor":
    try {
        upvoteBachelor($data['bachID']);
        updateNumVoters($data['bachID']);
        $response['success'] = "true";
        
      } catch (Exception $e){
        $response['success'] = "false";
        $response['error'] = $e;
      }
      break;

  case "downvote_bachelor":
  try {
      downvoteBachelor($data['bachID']);
      updateNumVoters($data['bachID']);
      $response['success'] = "true";
      
    } catch (Exception $e){
      $response['success'] = "false";
      $response['error'] = $e;
    }
    break;

    case "upvote_contestant":
    try {
        upvoteContestant($data['contestantID']);
        $response['success'] = "true";
        
      } catch (Exception $e){
        $response['success'] = "false";
        $response['error'] = $e;
      }
      break;

  case "downvote_contestant":
  try {
      downvoteContestant($data['contestantID']);
      $response['success'] = "true";
      
    } catch (Exception $e){
      $response['success'] = "false";
      $response['error'] = $e;
    }
    break;

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