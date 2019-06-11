DROP SCHEMA IF EXISTS usth_gen8;
CREATE SCHEMA IF NOT EXISTS usth_gen8;
USE 'usth_gen8';

-- --------------------------------
-- Talbe 'usth_gen8'.'Students'
-- --------------------------------
CREATE TABLE Students (
	ID varchar(10) primary key,
	last_name varchar(50),
    first_name varchar(50),
    birthdate DATE,
    gender ENUM('M','F'),
    birth_place varchar(100),
    address varchar(100),
    email varchar(50),
    telephone int(15),
    major varchar(100)
);
-- --------------------------------
-- Talbe 'usth_gen8'.'Courses'
-- --------------------------------
CREATE TABLE Courses (
	ID varchar(10) primary key,
    course_name varchar(100),
    credits int(5),
	  major varchar(100),
    grade int(5),
    attendance_percent double,
	  homework_percent double,
    labwork_percent double,
    midterm_percent double,
    final_percent double
);
-- --------------------------------
-- Talbe 'usth_gen8'.'Lecturers'
-- --------------------------------
CREATE TABLE Lecturers (
	ID varchar(10) primary key,
    First_name varchar(50),
    major varchar(100),
    Last_name varchar(50)
);
-- --------------------------------
-- Talbe 'usth_gen8'.'Fees'
-- --------------------------------
CREATE TABLE Fees (
	ID varchar(10) primary key,
    Grade VARCHAR(10),
    Full_year varchar(20),
    A_semester varchar(20)
);
-- --------------------------------
-- Talbe 'usth_gen8'.'Scholarship'
-- --------------------------------
CREATE TABLE Scholarships (
	ID varchar(10) primary key,
    Scholar_type VARCHAR(3),
    Money varchar(20)
);
-- --------------------------------
-- Talbe 'usth_gen8'.'Score_record'
-- --------------------------------
CREATE TABLE Score_record (
    course_id varchar(10) NOT NULL,
    student_id varchar(10) NOT NULL,
    attendance double,
    homework double,
    labwork double,
    midterm double,
    final double,
    note varchar(500),
    FOREIGN KEY (course_id) REFERENCES Courses(ID),
    FOREIGN KEY (student_id) REFERENCES Students(ID)
);
-- --------------------------------
-- Talbe 'usth_gen8'.'Teaching'
-- --------------------------------
CREATE TABLE Teaching (
	Course_ID varchar(10),
    Lecturer_ID varchar(10),
    FOREIGN KEY (Course_ID) REFERENCES Courses(ID),
    FOREIGN KEY (Lecturer_ID) REFERENCES Lecturers(ID)
);
-- --------------------------------
-- Talbe 'usth_gen8'.'Scheduling'
-- --------------------------------
CREATE TABLE Scheduling (
	Course_ID varchar(10) NOT NULL,
    Course_date DATETIME,
    Course_place varchar(50),
    FOREIGN KEY (Course_ID) REFERENCES Courses(ID)
);
-- --------------------------------
-- Talbe 'usth_gen8'.'Has'
-- --------------------------------
CREATE TABLE Has (
	Student_ID varchar(10) NOT NULL,
    Scholar_ID varchar(10) NOT NULL,
    note varchar(500),
    FOREIGN KEY (Student_ID) REFERENCES Students(ID),
    FOREIGN KEY (Scholar_ID) REFERENCES Scholarships(ID)
);
-- --------------------------------
-- Talbe 'usth_gen8'.'Paid'
-- --------------------------------
CREATE TABLE Paid (
	Student_ID varchar(10) NOT NULL,
    Fee_ID varchar(10) NOT NULL,
    Paid varchar(20),
    Not_paid varchar(20),
    FOREIGN KEY (Student_ID) REFERENCES Students(ID),
    FOREIGN KEY (Fee_ID) REFERENCES Fees(ID)
);