-- Part 1.3 dataPreprocessing.sql
--
-- Submitted by: Nghi Bao Le
--


-- Write your Data Preprocessing statements here

-- Date formatting
UPDATE crimes2014
SET date_reported = STR_TO_DATE(date_reported, '%Y-%M-%d'),
date_occ = STR_TO_DATE(date_occ,'%Y-%M-%d');

UPDATE crimes2013
SET date_reported = STR_TO_DATE(date_reported, '%D %M, %Y'),
date_occ = STR_TO_DATE(date_occ, '%D %M, %Y');

UPDATE crimes2015
SET date_reported = STR_TO_DATE(date_reported, '%m/%d/%Y'),
date_occ = STR_TO_DATE(date_occ, '%m/%d/%Y');

-- Time formatting

UPDATE crimes2013 SET time_occ = LPAD(time_occ, 4, 0),
time_occ = STR_TO_DATE(time_occ, '%H%i');

UPDATE crimes2014 SET time_occ = LPAD(time_occ, 4, 0),
time_occ = STR_TO_DATE(time_occ, '%H%i');

UPDATE crimes2015 SET time_occ = STR_TO_DATE(time_occ,'%k:%i:%s.%f'),
time_occ = TIME_FORMAT(time_occ,'%T');

--Set all invalid image_no valus to NULL
--NULL means no image exist in this case

UPDATE crimes2013
SET image_no = NULL
WHERE image_no < 0;

UPDATE crimes2014
SET image_no = NULL
WHERE image_no < 1;

--Status code formatting

UPDATE crimes2013 SET status = UPPER(status);


--Check for duplicates

SELECT * FROM crimes2013 GROUP BY dr_no HAVING COUNT(*) > 1;
SELECT * FROM crimes2014 GROUP BY dr_no HAVING COUNT(*) > 1;
SELECT * FROM crimes2015 GROUP BY dr_no HAVING COUNT(*) > 1;

-- Remove duplicates: only crimes2014 has duplicates

ALTER IGNORE TABLE crimes2014
ADD UNIQUE(dr_no);
