-- select.sql
--
-- Submitted by: Nghi Bao Le
--


-- add your SELECT statements here

-- Employee List.

SELECT name, surname, email FROM employee;

-- Oldest Status.

SELECT text, timestamp FROM status
WHERE timestamp = (
	SELECT min(timestamp) FROM status
);

-- Total Usage.

SELECT(
	SELECT COUNT(*)
	FROM status
	)
	AS statusCount,
	(
		SELECT COUNT(*)
		FROM comment
	)
	AS commentCount,
	(
		SELECT COUNT(*)
		FROM event
	)
	AS eventCount;

-- Event Report

SELECT type, COUNT(*) FROM event
WHERE MONTH(date) = 2
GROUP BY type;

-- Comment Report

SELECT creatorID, COUNT(*) FROM comment
GROUP BY creatorID;

-- Number 1 and 2

SELECT id,name, surname, email, TotalCommentStatus
FROM employee
INNER JOIN (
	SELECT creatorID, SUM(Count) AS TotalCommentStatus FROM
		(
			(SELECT creatorID, COUNT(*) AS Count FROM status
			GROUP BY creatorID)
		UNION
			(SELECT creatorID, COUNT(*) AS Count FROM comment
			GROUP BY creatorID)
		) AS TotalCommentStatus
	GROUP BY creatorID
	ORDER BY TotalCommentStatus DESC
	LIMIT 2
) AS TopTwoEmployee ON employee.id = TopTwoEmployee.creatorID;

-- Most Controversial Employee.

SELECT name, surname, email, ControversialStatus, totalComment AS TotalCommentOnStatus
FROM employee
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
ON employee.id = statusCreatorID.creatorID
;
