-- Part 1.2 dataLoading.sql
--
-- Submitted by: Nghi Bao Le
--


-- Part 1.2.1 Table Creation

CREATE TABLE crimes2013 (
  dr_no INT(11) DEFAULT NULL,
  date_reported TEXT,
  date_occ TEXT,
  time_occ VARCHAR(20) DEFAULT NULL,
  area INT(11) DEFAULT NULL,
  area_name TEXT,
  rd INT(11) DEFAULT NULL,
  crime_no INT(11) DEFAULT NULL,
  crime_desc TEXT,
  status TEXT,
  status_desc TEXT,
  image_no INT(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE crimes2014 (
  dr_no INT(11) DEFAULT NULL,
  date_reported TEXT,
  date_occ TEXT,
  time_occ VARCHAR(20) DEFAULT NULL,
  area INT(11) DEFAULT NULL,
  area_name TEXT,
  rd INT(11) DEFAULT NULL,
  crime_no INT(11) DEFAULT NULL,
  crime_desc TEXT,
  status TEXT,
  status_desc TEXT,
  image_no INT(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Part 1.2.2 Data Load

LOAD DATA LOCAL INFILE 'crimes2013.txt' INTO TABLE crimes2013
FIELDS ENCLOSED BY "'"
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'crimes2014.csv' INTO TABLE crimes2014
FIELDS TERMINATED BY ';' ENCLOSED BY "'"
IGNORE 1 LINES
(date_reported, dr_no, date_occ, time_occ, area, area_name, rd, crime_no, crime_desc, status, status_desc, image_no);

-- The part in parentheses above is controlling which column from the file goes into what column in the table.
-- The index of the vector is the position of the column in the file.
-- The variable value is the name of the column of the table.
-- E.g. The 1st column of the file goes into column name 'date_reported' of the table.

SELECT * FROM crimes2013 LIMIT 10;
SELECT * FROM crimes2014 LIMIT 10;
