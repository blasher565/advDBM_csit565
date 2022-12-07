/*
Brandon Lasher
Homework 4 - Problem 3
*/

source hw4/social.sql

/*
   Preparation step: create a table, called student_summary_sp that can be 
   used to store the number of students in each grade level, 
   then, populate the table with initial data set. 

--dB schema
create table Highschooler(ID int, name text, grade int);
create table Friend(ID1 int, ID2 int);
create table Likes(ID1 int, ID2 int);


SHOW PROCEDURE STATUS WHERE dB=csit565;
*/

/*Create the table */

DROP TABLE if exists student_summary_sp;

Create TABLE student_summary_sp( grade int, numStudents int);

/*Create the inital dataset*/
INSERT INTO student_summary_sp VALUES (9, 0);
INSERT INTO student_summary_sp VALUES (10, 0);
INSERT INTO student_summary_sp VALUES (11, 0);
INSERT INTO student_summary_sp VALUES (12, 0);

SELECT * from student_summary_sp;

/*
   1). write a stored procedure to update the number of students in a given grade 
        level with given change, e.x.  2 more students in grade 9.
*/


SELECT "PART 1!" as "";

DROP PROCEDURE if exists updateNumStudents;

DELIMITER //

CREATE PROCEDURE updateNumStudents( in gradeLevel int, in changeAmt int )
begin
     update student_summary_sp 
             set numStudents = student_summary_sp.numStudents + changeAmt
             WHERE grade = gradeLevel;
end;//

DELIMITER ;

/*
   2). write a stored procedure to update/refresh the number of students in 
       all grade levels simultaneously, i.e. reflecting all changes in Highschooler 
       relation when the stored procedure is called.
*/

SELECT "PART 2!" as "";

DROP PROCEDURE if exists updateNumStudents_All;

DELIMITER //

CREATE PROCEDURE updateNumStudents_All()
begin
     update student_summary_sp 
             set numStudents = (SELECT count(*) FROM Highschooler WHERE grade = student_summary_sp.grade);
end;//

DELIMITER ;

/*
Testing 
*/
/*
SELECT * from student_summary_sp;
call updateNumStudents(9,2);
SELECT * from student_summary_sp;

call updateNumStudents_All();

SELECT * from student_summary_sp;
*/

