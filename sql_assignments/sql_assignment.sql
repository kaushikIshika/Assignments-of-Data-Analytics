create database if not exists UniversityDB;

use UniversityDB;

create table if not exists UniversityDB.Departments
(
DepartmentID bigint primary key,
DepartmentName varchar(50)
);

create table if not exists UniversityDB.Students (
StudentID int primary key,
stName varchar(50), 
Age bigint, 
DepartmentID bigint,
Constraint foregin_key_departmentID Foreign Key (DepartmentID)
references  Departments(DepartmentID)
);


create table if not exists UniversityDB.Courses
(
CourseID bigint primary key,
CourseName varchar(50),
StudentID int,
constraint foreign_key_studentid foreign key (StudentID)
references Students(StudentID)
);

INSERT INTO UniversityDB.Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Electronics'),
(6, 'Electrical'),
(7, 'Mathematics'),
(8, 'Physics'),
(9, 'Chemistry'),
(10, 'Biotechnology');


INSERT INTO  UniversityDB.Students (StudentID, stName, Age, DepartmentID) VALUES
(101, 'Aman', 20, 1),
(102, 'Priya', 21, 2),
(103, 'Rahul', 22, 1),
(104, 'Neha', 20, 3),
(105, 'Rohit', 23, 4),
(106, 'Sneha', 21, 5),
(107, 'Karan', 22, 6),
(108, 'Anjali', 20, 7),
(109, 'Vikas', 23, 8),
(110, 'Pooja', 21, 9);


INSERT INTO UniversityDB.Courses (CourseID, CourseName, StudentID) VALUES
(201, 'Python', 101),
(202, 'SQL', 102),
(203, 'Java', 103),
(204, 'C++', 104),
(205, 'Data Analytics', 105),
(206, 'Machine Learning', 106),
(207, 'Web Development', 107),
(208, 'Statistics', 108),
(209, 'Cloud Computing', 109),
(210, 'Data Engineering', 110);


select * from UniversityDB.Students;

select * from UniversityDB.Courses;

select * from UniversityDB.Departments;
-- query 1---
select st.StudentID,st.stName,st.Age,st.DepartmentID,dep.DepartmentName 
from UniversityDB.Students as st  join UniversityDB.Departments as dep
on st.DepartmentID = dep.DepartmentID;

-- query2--  
select st.StudentID,st.stName,cr.CourseID,cr.CourseName from UniversityDB.Students as st  join UniversityDB.Courses as cr on st.StudentID = cr.StudentID
where CourseName ="Artificial Intelligence";

-- query 3- --- 
 select DepartmentID ,count(*) as total_students_in_each_department  from  UniversityDB.Students
 group by DepartmentID;

-- query 4---
select cr.CourseName from UniversityDB.Students as st  join UniversityDB.Courses as cr on st.StudentID=cr.StudentId
where st.stName="Anjali";

-- query 5--
select StudentID , count(CourseID) as total_course from UniversityDB.Courses 
group by StudentID having total_course>1;

-- query 6--
select DepartmentID, avg(Age) as average_age_students from UniversityDB.Students
group by DepartmentID ;
 -- query 7--
select DepartmentID , count(StudentID) as total_students from UniversityDB.Students 
group by DepartmentID order by total_students desc limit 1;

-- query 8  ---
 
 select st.StudentID,st.stName from UniversityDB.Students as st left join UniversityDB.Courses as cr on st.StudentID =cr.studentID where 
 cr.CourseID is null;
 
  -- query 9 ---
select st.StudentID,count(cr.CourseID)as total_course from  UniversityDB.Students as st left join UniversityDB.Courses as cr on st.StudentID = cr.StudentID 
group by st.StudentID;

-- query 10----

select st.StudentID,st.stName,cr.CourseName from  UniversityDB.Students as st left join UniversityDB.Courses as cr on st.StudentID = cr.StudentID 
where cr.CourseName like "Data%" 
;
