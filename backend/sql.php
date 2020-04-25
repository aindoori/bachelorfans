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

// alter table applicants auto_increment = 1;
function deleteApplicant($name) {
	global $db;
	$query = "delete from applicants where name=:name";
	$statement = $db->prepare($query);
	$statement->bindValue(':name', $name);
	$statement->execute();
	$statement->closeCursor();
}

function getAllBachelors() {
	global $db;
	$query = "CALL `getBachelors`()";
	$statement = $db->prepare($query);
	$statement->execute();
	$results = $statement->fetchAll();
	$statement->closeCursor();
	return $results;
}

// helper function for the stored procedure
function getRoseRanking($ID) {
	global $db;
	$query = "select rose_ranking from bachelor where bachelorID = :ID";
	$statement = $db->prepare($query);
	$statement->execute();
	$results = $statement->fetchAll();
	$statement->closeCursor();
	return $results;
}

function getNumVoters($ID) {
	global $db;
	$query = "select num_voters from bachelor where bachelorID = :ID";
	$statement = $db->prepare($query);
	$statement->execute();
	$results = $statement->fetchAll();
	$statement->closeCursor();
	return $results;
}

function upvoteBachelor($ID, $numVoters) {

}


?>