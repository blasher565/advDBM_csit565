/*
Author: Brandon Lasher
Date: 9/15/2022

Homework 3 - Part 2

This reuses the output from task 4 in part 1

*/

/*reload the database*/
source rating_task4.sql

/*#36
write a SQL query that returns the latest year of any movie reviewed by Chris Jackson (Explanation: Among all the movies reviewed by Chris Jackson, check the release year of the movie and return the most recent). 

This is broken down into its sub queries

*/
/*Get rID*/
/* SELECT rID FROM Rating WHERE rID =(SELECT * FROM Reviewer WHERE name='Chris Jackson'); */

/*Get Movie IDs*/
/* SELECT mID FROM Rating WHERE rID=(SELECT rID FROM Reviewer WHERE name='Chris Jackson'); */

/*find max year of movies*/
SELECT MAX(year) FROM Movie WHERE mID IN( SELECT mID FROM Rating WHERE rID=(SELECT rID FROM Reviewer WHERE name='Chris Jackson') );


/*#37
 write a SQL query to find the title of movies with at least three ratings.
*/
/*Get counts and mID for each*/
/* SELECT mID, count(mID) FROM Rating GROUP by mID HAVING count(mID) > 2; */

/*Convert mID to titles, remove showing the count */
SELECT title FROM Movie WHERE mID IN( SELECT mID FROM Rating GROUP by mID HAVING count(mID) > 2 );
