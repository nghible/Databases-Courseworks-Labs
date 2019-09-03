-- insert.sql
--
-- Submitted by: Nghi Bao Le
--


-- add your INSERT statements here

INSERT INTO employee (id, name, surname, sex, dateOfBirth, email)
VALUES ('1' ,'Tessa', 'Thompson', 'F', '1983-10-03', 'tessathompson@gmail.com'),
('2','Gal','Gadot', 'F', '1985-04-30','galgadot@gmail.com'),
('3','Christian', 'Bale', 'M', '1974-01-30','christianbale@gmail.com');

INSERT INTO status (id, creatorID, text, timestamp)
VALUES ('1', '1', 'I love STEAKS!', '2018-11-07 13:03:43'),
('2', '1', 'I love IPAs!', '2018-11-06 23:06:12'),
('3', '1', 'I love COCKTAILS!', '2018-10-06 08:05:23'),
('4', '2', 'I love RAMEN!', '2018-09-02 15:03:54'),
('5', '2', 'I love SUSHI!', '2018-04-28 19:44:25'),
('6', '2', 'I love KBBQ!', '2018-10-06 21:06:33'),
('7', '3', 'I love THAI FOOD!', '2018-03-03 03:03:03'),
('8', '3', 'I love PHO!', '2018-04-04 04:04:04'),
('9', '3', 'I love TECHNO!', '2018-11-11 11:11:11');

INSERT INTO comment (id, creatorID, statusID, text, timestamp)
VALUES ('1', '1', '1', 'Woo!', '2018-07-14 11:03:03'),
('2', '1', '1', 'Love!', '2018-04-30 03:13:42'),
('3', '2', '1', 'Nice!', '2018-10-03 05:55:40'),
('4', '3', '2', 'AWESOME!', '2018-08-19 15:51:50'),
('5', '1', '2', 'HAHA!', '2018-01-11 21:05:35'),
('6', '2', '3', 'ME TOO!', '2018-07-08 21:30:12'),
('7', '3', '3', 'OMG!', '2018-08-28 05:21:50'),
('8', '1', '4', 'WHAT?!', '2018-10-30 21:32:26'),
('9', '2', '4', 'COME ON!!!', '2018-06-29 15:45:21'),
('10', '3', '5', 'YEAAH!!', '2018-10-08 21:20:31'),
('11', '1', '5', 'NOOOO!!', '2018-06-03 09:18:14'),
('12', '2', '6', '...', '2018-03-02 14:49:41'),
('13', '3', '6', 'HUH!?!?', '2018-06-14 08:03:54'),
('14', '1', '7', 'YESSSSSSSSSS', '2018-04-14 01:40:25'),
('15', '2', '7', 'hmmm.....', '2018-04-22 09:27:13'),
('16', '3', '8', 'OoOoOoO', '2018-09-21 19:53:34'),
('17', '1', '8', 'WHO ARE U', '2018-07-10 22:59:33'),
('18', '2', '9', 'WOOOW!!!!', '2018-01-16 07:52:26'),
('19', '3', '9', 'NO WAY!?!', '2018-12-22 07:52:26');


INSERT INTO likeComment (employeeID, commentID)
VALUES ('1','5'),
('1','12'),
('2','5'),
('2','1'),
('3','8'),
('3','15');

INSERT INTO likeStatus (employeeID, statusID)
VALUES ('1','6'),
('1','8'),
('2','6'),
('2','3'),
('3','4'),
('3','5');

INSERT INTO event (id, creatorID, type, description, date, time, location)
VALUES ('1','1','Social', 'Hang out in K-TOWN!', '2019-01-25', '20:00:00', 'Los Angeles, CA'),
('2','1','Social', 'Watch this horror movie!', '2019-02-16', '19:00:00', 'Los Angeles, CA'),
('3','2','Business', 'Party at my place!!!', '2019-01-21', '18:00:00', 'Los Angeles, CA'),
('4','2','Business', 'Networking seriously', '2019-01-16', '12:00:00', 'Los Angeles, CA'),
('5','3','Social', 'Eat some PHO', '2019-02-06', '12:00:00', 'Los Angeles, CA'),
('6','3','Business', 'Get to work!!', '2019-02-23', '11:00:00', 'Los Angeles, CA');
