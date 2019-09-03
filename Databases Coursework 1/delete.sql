-- delete.sql
--
-- Submitted by: Nghi Bao Le
--
--


-- add your DELETE statements here

-- Since the most Controversial Employee is founded using the previous SLECT Query:

DELETE FROM employee WHERE email = 'tessathompson@gmail.com';

-- Since the ON DELETE option of all Foreign keys are CASCADE:
-- When I deleted the employee, all of her data are completely gone from the database

DELETE FROM employee WHERE email = (
  SELECT email
  FROM (SELECT * FROM employee) AS ControversialEmployee -- Bug fix
  INNER JOIN
  (
  	SELECT creatorID, statusID AS ControversialStatus, totalComment FROM status
  	INNER JOIN
  		(
  			SELECT statusID, MAX(totalComment) AS totalComment FROM
  			(
  				SELECT statusID, COUNT(*) AS totalComment FROM comment
  				GROUP BY statusID
  			) AS commentsCount1
  		) AS commentsCount2
  	ON status.id = commentsCount2.statusID
  ) AS statusCreatorID
  ON ControversialEmployee.id = statusCreatorID.creatorID
);
