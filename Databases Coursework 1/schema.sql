-- schema.sql
--
-- Submitted by: Nghi Bao Le
--


-- add your CREATE TABLE statements here

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    sex VARCHAR(10) NOT NULL,
    dateOfBirth DATE,
    email VARCHAR(255)
);

CREATE TABLE comment (
    id INT PRIMARY KEY,
    creatorID INT NOT NULL,
    statusID INT NOT NULL,
    text VARCHAR(255) NOT NULL,
    timestamp DATETIME NOT NULL
);

CREATE TABLE status (
    id INT PRIMARY KEY,
    creatorID INT NOT NULL,
    text VARCHAR(255) NOT NULL,
    timestamp DATETIME NOT NULL
);

CREATE TABLE event (
    id INT PRIMARY KEY AUTO_INCREMENT,
    creatorID INT NOT NULL,
    type VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    location VARCHAR(255)
);

CREATE TABLE likeComment (
    employeeID INT,
    commentID INT ,
    PRIMARY KEY (employeeID, commentID),
    FOREIGN KEY (employeeID)
        REFERENCES employee (id)
        ON DELETE CASCADE,
    FOREIGN KEY (commentID)
        REFERENCES comment (id)
        ON DELETE CASCADE
);

CREATE TABLE likeStatus (
    employeeID INT,
    statusID INT,
    PRIMARY KEY (employeeID, statusID),
    FOREIGN KEY (employeeID)
        REFERENCES employee (id)
        ON DELETE CASCADE,
    FOREIGN KEY (statusID)
        REFERENCES status (id)
        ON DELETE CASCADE
);

ALTER TABLE comment
    ADD FOREIGN KEY (creatorID)
        REFERENCES employee (id)
        ON DELETE CASCADE;

ALTER TABLE comment
    ADD FOREIGN KEY (statusID)
        REFERENCES status (id)
        ON DELETE CASCADE;

ALTER TABLE status
    ADD FOREIGN KEY (creatorID)
        REFERENCES employee (id)
        ON DELETE CASCADE;

ALTER TABLE event
    ADD FOREIGN KEY (creatorID)
        REFERENCES employee (id)
        ON DELETE CASCADE;
