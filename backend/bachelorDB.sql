-- create bachelor table ** (1)
create table if not exists bachelor(
    bachelorID varchar(10) not null primary key, -- primary key bc there are two Brad Womacks (season number!)
    bachelor_name varchar(40) not null,
    rose_ranking numeric(10,2) not null,
    constraint checkRoseRankingUpper check (rose_ranking <= 1),
    constraint checkRoseRankingLower check (rose_ranking >= 0),
    num_voters int not null
);

-- create contestant table ** (2)
create table if not exists contestant(
    contestantID varchar(10) not null primary key, 
        -- created contestant ID to make things less confusing (eg Hannah B and Peter being on the show many times)
    contestant_name varchar(40) not null,
    age int not null,
    constraint checkAge check (age >= 18),
    hometown_city varchar(40) not null,
    hometown_state varchar(40) not null,
    rose_ranking numeric(10,2) not null,
    constraint checkRoseRankingUpper check (rose_ranking <= 1),
    constraint checkRoseRankingLower check (rose_ranking >= 0),
    sent_home varchar(3) not null, -- 0 if not sent home, 1 if sent home
    num_voters int not null
);

-- create contestant_profession table ** (3)
create table if not exists contestant_profession ( 
    contestantID varchar(10) not null primary key,
    profession varchar(40) not null
);

-- create contestant_school_degrees table ** (4)
create table if not exists contestant_school_degrees(
    contestantID varchar(10) not null primary key, 
    school_degrees varchar(40) not null
);

-- create dates table ** (5)
create table if not exists dates(
    dateID varchar(10) not null primary key,
    bachelorID varchar(10) not null,
    country varchar(40) not null,
    state varchar(40) not null,
    city varchar(40) not null,
    activity varchar(200) not null,
    groupDate varchar(1) not null,
    rose varchar(40) not null
);

-- create applicants table ** (6)
create table if not exists applicants(
    applicantID int not null auto_increment primary key,
    name varchar(40) not null,
    hash_pwd varchar(80) not null,
    age int not null,
    constraint checkAge check (age >= 18),
    hometown_city varchar(40) not null,
    hometown_state varchar(40) not null,
    profession varchar(40) not null,
    reason varchar(600) not null,
    check ((not isnull(profession)) and (not isnull(reason)))
);

-- create courted table ** (7)
create table if not exists courted(
    contestantID varchar(10) not null primary key, -- applied contestant_ID here
    bachelorID varchar(10) not null
);

-- create attends table ** (8)
create table if not exists attends(
    contestantID varchar(10) not null, -- applied contestant_ID here too
    dateID varchar(10) not null primary key
);

-- create applies_to_date table ** (9)
create table if not exists applies_to_date(
    applicantID varchar(10) not null primary key,
    bachelorID varchar(10) not null
);

-- create viewers table ** (10)
create table if not exists viewers(
    bachelorID varchar(10) not null primary key,
    number_of_viewers double not null -- in millions
);

