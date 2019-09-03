-- view.sql
--
-- Submitted by: Nghi Bao Le
--


-- add your CREATE VIEW statement here

CREATE VIEW futureEvents AS SELECT * FROM event WHERE date > CURDATE()
WITH CHECK OPTION;

SELECT * FROM futureEvents;

-- add your statement(s) to test rejection

UPDATE futureEvents SET date = '2018-06-06' WHERE date = '2019-01-25';
