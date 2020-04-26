<?php
// created new user in xampp
function initBackend() {
	$username = 'bachelorfans';
	$password = 'mike4bachelor2020';
	$servername = 'localhost';
	$dbname = 'bachelorfans';
	$conn = new mysqli($servername, $username, $password, $dbname);
	return $conn;
}

?>