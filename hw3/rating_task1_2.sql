/*
Author: Brandon Lasher
Date: 9/15/2022

Homework 3 - Part 1, Tasks 1 & 2
*/


/* Delete the tables if they already exist */
drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;

/* Create the schema for our tables */
/* Orig lines */
/*
create table Movie(mID int, title varchar(100), year int, director text);
create table Reviewer(rID int, name text );
create table Rating(rID int, mID int, stars int, ratingDate date );
*/

create table Movie(mID int,
                title varchar(100) NOT NULL, 
                year int NOT NULL, 
                director text, 
                PRIMARY KEY(mID),
                unique(title, year), 
                CONSTRAINT year_chk CHECK (year > 1900),
                CONSTRAINT ss_chk CHECK (director<>"Steven Spielberg" or year < 1990) ,
                CONSTRAINT jc_chk CHECK (director<>"James Cameron" or year > 1990 ) 
                );

create table Reviewer(rID int,
                     name text NOT NULL,
                     PRIMARY KEY(rID) 
                     );

create table Rating(rID int,
                    mID int, 
                    stars int NOT NULL,
                    ratingDate date, 
                    unique(rID, mID, ratingDate),
                    CONSTRAINT star_chk CHECK (stars >= 1 and stars <= 5),
                    CONSTRAINT date_chk CHECK ( ratingDate > '2000-1-1' ),
                    );


/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');

