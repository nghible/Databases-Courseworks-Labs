-- Part 1.5 databaseNormalization.sql
--
-- Submitted by: Nghi Bao Le
--


--  Write your Database Normalization statements here

-- Create separate status table
CREATE TABLE status_info(
  status VARCHAR(10) UNIQUE,
  PRIMARY KEY (status)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8
SELECT DISTINCT status, status_desc FROM crimes;

-- In the crimes table there are many singular crime_no that has
-- similar meaning but slightly different wording crime_desc,
-- so I have to use a different approach.

CREATE TABLE crime_info
ENGINE=InnoDB DEFAULT CHARSET=utf8
SELECT crime_no, crime_desc FROM crimes;

ALTER IGNORE TABLE crime_info
ADD UNIQUE(crime_no),
ADD PRIMARY KEY (crime_no);

-- Create separate area table
CREATE TABLE area_info (
  area INT(11) UNIQUE,
  PRIMARY KEY (area)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8
SELECT DISTINCT area, area_name FROM crimes;

-- Delete redundant collumns in main tables

ALTER TABLE status_info
ADD UNIQUE(status);


ALTER TABLE crimes
DROP area_name,
DROP crime_desc,
DROP status_desc;

ALTER TABLE crimes2013
DROP area_name,
DROP crime_desc,
DROP status_desc;

ALTER TABLE crimes2014
DROP area_name,
DROP crime_desc,
DROP status_desc;

ALTER TABLE crimes2015
DROP area_name,
DROP crime_desc,
DROP status_desc;

-- Change status to VARCHAR(10) data type.

ALTER TABLE crimes
MODIFY status VARCHAR(10);

ALTER TABLE crimes2013
MODIFY status VARCHAR(10);

ALTER TABLE crimes2014
MODIFY status VARCHAR(10);

ALTER TABLE crimes2015
MODIFY status VARCHAR(10);

-- Add primary and foreign keys

ALTER TABLE crimes
ADD PRIMARY KEY (dr_no),
ADD FOREIGN KEY (area) REFERENCES area_info(area),
ADD FOREIGN KEY (status) REFERENCES status_info(status),
ADD FOREIGN KEY (crime_no) REFERENCES crime_info(crime_no),
ADD FOREIGN KEY (image_no) REFERENCES image(image_no);

ALTER TABLE crimes2013
ADD PRIMARY KEY (dr_no),
ADD FOREIGN KEY (area) REFERENCES area_info(area),
ADD FOREIGN KEY (status) REFERENCES status_info(status),
ADD FOREIGN KEY (crime_no) REFERENCES crime_info(crime_no),
ADD FOREIGN KEY (image_no) REFERENCES image(image_no);


ALTER TABLE crimes2014
ADD PRIMARY KEY (dr_no),
ADD FOREIGN KEY (area) REFERENCES area_info(area),
ADD FOREIGN KEY (status) REFERENCES status_info(status),
ADD FOREIGN KEY (crime_no) REFERENCES crime_info(crime_no),
ADD FOREIGN KEY (image_no) REFERENCES image(image_no);

ALTER TABLE crimes2015
ADD PRIMARY KEY (dr_no),
ADD FOREIGN KEY (area) REFERENCES area_info(area),
ADD FOREIGN KEY (crime_no) REFERENCES crime_info(crime_no),
ADD FOREIGN KEY (image_no) REFERENCES image(image_no),
ADD FOREIGN KEY (status) REFERENCES status_info(status);


-- Modify dates and time data types

ALTER TABLE crimes
MODIFY date_reported DATE,
MODIFY date_occ DATE,
MODIFY time_occ TIME;

ALTER TABLE crimes2013
MODIFY date_reported DATE,
MODIFY date_occ DATE,
MODIFY time_occ TIME;

ALTER TABLE crimes2014
MODIFY date_reported DATE,
MODIFY date_occ DATE,
MODIFY time_occ TIME;

ALTER TABLE crimes2015
MODIFY date_reported DATE,
MODIFY date_occ DATE,
MODIFY time_occ TIME;
