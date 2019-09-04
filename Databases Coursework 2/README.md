# Submission for Coursework 2 in Databases, Data Warehousing, Information Retrieval module at King's College London.

The requirements for this coursework is detailed below:


The purpose of this coursework is to create a normalised database given a dataset. The coursework is
formally assessed and is worth 10% of your final grade and is broken down to 100 points distributed
as explained below. You will receive some feedback as part of the marking of the coursework.

### Part 1: Data Loading, Transformation & Normalization

(1.1) Backup Restoring (5 points)

(1.2) Data Loading (10 points)

(1.3) Data Preprocessing (20 points)

(1.4) Data Integration (10 points)

(1.5) Database Normalization (15 points)


### Part 2: Database Management
(2.1) Constraint Implementation (20 points)

(2.2) Query Optimization (20 points)

Overall presentation including legibility and proper use of language (where applicable).

## Requirements

Working with raw crime data from a police department involves analyzing a sequence of records
about crimes. There are two different tables in this dataset. A table with crime data and a table
with images of crime locations. The data is shipped in three different files: (i) crimes2015.sql
containing information about crimes reported in 2015 and the images of the locations of all crimes,
(ii) crimes2013.txt containing information about crimes reported in 2013, and (iii) crimes2014.csv
containing information about crimes reported in 2014.

Each record in the crime table represents a crime, with the following information:

• date_reported: date when the crime was reported to the police

• date_occ: date when the crime occurred

• time_occ: time when the crime occurred

• occurred: the timestamp when the crime occurred. This column replaces the date occ and
time occ in the crimes2015.sql file.

• dr_no: crime id

• area: code of the area where the crime occurred

• area_name: name of the area where the crime occurred

• rd: road number

• crime_no: code of the type of crime

• crime_desc: description of the type of crime

• status: code of the crime status

• status_desc: description of the crime status

Each record in the image table contains the image of a crime location:

• image_no: image id

• image: image stored a the BLOB value (it is a binary large object that can hold a variable
amount of data)

In a big city, there is a large number of crimes, so being able to read and analyse the data efficiently
is very important. For this assignment you will import raw crime data into a MySQL database.
As is typical of big data, there are many inconsistencies and anomalies in the dataset, so you may
need to pre-process and clean the data before it is usable.

## General submission instructions

You need to submit a .zip file that has two folders, one for Part1 and another for Part2. Each
folder will contain the completed template files that you will find in the relevant .zip file on KEATs.
Please see details for these files in the submission guidelines for each part below.

### Part 1: Data Loading, Transformation & Normalisation

#### Setup.

In Part 1, you will use SQL commands to load, transform and normalise the crime data. On
KEATs you will find a .zip file which contains template SQL files to edit for your Part 1 submission.
Be sure to:

1. Include your NAME at the top of the file in a SQL line comment.

2. Edit these files as text, not Word files or propriety SQL software.

3. Do NOT rename the files.

4. Include any comments using the SQL line comment (i.e. lines beginning with −− ).

#### Submission and Evaluation. 

Include your edited versions of these files in the .zip of your
submission, folder Part1. We will evaluate these SQL files using NMS’s server. As a student, you
can utilize NMS’s server or your own database server installed on your personal computer to test
your files and commands. In the latter case, please test your solution on NMSs server as well, to
make sure it is fully compatible, as the evaluation of your work will be based on NMSs server.

You can assume that these files are executed in the order that they appear in the description that
follows:

1. backupRestoring.sql
2. dataLoading.sql
3. dataPreprocesing.sql
4. dataIntegration.sql
5. normalization.sql

Any file that is missing, renamed, or does not run will result in 0 points for that section.

#### Part 1.1: Backup Restoring. 

Write the required SQL statement/s to restore the data contained
in the file crimes2015.sql in the provided template file: backupRestoring.sql

#### Part 1.2: Data Loading. 

Write the SQL statements to perform the following operations:

• 1.2.1. Table Creation. Write the required SQL DDL (Data Definition Language) statements
(i.e. CREATE TABLE) to create two tables (named crimes2013 and crimes2014 )
that can held the data contained in the datasets crimes2013.txt and crimes2014.csv. Ensure
that:
– table and attribute names do not conflict with SQL reserved words
– attribute data types are core SQL data types as described in the lectures

• 1.2.2. Data Load. Write the required SQL statements to load the data contained in the
datasets crimes2013.txt and crimes2014.csv into the tables crimes2013 and crimes2014.

Write all of these SQL statements in the above order in the provided template file: dataLoading.sql

#### Part 1.3: Data Preprocessing. 

Write the required SQL statements to remove any duplicates,
inconsistencies and anomalies in the data (that is in the tables crimes2013, crimes2014 and
crimes2015 ). Among others, the following inconsistencies and anomalies need to be solved:

• The column time occ in some of the tables may not be formatted properly (e.g., the
value ’1’ should be interpreted as ’00:01’).

• The column image no in some of the tables may contain invalid values (note that the
column image no in the image table only contains positive integers).

• The capitalization of the status codes (status) is not consistent in the three tables.
• Different formats may be used for the dates.

Write all of the SQL statements required to preprocess the data in the provided template file:
dataPreprocesing.sql

#### Part 1.4: Data Integration. 

Write the required SQL statements to integrate the data in the
tables crimes2015, crimes2014 andcrimes2013 in a single table named crimes. Write these
SQL statements in the provided template file: dataIntegration.sql

#### Part 1.5: Database Normalization. 

Write the required SQL statements to normalize the crimes
table into a set of tables in 3NF. Ensure that:

• every table has a primary key

• all foreign keys are properly declared

Write these SQL statements in the provided template file: normalization.sql

### Part 2: Database Management

#### Setup. 
In Part 2, you will use SQL commands to carry out maintenance operations in the tables
contained in the crime2015.sql backup. On KEATs you will find a .zip file which contains template
SQL files to edit for your Part 2 submission. Please make sure that you:

1. Include your NAME at the top of the file in a SQL line comment.

2. Edit these files as text, not Word files or propriety SQL software.

3. Do NOT rename the files.

4. Include any comments using the SQL line comment (i.e. lines beginning with −− ).

#### Submission and Evaluation.

Include your edited versions of these files in the .zip of your
submission, folder Part2. We will evaluate these SQL files using NMS’s server. As a student, you
can utilize NMS’s server or your own database server installed on your personal computer to test
your files and commands. In the latter case please also test your solution on NMS’s server as well,
to make sure it is fully compatible, as the evaluation of your work will be based on NMSs server.

You can assume that these files are executed in the order that they appear in the description that
follows:

1. backupRestoring.sql

2. constraints.sql

3. optimization.sql

Any file that is missing, renamed, or does not run will result in 0 points for that section.

#### Part 2.1:Enforcing Constraints. 

Write the SQL statements to perform the following operations:

• 2.1.1. Constraint Enforcement. Create MySQL stored program/s (e.g., trigger/s) that
implement/s the following business rule: “crimes cannot be reported before they occur”.

• 2.1.2. Testing Triggers. Write SQL statements to test that your trigger/s work/s as
desired.

Write all of these SQL statements in the above order in the provided template file: constraints.sql

#### Part 2.2: Query Optimization. 

The analyst of the crimes database would like to look up images
quickly (e.g., to check if a given image is already in the database). A column with a type
capable of storing large values (as a BLOB) might be suitable for storing images, but it is not
very suitable for finding them. Comparisons in a lookup operation are slow for large values.
Define a strategy, comprised of SQL commands and/or programs) to work around this problem.

Write all of these SQL statements in the above order in the provided template file: optimization.sql