insert into contestant values('A24-1', 'Hannah Ann Sluss', 23, 'Powell', 'Tennessee', 0.5, 'No', 1);
insert into contestant values('A24-2', 'Madison Prewett', 23, 'Auburn', 'Alabama', 0.5, 'No', 1);
insert into contestant values('A24-3', 'Victoria Fuller', 26, 'Virginia Beach', 'Virginia', 0.5, 'Yes', 1);
insert into contestant values('A24-4', 'Kelsey Weier', 28, 'Urbandale', 'Iowa', 0.5, 'Yes', 1);
insert into contestant values('A24-5', 'Kelley Flanagan', 27, 'North Barrington', 'Illinois', 0.5, 'Yes', 1);
insert into contestant values('A24-6', 'Natasha Parker', 31, 'New York City', 'New York', 0.5, 'Yes', 1);
insert into contestant values('A24-7', 'Mykenna Dorn', 22, 'Langley', 'British Columbia', 0.5, 'Yes', 1);
insert into contestant values('A24-8', 'Sydney Hightower', 24, 'Northport', 'Alabama', 0.5, 'Yes', 1);
insert into contestant values('A24-9', 'Tammy Ly', 24, 'Syracuse', 'New York', 0.5, 'Yes', 1);
insert into contestant values('A24-10', 'Victoria Paul', 27, 'Alexandria', 'Louisiana', 0.5, 'Yes', 1);
insert into contestant values('A24-11', 'Lexi Buchanan', 26, 'Jacksonville', 'Florida', 0.5, 'Yes', 1);
insert into contestant values('A24-12', 'Shiann Lewis', 27, 'Las Vegas', 'Nevada', 0.5, 'Yes', 1);
insert into contestant values('A24-13', 'Deandra Kanu', 23, 'Bar Harbor', 'Maine', 0.5, 'Yes', 1);
insert into contestant values('A24-14', 'Kiarra Norman', 23, 'Kennesaw', 'Georgia', 0.5, 'Yes', 1);
insert into contestant values('A24-15', 'Savannah Mullins', 27, 'Houston', 'Texas', 0.5, 'Yes', 1);
insert into contestant values('A24-16', 'Alayah Benavidez', 24, 'Helotes', 'Texas', 0.5, 'Yes', 1);
insert into contestant values('A24-17', 'Alexa Caves', 27, 'Springfield', 'Illinois', 0.5, 'Yes', 1);
insert into contestant values('A24-18', 'Jasmine Nguyen', 25, 'Houston', 'Texas', 0.5, 'Yes', 1);
insert into contestant values('A24-19', 'Sarah Coffin', 24, 'Knoxville', 'Tennessee', 0.5, 'Yes', 1);
insert into contestant values('A24-20', 'Courtney Perry', 26, 'Venice', 'Florida', 0.5, 'Yes', 1);
insert into contestant values('A24-21', 'Lauren Jones', 26, 'Glendale', 'California', 0.5, 'Yes', 1);
insert into contestant values('A24-22', 'Payton Moran', 24, 'Wellesley', 'Massachusetts', 0.5, 'Yes', 1);
insert into contestant values('A24-23', 'Avonlea Elkins', 27, 'Fort Worth', 'Texas', 0.5, 'Yes', 1);
insert into contestant values('A24-24', 'Eunice Cho', 23, 'Chicago', 'Illinois', 0.5, 'Yes', 1);
insert into contestant values('A24-25', 'Jade Gilliland', 26, 'Mesa', 'Arizona', 0.5, 'Yes', 1);
insert into contestant values('A24-26', 'Jenna Serrano', 22, 'New Lenox', 'Illinois', 0.5, 'Yes', 1);
insert into contestant values('A24-27', 'Katrina Badowski', 28, 'St. Charles', 'Illinois', 0.5, 'Yes', 1);
insert into contestant values('A24-28', 'Kylie Ramos', 26, 'Davis', 'California', 0.5, 'Yes', 1);
insert into contestant values('A24-29', 'Maurissa Gunn', 23, 'Laurel', 'Montana', 0.5, 'Yes', 1);
insert into contestant values('A24-30', 'Megan Hops', 26, 'San Bruno', 'California', 0.5, 'Yes', 1);
insert into contestant values('B15-1', 'Jed Wyatt', 25, 'Sevierville', 'Tennessee', 0.5, 'No', 1);
insert into contestant values('B15-2', 'Tyler Cameron', 26, 'Jupiter', 'Florida', 0.5, 'Yes', 1);
insert into contestant values('B15-3', 'Peter Webber', 27, 'Westlake Village', 'California', 0.5, 'Yes', 1);
insert into contestant values('B15-4', 'Luke Parker', 24,'Gainesville', 'Georgia', 0.5, 'Yes', 1);
insert into contestant values('B15-5', 'Garrett Powell', 27, 'Homewood', 'Alabama', 0.5, 'Yes', 1);
insert into contestant values('B15-6', 'Mike Johnson', 31, 'San Antonio', 'Texas', 0.5, 'Yes', 1);
insert into contestant values('B15-7', 'Connor Saeli',24, 'Birmingham', 'Alabama', 0.5, 'Yes', 1);
insert into contestant values('B15-8', 'Dustin Kendrick', 30, 'Chicago', 'Illinois', 0.5, 'Yes', 1);
insert into contestant values('B15-9', 'Dylan Barbour', 24,'San Diego', 'California', 0.5, 'Yes', 1);
insert into contestant values('B15-10', 'Devin Harris', 27, 'Sherman Oaks', 'California', 0.5, 'Yes', 1);
insert into contestant values('B15-11', 'Grant Eckel', 30, 'San Clemente', 'California', 0.5, 'Yes', 1);
insert into contestant values('B15-12', 'Kevin Fortenberry', 27, 'Manteno', 'Illinois', 0.5, 'Yes', 1);
insert into contestant values('B15-13', 'John Paul Jones', 24, 'Lanham', 'Maryland', 0.5, 'Yes', 1);
insert into contestant values('B15-14', 'Matteo Valles', 25, 'Atlanta', 'Georgia', 0.5, 'Yes', 1);
insert into contestant values('B15-15', 'Luke Stone', 29, 'Marion', 'Massachusetts', 0.5, 'Yes', 1);
insert into contestant values('B15-16', 'Cameron Alaya', 30, 'Austin', 'Texas' ,0.5, 'Yes', 1);
insert into contestant values('B15-17', 'Joey Jones', 33, 'Bethesda', 'Maryland', 0.5, 'Yes', 1);
insert into contestant values('B15-18', 'Johnathan Saunders', 27, 'Los Angeles', 'California', 0.5, 'Yes', 1);
insert into contestant values('B15-19', 'Tyler Gwozdzt', 28, 'Boca Raton', 'Florida', 0.5, 'Yes', 1);
insert into contestant values('B15-20', 'Connor Jenkins', 28, 'Newport Beach', 'California', 0.5, 'Yes', 1);
insert into contestant values('B15-21', 'Daron Blaylock', 25, 'Buckhead', 'Georgia', 0.5, 'Yes', 1);
insert into contestant values('B15-22', 'Matthew Spraggins', 23, 'Newport Beach', 'California', 0.5, 'Yes', 1);
insert into contestant values('B15-23', 'Brian Bowles', 30, 'Louisville', 'Kentucky', 0.5, 'Yes', 1);
insert into contestant values('B15-24', 'Chasen Coscia', 27, 'Ann Arbor', 'Michigan', 0.5, 'Yes', 1);
insert into contestant values('B15-25', 'Hunter Jones', 24, 'Westchester', 'California', 0.5, 'Yes', 1);
insert into contestant values('B15-26', 'Joe Barsano', 30, 'Chicago', 'Illinois', 0.5, 'Yes', 1);
insert into contestant values('B15-27', 'Matt Donald', 26, 'Los Gatos', 'California', 0.5, 'Yes', 1);
insert into contestant values('B15-28', 'Ryan Spirko', 25, 'Philadelphia', 'Pennsylvania', 0.5, 'Yes', 1);
insert into contestant values('B15-29', 'Thomas Staton', 27, 'Detroit', 'Michigan', 0.5, 'Yes', 1);
insert into contestant values('B15-30', 'Scott Andersen', 28, 'Chicago', 'Illinois', 0.5, 'Yes', 1);
insert into contestant_profession values('A24-1', 'Model');
insert into contestant_profession values('A24-2', 'Foster Parent Recruiter');
insert into contestant_profession values('A24-3', 'Medical Sales Rep');
insert into contestant_profession values('A24-4', 'Professional Clothier');
insert into contestant_profession values('A24-5', 'Attorney');
insert into contestant_profession values('A24-6', 'Event Planner');
insert into contestant_profession values('A24-7', 'Fashion Blogger');
insert into contestant_profession values('A24-8', 'Retail Marketing Manager');
insert into contestant_profession values('A24-9', 'House Flipper');
insert into contestant_profession values('A24-10', 'Nurse');
insert into contestant_profession values('A24-11', 'Marketing Coordinator');
insert into contestant_profession values('A24-12', 'Administrative Assistant');
insert into contestant_profession values('A24-13', 'Home Care Coordinator');
insert into contestant_profession values('A24-14', 'Nanny');
insert into contestant_profession values('A24-15', 'Realtor');
insert into contestant_profession values('A24-16', 'Orthodontist Assistant');
insert into contestant_profession values('A24-17', 'Esthetician');
insert into contestant_profession values('A24-18', 'Client Relations Manager');
insert into contestant_profession values('A24-19', 'Medical Radiographer');
insert into contestant_profession values('A24-20', 'Cosmetologist');
insert into contestant_profession values('A24-21', 'Marketing Executive');
insert into contestant_profession values('A24-22', 'Business Development Rep');
insert into contestant_profession values('A24-23', 'Cattle Rancher');
insert into contestant_profession values('A24-24', 'Flight Attendant');
insert into contestant_profession values('A24-25', 'Flight Attendant');
insert into contestant_profession values('A24-26', 'Nursing Student');
insert into contestant_profession values('A24-27', 'Pro NBA Dancer');
insert into contestant_profession values('A24-28', 'Entertainment Sales Associate');
insert into contestant_profession values('A24-29', 'Patient Care Coordinator');
insert into contestant_profession values('A24-30', 'Flight Attendant');
insert into contestant_profession values('B15-1', 'Singer');
insert into contestant_profession values('B15-2', 'General Contractor');
insert into contestant_profession values('B15-3', 'Pilot');
insert into contestant_profession values('B15-4', 'Import/Export Manager');
insert into contestant_profession values('B15-5', 'Golf Pro');
insert into contestant_profession values('B15-6', 'Portfolio Manager');
insert into contestant_profession values('B15-7', 'Investment Analyst');
insert into contestant_profession values('B15-8', 'Real Estate Broker');
insert into contestant_profession values('B15-9', 'Tech Entrepreneur');
insert into contestant_profession values('B15-10', 'Talent Manager');
insert into contestant_profession values('B15-11', 'Unemployed');
insert into contestant_profession values('B15-12', 'Behavioral Health Specialist');
insert into contestant_profession values('B15-13', 'Financial Analyst');
insert into contestant_profession values('B15-14', 'Management Consultant');
insert into contestant_profession values('B15-15', 'Political Consultant');
insert into contestant_profession values('B15-16', 'Software Sales');
insert into contestant_profession values('B15-17', 'Finance Manager');
insert into contestant_profession values('B15-18', 'Server');
insert into contestant_profession values('B15-19', 'Psychology Graduate Student');
insert into contestant_profession values('B15-20', 'Sales Manager');
insert into contestant_profession values('B15-21', 'IT Consultant');
insert into contestant_profession values('B15-22', 'Car Bid Spotter');
insert into contestant_profession values('B15-23', 'Math Teacher');
insert into contestant_profession values('B15-24', 'Pilot');
insert into contestant_profession values('B15-25', 'Pro Surfer');
insert into contestant_profession values('B15-26', 'The Box King');
insert into contestant_profession values('B15-27', 'Medical Device Salesman');
insert into contestant_profession values('B15-28', 'Roller Boy');
insert into contestant_profession values('B15-29', 'International Pro Basketball Player');
insert into contestant_profession values('B15-30', 'Software Sales Executive');
insert into contestant_school_degrees values('A24-1', 'Communication');
insert into contestant_school_degrees values('A24-2', 'Mass Communication and Media Studies');
insert into contestant_school_degrees values('A24-3', 'Economics');
insert into contestant_school_degrees values('A24-4', 'Cosmetology');
insert into contestant_school_degrees values('A24-5', 'Marketing and Law');
insert into contestant_school_degrees values('A24-6', 'Television Production Writing and Producing');
insert into contestant_school_degrees values('A24-7', 'N/A');
insert into contestant_school_degrees values('A24-8', 'N/A');
insert into contestant_school_degrees values('A24-9', 'Business, Management, Marketing and Related Support Services');
insert into contestant_school_degrees values('A24-10', 'Business');
insert into contestant_school_degrees values('A24-11', 'Bachelor’s Degree');
insert into contestant_school_degrees values('A24-12', 'N/A');
insert into contestant_school_degrees values('A24-13', 'Communication and Public relations');
insert into contestant_school_degrees values('A24-14', 'Public Relations');
insert into contestant_school_degrees values('A24-15', 'Bachelor’s Degree');
insert into contestant_school_degrees values('A24-16', 'English');
insert into contestant_school_degrees values('A24-17', 'N/A');
insert into contestant_school_degrees values('A24-18', 'Education');
insert into contestant_school_degrees values('A24-19', 'Radiology');
insert into contestant_school_degrees values('A24-20', 'Cosmetology');
insert into contestant_school_degrees values('A24-21', 'Marketing');
insert into contestant_school_degrees values('A24-22', 'Political Science and Government');
insert into contestant_school_degrees values('A24-23', 'Ranch Management');
insert into contestant_school_degrees values('A24-24', 'Hospitality Administration and Management');
insert into contestant_school_degrees values('A24-25', 'N/A');
insert into contestant_school_degrees values('A24-26', 'Nursing');
insert into contestant_school_degrees values('A24-27', 'Psychology');
insert into contestant_school_degrees values('A24-28', 'Public Relations');
insert into contestant_school_degrees values('A24-29', 'Bachelor’s Degree');
insert into contestant_school_degrees values('A24-30', 'N/A');
insert into contestant_school_degrees values('B15-1', 'Music');
insert into contestant_school_degrees values('B15-2', 'Communication');
insert into contestant_school_degrees values('B15-3', 'Aviation');
insert into contestant_school_degrees values('B15-4', 'Communications and Sports Management');
insert into contestant_school_degrees values('B15-5', 'Golf Management');
insert into contestant_school_degrees values('B15-6', 'Cybersecurity');
insert into contestant_school_degrees values('B15-7', 'Finance');
insert into contestant_school_degrees values('B15-8', 'Graphic Design');
insert into contestant_school_degrees values('B15-9', 'English Language and Literature');
insert into contestant_school_degrees values('B15-10', 'Political Science');
insert into contestant_school_degrees values('B15-11', 'Business Administration');
insert into contestant_school_degrees values('B15-12', 'N/A');
insert into contestant_school_degrees values('B15-13', 'Finance');
insert into contestant_school_degrees values('B15-14', 'Mechanical Engineering');
insert into contestant_school_degrees values('B15-15', 'Political Science and Art History');
insert into contestant_school_degrees values('B15-16', 'Communication and Media Studies');
insert into contestant_school_degrees values('B15-17', 'Accounting, Information Systems');
insert into contestant_school_degrees values('B15-18', 'N/A');
insert into contestant_school_degrees values('B15-19', 'Economics');
insert into contestant_school_degrees values('B15-20', 'Business Administration and International Studies');
insert into contestant_school_degrees values('B15-21', 'Communication');
insert into contestant_school_degrees values('B15-22', 'N/A');
insert into contestant_school_degrees values('B15-23', 'Mathematics');
insert into contestant_school_degrees values('B15-24', 'Aviation');
insert into contestant_school_degrees values('B15-25', 'Film Studies');
insert into contestant_school_degrees values('B15-26', 'Economics');
insert into contestant_school_degrees values('B15-27', 'English');
insert into contestant_school_degrees values('B15-28', 'Finance and Economics');
insert into contestant_school_degrees values('B15-29', 'Marine Biology');
insert into contestant_school_degrees values('B15-30', 'Astronomy');

