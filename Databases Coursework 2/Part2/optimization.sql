-- Part 2.2 optimization.sql
--
-- Submitted by: Nghi Bao Le
--


--  Write your SQL statements here

-- Strategy for optimization:
-- Using hash indexes for the image table to search for a specific image in case
-- of the analyst having access to only BLOB data information, not image_no information.

ALTER TABLE image
ADD COLUMN hash CHAR(32) NULL;

UPDATE image
SET hash = MD5(image);

-- Check for duplication of hash

SELECT hash, COUNT(*) FROM image GROUP BY hash HAVING COUNT(*) > 1;

-- Sometimes for two different images, the hash is duplicated. Hence, the search
-- strategy for the data analyst should be:

-- 1. First, compare the MD5(BLOB) of the image he is searching for to the hash
-- column in the image table.
-- 2. Then if he finds multiple images with the same hash, he has to filter again by
-- comparing the BLOB data of the image to see if it match any of the images he found.

-- Using these 2 steps, the image search will be fast due to the fact comparing
-- 32 characters strings are faster than comparing enormous BLOB data.
