/*
Brandon Lasher
Homework 4 - Problem 1
*/

source hw4/rating.sql

/*
1).  Create a view called TNS containing title-name-stars triples, where the movie (title) 
       was reviewed by a reviewer (name) and received the rating (stars). 
       Then referencing only view TNS and table Movie, write a SQL query that returns the 
       lastest year of any movie reviewed by Chris Jackson. You may assume movie names are unique.

--DB schema
create table Movie(mID int, title varchar(100), year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);       
*/

DROP VIEW IF EXISTS TNS;

/*show full tables where table_type = 'VIEW';*/

CREATE VIEW TNS AS 
    SELECT Movie.title, Reviewer.name, Rating.stars 
    FROM Movie, Reviewer, Rating
    WHERE Rating.rID = Reviewer.rID and Movie.mID = Rating.mID;


SELECT max(Movie.year) 
    FROM TNS, Movie
    WHERE TNS.Title = Movie.Title and TNS.name = 'Chris Jackson';


/*
2).  Referencing view TNS from Exercise 1 and no other tables, 
      create a view RatingStats containing each movie title that has at least one rating, 
      the number of ratings it received, and its average rating. 
      Then referencing view RatingStats and no other tables, write a SQL query to find the title of the 
      highest-average-rating movie with at least three ratings.

*/
DROP VIEW IF EXISTS RatingStats;

CREATE VIEW RatingStats AS 
    SELECT TNS.title, count(TNS.title) as numRating, AVG(TNS.stars) as avgRating
    FROM TNS
    GROUP BY title;


/* Double check view */
/*SELECT * FROM RatingStats; */

SELECT title 
    FROM RatingStats 
    WHERE numRating >= 3 
    ORDER BY avgRating DESC LIMIT 1;