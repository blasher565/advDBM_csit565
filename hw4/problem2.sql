/*
Brandon Lasher
Homework 4 - Problem 2
*/

source hw4/rating.sql
/*
      Create a view called Post80 that contains the title and year of movies made 
      after 1980. Do not use WITH CHECK OPTION in the CREATE VIEW statement.


--DB schema
create table Movie(mID int, title varchar(100), year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);

*/

DROP VIEW IF EXISTS Post80;

/*show full tables where table_type = 'VIEW';*/
/*
CREATE VIEW Post80 AS 
    SELECT Movie.title, Movie.year
    FROM Movie
    WHERE Movie.year > 1980;
*/

CREATE VIEW Post80 AS 
    SELECT Movie.title, Movie.year
    FROM Movie
    WHERE Movie.year > 1980
    WITH CHECK OPTION;

/* Double check the view */
SELECT * FROM Post80;

/*Part A*/
insert into Post80 values('Hocus Bogus', 1979);

/*Part B*/
DELETE FROM Post80 WHERE title = 'Star Wars';

/*Part C*/ 
UPDATE Post80 SET year = 1720 WHERE title = 'Avatar';

SELECT * FROM Post80;
SELECT * FROM Movie;