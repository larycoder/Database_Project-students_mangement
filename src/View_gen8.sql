--
-- use database usth_gen8
--

USE usth_gen8;

--
-- view for guest
--
CREATE VIEW StudentsInfoForGeust AS SELECT ID, last_name, first_name, birthdate, gender, major FROM Students;
CREATE VIEW ScoresInfoForGeust AS SELECT student_id, course_id, final FROM Score_record;
CREATE VIEW CoursesInfoForGeust AS SELECT ID, course_name, credits, major FROM Courses;