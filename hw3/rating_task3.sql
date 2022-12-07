/*
Author: Brandon Lasher
Date: 9/15/2022

Homework 3 - Part 1, Tasks 3
*/

/*reload the database*/
source rating_task1_2.sql

update Movie set mID = mID + 1;
insert into Movie values (109, 'Titanic', 1997, 'JC');
insert into Reviewer values (201, 'Ted Codd');
update Rating set rID = 205, mID = 104;
insert into Reviewer values (209, null);
update Rating set stars = null where rID = 208;
update Movie set year = year - 40;
update Rating set stars = stars + 1;
insert into Rating values (201, 101, 1, '1999-01-01');
insert into Movie values (109, 'Jurassic Park', 1993, 'Steven Spielberg');
update Movie set year = year-10 where title = 'Titanic';
insert into Movie values (109, 'Titanic', 2001, null);
update Rating set mID = 109;
update Movie set year = 1901 where director != 'James Cameron';
update Rating set stars = stars - 1;