-- INSERTING VALUES FOR dates----------------------------------
insert into dates values('D15-1', 'B15', 'United States', 'California', 'Los Angeles', 'Mr.Right Pageant and talent show', 'Y', 'Jed');
insert into dates values('D15-2', 'B15', 'United States', 'California', 'Los Angeles', 'Helicopter ride and ATV Racing', 'N', 'Tyler G');
insert into dates values('D15-3', 'B15', 'United States', 'California', 'Los Angeles', 'Roller derby', 'Y', 'Dustin');
insert into dates values('D15-4', 'B15', 'United States', 'California', 'Los Angeles', 'Childbirth simulation', 'Y', 'Mike');
insert into dates values('D15-5', 'B15', 'United States', 'California', 'Los Angeles', 'Lukas Graham concert', 'N','Connor S');
insert into dates values('D15-6', 'B15', 'United States', 'California', 'Los Angeles', 'Photoshoot with pets', 'Y', 'Peter');
insert into dates values('D15-7', 'B15', 'United States',' Massachusetts', 'Boston', 'Exploring the Quincy Market, playing basketball with the Boston Celtics', 'N','Jed');
insert into dates values('D15-8', 'B15', 'United States','Rhode Island', 'Newport', 'Rugby game in Fort Adams', 'Y','Garrett');
insert into dates values('D15-9', 'B15', 'United States','Rhode Island', 'Newport', 'Fishing, Jake Owen  concert', 'N', 'Tyler C');
insert into dates values('D15-10', 'B15', 'Scotland', 'N/A', 'Inverness', 'Exploring Scotland, getting dinner and drinks', 'N', 'Mike');
insert into dates values('D15-11', 'B15', 'Scotland', 'N/A', 'Inverness', 'Old Scottish Highland Games: axe-throwing, wrestling', 'Y','Jed');
insert into dates values('D15-12', 'B15', 'Scotland', 'N/A', 'Inverness', 'Sitting by the ocean', 'N', 'Luke P');
insert into dates values('D15-13', 'B15', 'Latvia', 'N/A','Riga', 'Naked bungee jumping', 'N', 'Garrett');
insert into dates values('D15-14', 'B15', 'Latvia', 'N/A','Riga', 'Visiting the Riga Central Market', 'Y', 'Tyler C');
insert into dates values('D15-15', 'B15', 'Latvia', 'N/A','Riga', 'Go to a spa and sauna, fireworks show', 'N', 'Peter');
insert into dates values('D15-16', 'B15', 'Netherlands', 'N/A','Amsterdam','Exploring Amsterdam, boat ride', 'N','Jed');
insert into dates values('D15-17', 'B15', 'Netherlands', 'N/A','Amsterdam','Horseback riding', 'N','Tyler C');
insert into dates values('D15-18', 'B15', 'Netherlands', 'N/A','Amsterdam','Bike riding and painting', 'N','N/A');
insert into dates values('D15-19', 'B15', 'Netherlands', 'N/A','Gouda','Fighting and drama', 'Y','Peter');
insert into dates values('D15-20', 'B15', 'United States', 'California','Westlake Village',"Peter's hometown date: flying a plane", 'N', 'N/A');
insert into dates values('D15-21', 'B15', 'United States', 'Florida', 'Jupiter' ,"Tyler C's hometown date: boat ride and beach bar", 'N', 'N/A');
insert into dates values('D15-22', 'B15', 'United States', 'Georgia', 'Gainesville' ,"Luke P's hometown date: Sunday school meeting", 'N', 'N/A');
insert into dates values('D15-23', 'B15', 'United States', 'Tennessee', 'Knoxville',"Jed's hometown date: writing a song together", 'N', 'N/A');
insert into dates values('D15-24', 'B15', 'Greece', 'N/A', 'Crete','Sailing the Aegean Sea', 'N', 'N/A');
insert into dates values('D15-25', 'B15', 'Greece', 'N/A', 'Crete' ,'Spa and massages', 'N', 'N/A');
insert into dates values('D15-26', 'B15', 'Greece', 'N/A', 'Vrachasi', 'Dancing and lunch while exploring the village', 'N', 'N/A');
insert into dates values('D15-27', 'B15', 'Greece', 'N/A','Santorini', 'Exploring the city, helicopter ride', 'N', 'N/A');
insert into dates values('D24-1', 'A24', 'United States', 'California', 'Camarillo', 'Aviation school and obstacle course', 'Y', 'Kelley');
insert into dates values('D24-2', 'A24', 'United States', 'California', 'Westlake Village', "Peter's parents' anniversary party", 'N', 'Madison');
insert into dates values('D24-3', 'A24', 'United States', 'California', 'Hollywood', 'Sharing sex stories', 'Y', 'Sydney');
insert into dates values('D24-4', 'A24', 'United States', 'California', 'Los Angeles', 'Revlon fashion show', 'Y', 'Victoria F');
insert into dates values('D24-5', 'A24', 'United States', 'California','Los Angeles', "Demi's Extreme Pillow Fight Club", 'Y', 'Sydney');
insert into dates values('D24-6', 'A24', 'United States', 'Ohio', 'Cleveland', 'Private amusement park, Chase Rice Concert', 'N', 'Victoria F');
insert into dates values('D24-7', 'A24', 'United States', 'Ohio', 'Cleveland', 'Exploring Cleveland and Cuyahoga River', 'N', 'Kelsey');
insert into dates values('D24-8', 'A24', 'Costa Rica', 'N/A', 'Arenal', 'Helicopter ride over jungle, swimming in hot springs', 'N','Sydney');
insert into dates values('D24-9', 'A24', 'Costa Rica', 'N/A', 'Arenal', 'Cosmopolitan photoshoot at the La Fortuna waterfall', 'Y','Hannah Ann');
insert into dates values('D24-10', 'A24', 'Costa Rica', 'N/A', 'Arenal', 'Shaman healing ritual', 'N','Kelley');
insert into dates values('D24-11', 'A24', 'Chile', 'N/A', 'Santiago', 'Exploring Santiago', 'N','Hannah Ann');
insert into dates values('D24-12', 'A24', 'Chile', 'N/A', 'Santiago', 'Filming a telenovela', 'Y','Madison');
insert into dates values('D24-13', 'A24', 'Chile', 'N/A', 'Santiago', 'Horseback riding', 'N','Victoria F');
insert into dates values('D24-14', 'A24', 'Peru', 'N/A', 'Lima', 'Fishing', 'N','Madison');
insert into dates values('D24-15', 'A24', 'Peru', 'N/A', 'Lima', 'Exploring Lima', 'N','N/A');
insert into dates values('D24-16', 'A24', 'Peru', 'N/A', 'Lima', 'ATV riding in the Pachacamac ruins', 'N','Kelsey');
insert into dates values('D24-17', 'A24', 'United States', 'Tennessee', 'Knoxville', "Hannah Ann's hometown date: axe throwing", 'N','N/A');
insert into dates values('D24-18', 'A24', 'United States', 'Tennessee', 'Knoxville', "Hannah Ann's hometown date: axe throwing", 'N','N/A');
insert into dates values('D24-19', 'A24', 'United States','Idaho', 'Des Moines', "Kelsey's hometown date: wine-making", 'N','N/A');
insert into dates values('D24-20', 'A24', 'United States', 'Alabama', 'Auburn', "Madison's hometown date: basketball with Auburn team", 'N','N/A');
insert into dates values('D24-21', 'A24', 'United States', 'Virginia', 'Virginia Beach', "Victoria F's hometown date: Hunter Hayes Concert", 'N','N/A');
insert into dates values('D24-22', 'A24', 'Australia','N/A', 'Gold Coast', 'Jet-skiing', 'N','N/A');
insert into dates values('D24-23', 'A24', 'Australia','N/A', 'Gold Coast', 'Helicopter ride and picnic', 'N','N/A');
insert into dates values('D24-24', 'A24', 'Australia','N/A', 'Gold Coast', 'Climb to top of Q1 building', 'N','N/A');

