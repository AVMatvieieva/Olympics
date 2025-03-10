
DROP DATABASE IF EXISTS olympics_data;

CREATE DATABASE olympics_data;

USE olympics_data;

DROP TABLE IF EXISTS athletes;

CREATE TABLE athletes (
    ID_athlet INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Sex VARCHAR(255),
    Height FLOAT NULL,
    Weight FLOAT NULL
);

Describe athletes;
#-------------------------------------------------------------
DROP TABLE IF EXISTS events;
CREATE TABLE events (
	ID_event INT PRIMARY KEY NOT NULL,
    Sport VARCHAR(255),
    Event VARCHAR(255)
    );
    
describe events;    
#-------------------------------------------------------------    
DROP TABLE IF EXISTS countries;

CREATE TABLE countries (
    NOC VARCHAR(255) PRIMARY KEY NOT NULL,
    country VARCHAR(255)
    );
    
DESCRIBE countries;
#-------------------------------------------------------------
DROP TABLE IF EXISTS athletes_events;

CREATE TABLE athletes_events (
    ID_athlet INT NOT NULL,
    ID_event INT NOT NULL,
    Year INT NOT NULL,
    Medal varchar(255) DEFAULT NULL,
    Age INT Null,
    NOC VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID_athlet, ID_event, Year, NOC),
    FOREIGN KEY (ID_athlet) REFERENCES athletes(ID_athlet),
    FOREIGN KEY (ID_event) REFERENCES events(ID_event),
    FOREIGN KEY (NOC) REFERENCES countries(NOC)
    );

describe athletes_events;

SELECT TABLE_NAME, TABLE_ROWS 
FROM `information_schema`.`tables` 
WHERE `table_schema` = 'olympics_data';
    
    