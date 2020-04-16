-- get data from the SQL database and then parse it into the angular class
create table if not exists user(
	name varchar(40) not null,
	hash_pwd varchar(80) not null,
	compID varchar(7) not null primary key,
	dept varchar(40) not null,
	role varchar(40) not null,
	email varchar(20) not null,
	imgSrc varchar(150) not null
);

create table if not exists projectpage(
	id int not null auto_increment primary key,
	title varchar(30) not null,
	semester varchar(10) not null,
	year int not null,
	department varchar(40) not null,
	facultyAdvisor varchar(40) not null,
	abstract varchar(700) not null,
	projectProposal varchar(60) not null,
	imgSrc varchar(150) not null
);

-- multivalued attributes
create table if not exists teamMembers(
	teamMember_id int not null auto_increment primary key,
	project_title varchar(30) not null,
	teamMember varchar(40) not null
);

create table if not exists keywords(
	keyword_id int not null auto_increment primary key,
	project_title varchar(30) not null,
	keyword varchar(40) not null
);

create table if not exists skillsNeeded(
	skill_id int not null auto_increment primary key,
	project_title varchar(30) not null,
	skill varchar(60) not null
);

-- INSERTING VALUES IN

insert into projectpage (title, semester, year, department, facultyAdvisor, abstract, projectProposal, imgSrc) values('Ultrasonic Haptic Feedback Collision Detection System', 'Fall', 2019, 'Electrical and Computer Engineering', 'Harry Powell', '2020 Vision is a device that increases awareness in the user’s blind spots, and involves the design, development, and production of a wearable device that communicates with the user using haptic feedback concerning incoming or approaching objects in the user’s environment. The MSP430 will perform the necessary calculations and power the embedded system, which entails detecting incoming collisions and notifying the user as appropriate. Users will be able to wear this device while during their daily routines to be informed of such dangers in their environment, creating an increase in situational awareness.', 'google.com', '../../assets/2020_vision.JPG');
insert into projectpage (title, semester, year, department, facultyAdvisor, abstract, projectProposal, imgSrc) values('Drone Surveillance of Deforestation', 'Spring', 2017, 'Mechanical and Aerospace Engineering', 'Eric Loth', 'As deforestation is becoming more and more of a problem, this team found a way to regulate its rate with drones.', 'google.com', '../../assets/sample_image_drone.PNG');
insert into projectpage (title, semester, year, department, facultyAdvisor, abstract, projectProposal, imgSrc) values('3D Printed Human Heart with Real Tissue', 'Spring', 2018, 'Biomedical Engineering', 'David Chen', 'Due to the increasing need for heart transplants around the world, 3D printing tissues will be more and more relevant.', 'google.com', '../../assets/sample_image_heart.PNG');
insert into projectpage (title, semester, year, department, facultyAdvisor, abstract, projectProposal, imgSrc) values('Robotic Cat for Comfort at International Airports', 'Fall', 2018, 'Electrical and Computer Engineering', 'Joanne Dugan', 'How many times have travelers coveted the attention of a robotic cat? Now, they can finally experience the loving companionship of this robotic cat while in the disgustingly inefficient JFK airport.', 'google.com', '../../assets/sample_image_cat.PNG');
insert into projectpage (title, semester, year, department, facultyAdvisor, abstract, projectProposal, imgSrc) values('Instant Scrumptious Bubble Tea Maker', 'Fall', 2019, 'Chemical Engineering', 'Eric Anderson', 'All around the world there is the crisis of not instantly gratifying that craving for bubble tea, so these Taiwanese musicians unite to build this splendid contraption.', 'google.com', '../../assets/sample_image_boba.jpg');
insert into projectpage (title, semester, year, department, facultyAdvisor, abstract, projectProposal, imgSrc) values('Taiwanese Bopomofo AR Visualizer', 'Spring', 2015, 'Electrical and Computer Engineering', 'Brad Campbell', "It's a well-known fact that bopomofo is by far the best way to learn Mandarin.  Mario Kart characters feel so strongly about this that they build this device as a gift to the world.", 'google.com', '../../assets/sample_image_bopomofo.jpg');

