/*
Author: Brandon Lasher
Date: 9/15/2022

Homework 3 - Part 1, Tasks 5 & 6
*/


/*reload the database*/
source rating_task4.sql

/*Run new updates*/
insert into Rating values (209, 109, 3, '2001-01-01');
update Rating set rID = 209 where rID = 208;
update Rating set mID = mID + 1;
update Movie set mID = 109 where mID = 108;
update Rating set mID = 109 where mID = 102;
update Reviewer set rID = rID + 10;
delete from Reviewer where rID > 215;
delete from Movie where mID < 105;