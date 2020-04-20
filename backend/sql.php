<?php

function addApplicant($name, $pwd, $age, $city, $state, $profession, $reason) {
	global $db;
	$query = "insert into applicants (name, hash_pwd, age, hometown_city, hometown_state, profession, reason) values (:name, :pwd, :age, :hometown_city, :hometown_state, :profession, :reason)";
	$statement = $db->prepare($query);
	$statement->bindValue(':name', $name);
	$statement->bindValue(':pwd', $pwd);
	$statement->bindValue(':age', $age);
	$statement->bindValue(':hometown_city', $city);
	$statement->bindValue(':hometown_state', $state);
	$statement->bindValue(':profession', $profession);
	$statement->bindValue(':reason', $reason);
	$statement->execute();
	$statement->closeCursor();
}

function updateApplicant($name, $pwd, $age, $city, $state, $profession, $reason) {
	global $db;
	$query = "update applicants set hash_pwd=:pwd, age=:age, hometown_city=:hometown_city, hometown_state=:hometown_state, profession=:profession, reason=:reason where name=:name";
	$statement = $db->prepare($query);
	$statement->bindValue(':name', $name);
	$statement->bindValue(':pwd', $pwd);
	$statement->bindValue(':age', $age);
	$statement->bindValue(':hometown_city', $city);
	$statement->bindValue(':hometown_state', $state);
	$statement->bindValue(':profession', $profession);
	$statement->bindValue(':reason', $reason);
	$statement->execute();
	$statement->closeCursor();
}

// have them type their username and password to confirm deletion
function deleteApplicant($name) {
	global $db;
	$query = "delete from applicants where name=:name";
	$statement = $db->prepare($query);
	$statement->bindValue(':name', $name);
	$statement->execute();
	$statement->closeCursor();
}


?>