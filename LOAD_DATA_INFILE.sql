#Laden von Daten für die Athletes aus der athletes.csv 

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/athletes.csv'
INTO TABLE athletes
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(ID_athlet, Name, Sex, @Height, @Weight)
SET 
    Height = NULLIF(@Height, ''),#lies Lücken richtig
    Weight = NULLIF(@Weight, '');
    
SELECT * FROM athletes;

#-------------------------------------------------------------
#Laden von Daten für die 'events' Tabelle aus der events.csv 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/events.csv'
INTO TABLE events
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(ID_event, Sport, Event);

SELECT * FROM events;
#-------------------------------------------------------------------------
#Laden von Daten für die 'contries' Tabelle aus der countries.csv 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/countries.csv'
INTO TABLE countries
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(NOC, country);

SELECT * FROM countries;
#-------------------------------------------------------------------------
#Laden von Daten für die 'athletes_events' Tabelle aus der countries.csv 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/athletes_events.csv'
REPLACE
INTO TABLE athletes_events
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ID_athlet, ID_event, Year, Medal, Age, NOC);

SELECT  * FROm athletes_events;


