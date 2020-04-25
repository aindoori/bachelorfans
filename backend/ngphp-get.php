
<?php

//header('Access-Control-Allow-Origin: http://localhost:4200');
header('Access-Control-Allow-Origin: *');
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
// if(isset($data['session'])){
//   $response['sessionid'] = $data['session'];
//   session_id( $data['session']);
// }
// session_start();

switch ($type) {
  case "get_all_bachelors":
    $response['hello'] = 'hi there';
    $sqldata = getAllBachelors();
    // $response['update'] = 'SQL ran!';

    if ($sqldata) {
      $sqlparse = [];

      foreach ($sqldata[0] as $k => $v)
      {
        $sqlparse[$k] = $v;
      }

      $bachelor = (object) [
        'bachelorID' => $sqlparse['bachelorID'], 
        'bachelor_name' => $sqlparse['bachelor_name'], 
        'rose_ranking' => $sqlparse['rose_ranking'], 
        'num_voters' => $sqlparse['num_voters']
      ];

      $response['data'] = $bachelor;
      $response['success'] = "true";

    break;

  case "display_bachelors":
    // parse the data

    break;

  case "display_contestants":
    // includes professions and school degrees
    break;

  case "display_dates":
    $query = "SELECT * FROM dates";  
    $result = mysqli_query($connect, $query);//mysqlquery?  
    if(mysqli_num_rows($result) > 0) {  
      while($row = mysqli_fetch_array($result)){  
           $output[] = $row;  
      }  
    echo json_encode($output); 
    break;

  case "display_courted":
    $query = "SELECT * FROM courted";  
    $result = mysqli_query($connect, $query);//mysqlquery?  
    if(mysqli_num_rows($result) > 0) {  
      while($row = mysqli_fetch_array($result)){  
           $output[] = $row;  
      }  
    echo json_encode($output);
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