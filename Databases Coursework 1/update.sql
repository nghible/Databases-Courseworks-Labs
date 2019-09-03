-- update.sql
--
-- Submitted by: Nghi Bao Le
--


-- add your UPDATE statements here

-- Update Events

UPDATE event SET type = 'Social'
WHERE HOUR(time) > 17;

-- Update Comments

UPDATE comment,
(
  SELECT status.id AS StatusIDinStatusTable, status.timestamp AS StatusTimeStamp, comment.id AS CommentID
  FROM status LEFT JOIN comment
  ON status.id = comment.statusID
  WHERE comment.timestamp < status.timestamp
) AS FixTable
SET comment.timestamp = DATE_ADD(FixTable.StatusTimeStamp, INTERVAL 1 SECOND)
WHERE comment.id = FixTable.CommentID
;
