create database example1;
use example1;


create table students (student_id int,
                        name varchar(20),
                        course_id int 
                        );

insert into students values (1, 'Rahul', 101),
                             (2, 'Priya', 102),
                             (3, 'Aman', 101),
                             (4, 'Neha', Null);
                             
create table courses (course_id int, 
                      course_name varchar(20),
                      fees int
                      );
                      
insert into courses values (101, 'Python', 5000),
                            (102, 'Java', 6000),
                            (103, 'SQL', 4000);
                            
select * from students;
select * from courses;

-- practice questions:

-- show student name and courses name 
select s.name , c.course_name 
from students as s 
inner join courses as c
on s.course_id = c.course_id;

-- list all students who are enrolled in a course
select s.name, c.course_name
from students as s 
inner join courses as c
on s.course_id = c.course_id;

-- display student name, course_id, course_name
select s.name, c.course_id, c.course_name
from students as s 
inner join courses as c
on s.course_id = c.course_id;

-- show only python course students
select c.course_name, s.name
from students as s 
inner join courses as c
on s.course_id = c.course_id
where course_name = 'Python';

-- find student whose course fees > 5000
select c.fees, s.name
from students as s 
inner join courses as c
on s.course_id = c.course_id
where c.fees > 5000;

-- display students with their course fees
select s.name, c.fees
from students as s 
inner join courses as c
on s.course_id = c.course_id;

-- Show all students, even those not enrolled in any course.
select s.name, c.course_name
from students as s 
left join courses as c
on s.course_id = c.course_id;

-- Show all courses, even if no student enrolled.
select s.name, c.course_name
from students as s 
right join courses as c
on s.course_id = c.course_id;

-- Display student name and course name, NULL allowed.
select s.name, c.course_name
from students as s 
left join courses as c
on s.course_id = c.course_id;

-- Find students without any course.
select s.name
from students as s 
left join courses as c
on s.course_id = c.course_id
where c.course_id is null;

-- Find courses with no students enrolled.
select c.course_name
from courses as c
left join students as s
on s.course_id = c.course_id
where s.student_id is null;

-- Count number of students per course.
select count(s.name), c.course_name
from courses as c 
inner join students as s
on s.course_id = c.course_id
group by c.course_name;