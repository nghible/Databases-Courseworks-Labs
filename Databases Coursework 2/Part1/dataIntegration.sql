-- Part 1.4 dataIntegration.sql
--
-- Submitted by: Nghi Bao Le
--


--  Write your Data Integration statements here

CREATE TABLE crimes
ENGINE=InnoDB DEFAULT CHARSET=utf8
SELECT * FROM crimes2013
UNION
SELECT * FROM crimes2014
UNION
SELECT * FROM crimes2015
;