-- INSERTING VALUES FOR APPLICANTS FOR PETER’S SEASON  ----------------------------------
-- insert into applicants values('A001', 'Renee Lin Mitchell', 21, 'Virginia Beach', 'Virginia', 'Nobel Peace Prize recipient, teacher', 'To show off, duh');
-- insert into applicants values('A002', 'Vaishnavi Madhavan', 21, 'Chantilly', 'Virginia', 'President of the United States', 'So I can travel!');
-- insert into applicants values('A003', 'Akshitha Indoori', 20, 'Centreville', 'Virginia', 'Award-winning KDrama actress', 'I love travelling');
-- insert into applicants values('A004', 'Jennifer Cyphers', 20, 'Fairfax', 'Virginia', 'Top Software Engineer at Google', 'To outshine everyone else');
-- insert into applicants values('A006', 'Jade Gilliland', 26, 'Mesa', 'Arizona', 'Flight Attendant', "I've always wanted to marry a pilot");
-- insert into applicants values('A007', 'Jenna Serrano', 22, 'New Lenox', 'Illinois', 'Nursing Student', 'To nurse Peter into being a better guy');
-- insert into applicants values('A008', 'Katrina Badowski', 28, 'St. Charles', 'Illinois', 'Pro NBA Dancer', 'To beat Peter in dancing');
-- insert into applicants values('A009', 'Kylie Ramos', 26, 'Davis', 'California', 'Entertainment Sales Associate', 'So I can entertain Peter');
-- insert into applicants values('A010', 'Maurissa Gunn', 23, 'Laurel', 'Montana', 'Singer', 'So I can sing for Peter');
-- insert into applicants values('A011', 'Megan Hops', 26, 'San Bruno', 'California', 'Flight Attendant', 'I love pilots');
-- insert into applicants values('B001', 'Shahrukh Khan', 54, 'New Delhi', 'India', 'King of Bollywood', 'To show off my dancing and singing skills');
-- insert into applicants values('B002', 'Chris Wang', 37, 'Taipei', 'Taiwan', 'Actor', 'To sweep the bachelorette off her feet');
-- insert into applicants values('B003', 'Jim Carrey', 58, 'Ontario', 'Canada', 'Actor', 'Demonstrate my Grinch moves on reality TV!');
-- insert into applicants values('B004', 'Jed Wyatt', 25, 'Sevierville', 'Tennessee', 'Singer', 'Show how I am superior in singing');
-- insert into applicants values('B005', 'Tyler Cameron', 26, 'Jupiter', 'Florida', 'General Contractor', "Can't wait to draw up our marriage contract");
-- insert into applicants values('B006', 'Peter Weber', 27, 'Westlake Village', 'California', 'Pilot', "Can't wait to fly into the sunset with Hannah");
-- insert into applicants values('B007', 'Luke Parker', 24,'Gainesville', 'Georgia', 'Import/Export Manager', 'Gonna import all my love into this relationship');
-- insert into applicants values('B008', 'Garrett Powell', 27, 'Homewood', 'Alabama', 'Golf Pro', "Winning Hannah's heart will be easier than a round of golf");