insert into teamMembers (project_title, teamMember) values('Ultrasonic Haptic Feedback Collision Detection System', 'Jazzy Whazzy');
insert into teamMembers (project_title, teamMember) values('Ultrasonic Haptic Feedback Collision Detection System', 'Joshie Woshie');
insert into teamMembers (project_title, teamMember) values('Ultrasonic Haptic Feedback Collision Detection System', 'Billy Willie');
insert into teamMembers (project_title, teamMember) values('Ultrasonic Haptic Feedback Collision Detection System', 'Renizzle Whizzle');
insert into teamMembers (project_title, teamMember) values('Drone Surveillance of Deforestation', 'Wonder Woman');
insert into teamMembers (project_title, teamMember) values('Drone Surveillance of Deforestation', 'The Flash');
insert into teamMembers (project_title, teamMember) values('Drone Surveillance of Deforestation', 'Superman');
insert into teamMembers (project_title, teamMember) values('Drone Surveillance of Deforestation', 'Green Lantern');
insert into teamMembers (project_title, teamMember) values('3D Printed Human Heart with Real Tissue', 'Spiderman');
insert into teamMembers (project_title, teamMember) values('3D Printed Human Heart with Real Tissue', 'Captain America');
insert into teamMembers (project_title, teamMember) values('3D Printed Human Heart with Real Tissue', 'Black Widow');
insert into teamMembers (project_title, teamMember) values('3D Printed Human Heart with Real Tissue', 'Iron Man');
insert into teamMembers (project_title, teamMember) values('Robotic Cat for Comfort at International Airports', 'Spongebob');
insert into teamMembers (project_title, teamMember) values('Robotic Cat for Comfort at International Airports', 'Patrick Star');
insert into teamMembers (project_title, teamMember) values('Robotic Cat for Comfort at International Airports', 'Sandy');
insert into teamMembers (project_title, teamMember) values('Robotic Cat for Comfort at International Airports', 'Squidward');
insert into teamMembers (project_title, teamMember) values('Instant Scrumptious Bubble Tea Maker', 'Jay Chou');
insert into teamMembers (project_title, teamMember) values('Instant Scrumptious Bubble Tea Maker', 'JJ Lin');
insert into teamMembers (project_title, teamMember) values('Instant Scrumptious Bubble Tea Maker', 'Hebe Tien');
insert into teamMembers (project_title, teamMember) values('Instant Scrumptious Bubble Tea Maker', 'Lehom Wang');
insert into teamMembers (project_title, teamMember) values('Taiwanese Bopomofo AR Visualizer', 'Bowser');
insert into teamMembers (project_title, teamMember) values('Taiwanese Bopomofo AR Visualizer', 'Princess Peach');
insert into teamMembers (project_title, teamMember) values('Taiwanese Bopomofo AR Visualizer', 'Luigi');
insert into teamMembers (project_title, teamMember) values('Taiwanese Bopomofo AR Visualizer', 'Yoshi');

