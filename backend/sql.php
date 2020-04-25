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

function getApplicantByName($name) {
	global $db;
	$query = "select * from applicants where name=:name";
	$statement = $db->prepare($query);
	$statement->bindValue(':name', $name);
	$statement->execute();
	$results = $statement->fetchAll();
	$statement->closeCursor();
	return $results;
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

function upvoteBachelor($ID) {
	global $db;
	$query = "update bachelor set rose_ranking = rose_ranking + 0.1 where bachelorID=:ID";
	$statement = $db->prepare($query);
	$statement->bindValue(':ID', $ID);
	$statement->execute();
	$statement->closeCursor();
}

function downvoteBachelor($ID) {
	global $db;
	$query = "update bachelor set rose_ranking = rose_ranking - 0.1 where bachelorID=:ID";
	$statement = $db->prepare($query);
	$statement->bindValue(':ID', $ID);
	$statement->execute();
	$statement->closeCursor();
}

function updateNumVoters($ID) {
	global $db;
	$query = "update bachelor set num_voters = num_voters + 1 where bachelorID=:ID";
	$statement = $db->prepare($query);
	$statement->bindValue(':ID', $ID);
	$statement->execute();
	$statement->closeCursor();
}

function upvoteContestant($ID) {
	global $db;
	$query = "update contestant set rose_ranking = rose_ranking + 0.05 where contestantID=:ID";
	$statement = $db->prepare($query);
	$statement->bindValue(':ID', $ID);
	$statement->execute();
	$statement->closeCursor();
}

function downvoteContestant($ID) {
	global $db;
	$query = "update contestant set rose_ranking = rose_ranking - 0.05 where contestantID=:ID";
	$statement = $db->prepare($query);
	$statement->bindValue(':ID', $ID);
	$statement->execute();
	$statement->closeCursor();
}


?>