-- INSERTING VALUES FOR courted  ----------------------------------
insert into courted values('A24-1', 'A24');
insert into courted values('A24-2', 'A24');
insert into courted values('A24-3', 'A24');
insert into courted values('A24-4', 'A24');
insert into courted values('A24-5', 'A24');
insert into courted values('A24-6', 'A24');
insert into courted values('A24-7', 'A24');
insert into courted values('A24-8', 'A24');
insert into courted values('A24-9', 'A24');
insert into courted values('A24-10', 'A24');
insert into courted values('A24-11', 'A24');
insert into courted values('A24-12', 'A24');
insert into courted values('A24-13', 'A24');
insert into courted values('A24-14', 'A24');
insert into courted values('A24-15', 'A24');
insert into courted values('A24-16', 'A24');
insert into courted values('A24-17', 'A24');
insert into courted values('A24-18', 'A24');
insert into courted values('A24-19', 'A24');
insert into courted values('A24-20', 'A24');
insert into courted values('A24-21', 'A24');
insert into courted values('A24-22', 'A24');
insert into courted values('A24-23', 'A24');
insert into courted values('A24-24', 'A24');
insert into courted values('A24-25', 'A24');
insert into courted values('A24-26', 'A24');
insert into courted values('A24-27', 'A24');
insert into courted values('A24-28', 'A24');
insert into courted values('A24-29', 'A24');
insert into courted values('A24-30', 'A24');
insert into courted values('B15-1', 'B15');
insert into courted values('B15-2', 'B15');
insert into courted values('B15-3', 'B15');
insert into courted values('B15-4', 'B15');
insert into courted values('B15-5', 'B15');
insert into courted values('B15-6', 'B15');
insert into courted values('B15-7', 'B15');
insert into courted values('B15-8', 'B15');
insert into courted values('B15-9', 'B15');
insert into courted values('B15-10', 'B15');
insert into courted values('B15-11', 'B15');
insert into courted values('B15-12', 'B15');
insert into courted values('B15-13', 'B15');
insert into courted values('B15-14', 'B15');
insert into courted values('B15-15', 'B15');
insert into courted values('B15-16', 'B15');
insert into courted values('B15-17', 'B15');
insert into courted values('B15-18', 'B15');
insert into courted values('B15-19', 'B15');
insert into courted values('B15-20', 'B15');
insert into courted values('B15-21', 'B15');
insert into courted values('B15-22', 'B15');
insert into courted values('B15-23', 'B15');
insert into courted values('B15-24', 'B15');
insert into courted values('B15-25', 'B15');
insert into courted values('B15-26', 'B15');
insert into courted values('B15-27', 'B15');
insert into courted values('B15-28', 'B15');
insert into courted values('B15-29', 'B15');
insert into courted values('B15-30', 'B15');

