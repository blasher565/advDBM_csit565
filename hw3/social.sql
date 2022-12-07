/*
Author: Brandon Lasher
Date: 9/15/2022

Homework 3 - Part 3
*/

/* Delete the tables if they already exist */
drop table if exists Highschooler;
drop table if exists Friend;
drop table if exists Likes;


/* Create the schema for our tables */
create table Highschooler(ID int, name text, grade int);
create table Friend(ID1 int, ID2 int);
create table Likes(ID1 int, ID2 int);

/*
#38. write one or more triggers so that whenever a new student is inserted,
         or the grade of an exiting student is updated, or a student is deleted,  
         data in student_summary_trigger are modified to reflect the above mentioned change made on Highschooler.

*/

drop table if exists Student_summary_trigger;

/* Create table and populate with initial dataset */
create table Student_summary_trigger(grade int, numStudents int DEFAULT 0);

INSERT INTO  Student_summary_trigger values ( 9,0);
INSERT INTO  Student_summary_trigger values ( 10,0);
INSERT INTO  Student_summary_trigger values ( 11,0);
INSERT INTO  Student_summary_trigger values ( 12,0);

drop TRIGGER if exists Student_summary_trigger_ai;
DELIMITER //
create TRIGGER Student_summary_trigger_ai 
    AFTER INSERT ON Highschooler
    for each row
    UPDATE Student_summary_trigger  SET numStudents = numStudents+1 WHERE grade = NEW.grade;//
DELIMITER ;

drop TRIGGER if exists Student_summary_trigger_ad;
DELIMITER //
create TRIGGER Student_summary_trigger_ad 
    AFTER DELETE ON Highschooler
    for each row
    UPDATE Student_summary_trigger  SET numStudents = numStudents-1 WHERE grade = OLD.grade;//
DELIMITER ;

drop TRIGGER if exists Student_summary_trigger_au;
DELIMITER //
create TRIGGER Student_summary_trigger_au 
    AFTER UPDATE ON Highschooler
    for each row
    begin
        if NEW.grade != OLD.grade THEN
            UPDATE Student_summary_trigger  SET numStudents = numStudents-1 WHERE grade = OLD.grade;
            UPDATE Student_summary_trigger  SET numStudents = numStudents+1 WHERE grade = NEW.grade;
        end if;
    end;//
DELIMITER ;

/*Question #39*/
drop TRIGGER if exists Highschooler_bi;
DELIMITER //
create TRIGGER Highschooler_bi
    BEFORE INSERT ON Highschooler
    for each row
    begin
        if NEW.grade is NULL THEN
            SET NEW.grade = 9;
        ELSEIF NEW.grade < 9 OR NEW.grade > 12 THEN
            SET NEW.grade = NULL;
        end if;
    end;//

DELIMITER ;


/* Populate the tables with our data */
insert into Highschooler values (1510, 'Jordan', 9);
insert into Highschooler values (1689, 'Gabriel', 9);
insert into Highschooler values (1381, 'Tiffany', 9);
insert into Highschooler values (1709, 'Cassandra', 9);
insert into Highschooler values (1101, 'Haley', 10);
insert into Highschooler values (1782, 'Andrew', 10);
insert into Highschooler values (1468, 'Kris', 10);
insert into Highschooler values (1641, 'Brittany', 10);
insert into Highschooler values (1247, 'Alexis', 11);
insert into Highschooler values (1316, 'Austin', 11);
insert into Highschooler values (1911, 'Gabriel', 11);
insert into Highschooler values (1501, 'Jessica', 11);
insert into Highschooler values (1304, 'Jordan', 12);
insert into Highschooler values (1025, 'John', 12);
insert into Highschooler values (1934, 'Kyle', 12);
insert into Highschooler values (1661, 'Logan', 12);

insert into Highschooler values (2000, 'NULLBOY', 8);
insert into Highschooler values (2020, 'NULLGIRL', 14);

insert into Friend values (1510, 1381);
insert into Friend values (1510, 1689);
insert into Friend values (1689, 1709);
insert into Friend values (1381, 1247);
insert into Friend values (1709, 1247);
insert into Friend values (1689, 1782);
insert into Friend values (1782, 1468);
insert into Friend values (1782, 1316);
insert into Friend values (1782, 1304);
insert into Friend values (1468, 1101);
insert into Friend values (1468, 1641);
insert into Friend values (1101, 1641);
insert into Friend values (1247, 1911);
insert into Friend values (1247, 1501);
insert into Friend values (1911, 1501);
insert into Friend values (1501, 1934);
insert into Friend values (1316, 1934);
insert into Friend values (1934, 1304);
insert into Friend values (1304, 1661);
insert into Friend values (1661, 1025);
insert into Friend select ID2, ID1 from Friend;

insert into Likes values(1689, 1709);
insert into Likes values(1709, 1689);
insert into Likes values(1782, 1709);
insert into Likes values(1911, 1247);
insert into Likes values(1247, 1468);
insert into Likes values(1641, 1468);
insert into Likes values(1316, 1304);
insert into Likes values(1501, 1934);
insert into Likes values(1934, 1501);
insert into Likes values(1025, 1101);
