-- Part 2.1 constraints.sql
--
-- Submitted by: Nghi Bao Le
--


--  Write your CREATE TRIGGERS statements here

DELIMITER //  --type this into terminal first to get // to be the delimiter

-- then type these lines in
CREATE TRIGGER checkCrime
  BEFORE INSERT ON crimes2015
  FOR EACH ROW
BEGIN
  IF STR_TO_DATE(NEW.date_reported, '%m/%d/%Y') < STR_TO_DATE(NEW.date_occ, '%m/%d/%Y') THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Crimes cannot be reported before they occur';
  END IF;
END;//

DELIMITER ; -- finally type this in last to get the ; delimiter back

--  Write your testing statements here

INSERT INTO crimes2015 (dr_no, date_reported, date_occ, time_occ, area, area_name,
rd, crime_no, crime_desc, status, status_desc, image_no)
VALUES
(111, '01/10/2010', '10/01/2013','20:00:00', '1','Central', '101', '354',
'THEFT OF IDENTITY','IC', 'Invest Cont', NULL);

-- Error thrown: 'Crimes cannot be reported before they occur'