-- INSERTING VALUES FOR attends  ----------------------------------
insert into attends values('B15-1', 'D15-1');
insert into attends values('B15-19', 'D15-2');
insert into attends values('B15-8', 'D15-3');
insert into attends values('B15-6', 'D15-4');
insert into attends values('B15-7', 'D15-5');
insert into attends values('B15-3', 'D15-6');
insert into attends values('B15-1', 'D15-7');
insert into attends values('B15-5', 'D15-8');
insert into attends values('B15-2', 'D15-9');
insert into attends values('B15-6', 'D15-10');
insert into attends values('B15-1', 'D15-11');
insert into attends values('B15-4', 'D15-12');
insert into attends values('B15-5', 'D15-13');
insert into attends values('B15-2', 'D15-14');
insert into attends values('B15-3', 'D15-15');
insert into attends values('B15-1', 'D15-16');
insert into attends values('B15-2', 'D15-17');
insert into attends values('B15-3', 'D15-19');
insert into attends values('A24-5', 'D24-1');
insert into attends values('A24-2', 'D24-2');
insert into attends values('A24-8', 'D24-3');
insert into attends values('A24-3', 'D24-4');
insert into attends values('A24-8', 'D24-5');
insert into attends values('A24-3', 'D24-6');
insert into attends values('A24-4', 'D24-7');
insert into attends values('A24-8', 'D24-8');
insert into attends values('A24-1', 'D24-9');
insert into attends values('A24-5', 'D24-10');
insert into attends values('A24-1', 'D24-11');
insert into attends values('A24-2', 'D24-12');
insert into attends values('A24-3', 'D24-13');
insert into attends values('A24-2', 'D24-14');
insert into attends values('A24-4', 'D24-16');