insert into keywords (project_title, keyword) values('Ultrasonic Haptic Feedback Collision Detection System', 'ultrasonic detection');
insert into keywords (project_title, keyword) values('Ultrasonic Haptic Feedback Collision Detection System', 'haptic feedback');
insert into keywords (project_title, keyword) values('Ultrasonic Haptic Feedback Collision Detection System', 'collisions');
insert into keywords (project_title, keyword) values('Drone Surveillance of Deforestation', 'drone');
insert into keywords (project_title, keyword) values('Drone Surveillance of Deforestation', 'surveillance');
insert into keywords (project_title, keyword) values('Drone Surveillance of Deforestation', 'deforestation');
insert into keywords (project_title, keyword) values('Drone Surveillance of Deforestation', 'autonomous vehicles');
insert into keywords (project_title, keyword) values('3D Printed Human Heart with Real Tissue', '3D printing');
insert into keywords (project_title, keyword) values('3D Printed Human Heart with Real Tissue', 'heart');
insert into keywords (project_title, keyword) values('3D Printed Human Heart with Real Tissue', 'tissue');
insert into keywords (project_title, keyword) values('Robotic Cat for Comfort at International Airports', 'robotic cat');
insert into keywords (project_title, keyword) values('Robotic Cat for Comfort at International Airports', 'airports');
insert into keywords (project_title, keyword) values('Robotic Cat for Comfort at International Airports', 'comfort animals');
insert into keywords (project_title, keyword) values('Instant Scrumptious Bubble Tea Maker', 'bubble tea');
insert into keywords (project_title, keyword) values('Instant Scrumptious Bubble Tea Maker', 'boba');
insert into keywords (project_title, keyword) values('Instant Scrumptious Bubble Tea Maker', 'automatic');
insert into keywords (project_title, keyword) values('Instant Scrumptious Bubble Tea Maker', 'heavenly beverage');
insert into keywords (project_title, keyword) values('Taiwanese Bopomofo AR Visualizer', 'bopomofo');
insert into keywords (project_title, keyword) values('Taiwanese Bopomofo AR Visualizer', 'augmented reality');
insert into keywords (project_title, keyword) values('Taiwanese Bopomofo AR Visualizer', 'AR');
insert into keywords (project_title, keyword) values('Taiwanese Bopomofo AR Visualizer', 'neural networks');

insert into skillsNeeded (project_title, skill) values('Ultrasonic Haptic Feedback Collision Detection System', 'MSP430 programming (in C)');
insert into skillsNeeded (project_title, skill) values('Ultrasonic Haptic Feedback Collision Detection System', 'National Instruments Multisim');
insert into skillsNeeded (project_title, skill) values('Ultrasonic Haptic Feedback Collision Detection System', 'soldering');
insert into skillsNeeded (project_title, skill) values('Drone Surveillance of Deforestation', 'C++ programming');
insert into skillsNeeded (project_title, skill) values('Drone Surveillance of Deforestation', 'How to fly drones');
insert into skillsNeeded (project_title, skill) values('Drone Surveillance of Deforestation', 'soldering');
insert into skillsNeeded (project_title, skill) values('3D Printed Human Heart with Real Tissue', '3D printing');
insert into skillsNeeded (project_title, skill) values('3D Printed Human Heart with Real Tissue', 'Tissue engineering');
insert into skillsNeeded (project_title, skill) values('3D Printed Human Heart with Real Tissue', 'soldering');
insert into skillsNeeded (project_title, skill) values('Robotic Cat for Comfort at International Airports', '3D printing');
insert into skillsNeeded (project_title, skill) values('Robotic Cat for Comfort at International Airports', 'Knowledge of feline biology');
insert into skillsNeeded (project_title, skill) values('Robotic Cat for Comfort at International Airports', 'soldering');
insert into skillsNeeded (project_title, skill) values('Instant Scrumptious Bubble Tea Maker', 'MSP430 programming (in C)');
insert into skillsNeeded (project_title, skill) values('Instant Scrumptious Bubble Tea Maker', 'National Instruments Multisim');
insert into skillsNeeded (project_title, skill) values('Instant Scrumptious Bubble Tea Maker', 'soldering');
insert into skillsNeeded (project_title, skill) values('Taiwanese Bopomofo AR Visualizer', 'MSP430 programming (in C)');
insert into skillsNeeded (project_title, skill) values('Taiwanese Bopomofo AR Visualizer', 'National Instruments Multisim');
insert into skillsNeeded (project_title, skill) values('Taiwanese Bopomofo AR Visualizer', 'soldering');
