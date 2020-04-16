<?php

function addUser($name, $pwd, $cid, $dept, $role, $email, $profile_pic) {
	global $db;
	$query = "insert into user (name, hash_pwd, compID, dept, role, email, imgSrc) values (:name, :pwd, :cid, :dept, :role, :email, :imgSrc)";
	$statement = $db->prepare($query);
	$statement->bindValue(':name', $name);
	$statement->bindValue(':pwd', $pwd);
	$statement->bindValue(':cid', $cid);
	$statement->bindValue(':dept', $dept);
	$statement->bindValue(':role', $role);
	$statement->bindValue(':email', $email);
	$statement->bindValue(':imgSrc', $profile_pic);
	$statement->execute();
	$statement->closeCursor();
}

function updateUser($name, $pwd, $cid, $dept, $role, $email, $profile_pic) {
	global $db;
	$query = "update user set name=:name, hash_pwd=:pwd, dept=:dept, role=:role, email=:email, imgSrc=:imgSrc where compID=:cid";
	$statement = $db->prepare($query);
	$statement->bindValue(':name', $name);
	$statement->bindValue(':pwd', $pwd);
	$statement->bindValue(':cid', $cid);
	$statement->bindValue(':dept', $dept);
	$statement->bindValue(':role', $role);
	$statement->bindValue(':email', $email);
	$statement->bindValue(':imgSrc', $profile_pic);
	$statement->execute();
	$statement->closeCursor();
}

function getUserByID($cid) {
	global $db;
	$query = "select * from user where compID=:cid";
	$statement = $db->prepare($query);
	$statement->bindValue(':cid', $cid);
	$statement->execute();
	$results = $statement->fetchAll();
	$statement->closeCursor();
	return $results;
}

function addProject($title, $semester, $year, $dept, $faculty, $abstract, $proposal, $imgSrc) {
	global $db;
	$query = "insert into projectpage (title, semester, year, department, facultyAdvisor, abstract, projectProposal, imgSrc) values (:title, :semester, :year, :dept, :faculty, :abstract, :proposal, :imgSrc)";
	$statement = $db->prepare($query);
	$statement->bindValue(':title', $title);
	$statement->bindValue(':semester', $semester);
	$statement->bindValue(':year', $year);
	$statement->bindValue(':dept', $dept);
	$statement->bindValue(':faculty', $faculty);
	$statement->bindValue(':abstract', $abstract);
	$statement->bindValue(':proposal', $proposal);
	$statement->bindValue(':imgSrc', $imgSrc);
	$statement->execute();
	$statement->closeCursor();
}

function addTeamMember($project_title, $teamMember) {
	global $db;
	$query = "insert into teamMembers (project_title, teamMember) values (:project_title, :teamMember)";
	$statement = $db->prepare($query);
	$statement->bindValue(':project_title', $project_title);
	$statement->bindValue(':teamMember', $teamMember);
	$statement->execute();
	$statement->closeCursor();
}

function addKeyword($project_title, $keyword) {
	global $db;
	$query = "insert into keywords (project_title, keyword) values (:project_title, :keyword)";
	$statement = $db->prepare($query);
	$statement->bindValue(':project_title', $project_title);
	$statement->bindValue(':keyword', $keyword);
	$statement->execute();
	$statement->closeCursor();
}

function addSkillNeeded($project_title, $skill) {
	global $db;
	$query = "insert into skillsNeeded (project_title, skill) values (:project_title, :skill)";
	$statement = $db->prepare($query);
	$statement->bindValue(':project_title', $project_title);
	$statement->bindValue(':skill', $skill);
	$statement->execute();
	$statement->closeCursor();
}

?>