-- INSERTING VALUES FOR applies_to_date  ----------------------------------
insert into applies_to_date values('A001', 'A18');
insert into applies_to_date values('A002', 'A17');
insert into applies_to_date values('A003', 'A16');
insert into applies_to_date values('A004', 'A15');
insert into applies_to_date values('A006', 'A24');
insert into applies_to_date values('A007', 'A24');
insert into applies_to_date values('A008', 'A24');
insert into applies_to_date values('A009', 'A24');
insert into applies_to_date values('A010', 'A24');
insert into applies_to_date values('A011', 'A24');
insert into applies_to_date values('B001', 'B13');
insert into applies_to_date values('B002', 'B14');
insert into applies_to_date values('B003', 'B9');
insert into applies_to_date values('B004', 'B15');
insert into applies_to_date values('B005', 'B15');
insert into applies_to_date values('B006', 'B15');
insert into applies_to_date values('B007', 'B15');
insert into applies_to_date values('B008', 'B15');

-- INSERTING VALUES FOR viewers  ----------------------------------
insert into viewers values('A1', 10.7);
insert into viewers values('A2', 13.93);
insert into viewers values('A3', 13.93);
insert into viewers values('A4', 12.53);
insert into viewers values('A5', 12.53);
insert into viewers values('A6', 8.53);
insert into viewers values('A7', 8.53);
insert into viewers values('A8', 9.3);
insert into viewers values('A9', 8.5);
insert into viewers values('A10', 10.3);
insert into viewers values('A11', 9.72);
insert into viewers values('A12', 7.9);
insert into viewers values('A13', 11.53);
insert into viewers values('A14', 12.22);
insert into viewers values('A15', 10.79);
insert into viewers values('A16', 8.85);
insert into viewers values('A17', 9.48);
insert into viewers values('A18', 9.59);
insert into viewers values('A19', 9.68);
insert into viewers values('A20', 9.53);
insert into viewers values('A21', 9);
insert into viewers values('A22', 7.92);
insert into viewers values('A23', 8.21);
insert into viewers values('A24', 8.49);
insert into viewers values('B1', 16.65);
insert into viewers values('B2', 13.53);
insert into viewers values('B3', 8.37);
insert into viewers values('B4', 9.53);
insert into viewers values('B5', 10);
insert into viewers values('B6', 11.73);
insert into viewers values('B7', 8.33);
insert into viewers values('B8', 7.5);
insert into viewers values('B9', 6.75);
insert into viewers values('B10', 6.76);
insert into viewers values('B11', 6.86);
insert into viewers values('B12', 6.83);
insert into viewers values('B13', 5.89);
insert into viewers values('B14', 6.71);
insert into viewers values('B15', 7.48);

-- the bachelors and bachelorettes
insert into bachelor values('A24', 'Peter Weber', 0.5, 1);
insert into bachelor values('B15', 'Hannah Brown', 0.5, 1);
insert into bachelor values('A23', 'Colton Underwood', 0.5, 1);
insert into bachelor values('B14', 'Becca Kufrin', 0.5, 1);
insert into bachelor values('A22', 'Arie Luyendyk Jr.', 0.5, 1);
insert into bachelor values('B13', 'Rachel Lindsay', 0.5, 1);
insert into bachelor values('A21', 'Nick Viall', 0.5, 1);
insert into bachelor values('B12', 'Jojo Fletcher', 0.5, 1);
insert into bachelor values('A20', 'Ben Higgins', 0.5, 1);
insert into bachelor values('B11', 'Kaitlyn Bristowe', 0.5, 1);
insert into bachelor values('A19', 'Chris Soules', 0.5, 1);
insert into bachelor values('B10', 'Andi Dorfman', 0.5, 1);
insert into bachelor values('A18', 'Juan Pablo Galavis', 0.5, 1);
insert into bachelor values('B9', 'Desiree Hartsock', 0.5, 1);
insert into bachelor values('A17', 'Sean Lowe', 0.5, 1);
insert into bachelor values('B8', 'Emily Maynard', 0.5, 1);
insert into bachelor values('A16', 'Ben Flajnik', 0.5, 1);
insert into bachelor values('B7', 'Ashley Hebert', 0.5, 1);
insert into bachelor values('A15', 'Brad Womack', 0.5, 1);
insert into bachelor values('B6', 'Ali Fedotowsky', 0.5, 1);
insert into bachelor values('A14', 'Jake Pavelka', 0.5, 1);
insert into bachelor values('B5', 'Jillian Harris', 0.5, 1);
insert into bachelor values('A13', 'Jason Mesnick', 0.5, 1);
insert into bachelor values('B4', 'DeAnna Pappas', 0.5, 1);
insert into bachelor values('A12', 'Matt Grant', 0.5, 1);
insert into bachelor values('B3', 'Jen Schefft', 0.5, 1);
insert into bachelor values('A11', 'Brad Womack', 0.5, 1);
insert into bachelor values('B2', 'Meredith Phillips', 0.5, 1);
insert into bachelor values('A10', 'Andrew Baldwin', 0.5, 1);
insert into bachelor values('B1', 'Trista Rehn', 0.5, 1);
insert into bachelor values('A9', 'Lorenzo Borghese', 0.5, 1);
insert into bachelor values('A8', 'Travis Lane Stork', 0.5, 1);
insert into bachelor values('A7', "Charlie O'Connell", 0.5, 1);
insert into bachelor values('A6', 'Byron Velvick', 0.5, 1);
insert into bachelor values('A5', 'Jesse Palmer', 0.5, 1);
insert into bachelor values('A4', 'Bob Guiney', 0.5, 1);
insert into bachelor values('A3', 'Andrew Firestone', 0.5, 1);
insert into bachelor values('A2', 'Aaron Buerge', 0.5, 1);
insert into bachelor values('A1', 'Alex Michel', 0.5, 1);

-- procedures
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBachelors`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER select * from bachelor;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getViewers`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER select * from viewers;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAttends`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER 
SELECT contestant.contestant_name, dates.activity FROM ((attends inner join dates on attends.dateID = dates.dateID) 
    inner join contestant on attends.contestantID = contestant.contestantID);
CREATE DEFINER=`root`@`localhost` PROCEDURE `getContestants`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER select * from contestant;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCourted`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER 
SELECT contestant.contestant_name, bachelor.bachelor_name FROM ((courted inner join bachelor on courted.bachelorID = bachelor.bachelorID) 
    inner join contestant on courted.contestantID = contestant.contestantID);
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDates`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER select * from dates;
