show databases;
create database students;
use students;

CREATE TABLE students (
    student_id INT,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    city VARCHAR(50),
    marks INT
);

INSERT INTO students VALUES
(1, 'Aman', 20, 'BCA', 'Jaipur', 75),
(2, 'Riya', 22, 'BSc', 'Delhi', 82),
(3, 'Neha', 21, 'BCA', 'Jaipur', 65),
(4, 'Rahul', 23, 'BCom', 'Mumbai', 90),
(5, 'Pooja', 20, 'BCA', 'Delhi', 55);

-- Q1. Display all students’ data.
select * from students;

-- Q2. Display only the name and course columns.
select name, course from students;

-- Q3. Display the list of student cities (duplicates allowed).
select city from students;

-- Q4. Find the total number of students.
select count(student_id) from students;

-- WHERE CLAUSE QUESTIONS
-- Q5. Display students who are enrolled in the BCA course.
select name from students where course = 'BCA';

-- Q6. Display students who belong to Jaipur.
select name from students where city = 'jaipur';

-- Q7. Display students whose marks are greater than 70.
select name, marks from students where marks>70;

-- Q8. Display students whose age is less than or equal to 21.
select name from students where age<=21;

-- Q9. Display students from Delhi who scored more than 60 marks.
select name, city, marks from students where city = 'Delhi' and marks>60;

-- Q10. Display students who are in the BCA course and belong to Jaipur.
select name from students where course = 'BCA' and city = 'Jaipur';

-- Q11. Display students whose marks are between 50 and 80.
select name, marks from students where marks between 50 and 80;

-- Q12. Display students whose course is BCA or BSc.
select name from students where course in ('BCA', 'BSC');

-- Q13. Display students whose name starts with the letter ‘R’.
select name from students where name like 'R%';

-- Q14. Display students who belong to Jaipur or Delhi.
select name from students where city = 'Jaipur' and 'Delhi';

-- Q15. Display students whose marks are less than 60.
select name from students where marks <60;

-- Q16. Display students whose marks are greater than 70.
select name from students where marks>70;

-- Q17. Display students whose age is less than or equal to 20.
select name from students where age<=20;

-- Q18. Display students who belong to Delhi OR Jaipur.
select name from students where city in  ('Delhi', 'jaipur');

-- Q19. Display students who are NOT from Mumbai.
select name from students where city != 'Mumbai';

-- Q20. Display students whose marks are between 60 and 85.
select name from students where marks between 60 and 85;

-- Q21. Display students whose course is BCA or BSc.
select name, course from students where course in ('BCA', 'BSC');

-- Q22. Display students whose marks are not equal to 55.
select name from students where marks != 55;

-- Q23. Display students whose age is greater than 20 AND marks greater than 70
select name from students where age >20 and marks>70;

-- Q24. Display students whose name starts with ‘A’.
select name from students where name like 'A%';

-- Q25. Display students whose name ends with ‘a’.
select name from students where name like '%a';

-- Q26. Display students whose name contains ‘ha’.
select name from students where name like '%ha%';

-- Q27. Display students whose second letter is ‘o’.
select name from students where name like '_o%';

-- Q28. Display students whose name is exactly 5 characters long.
select name from students where name like '_____';

-- Q29. Display students whose name does NOT start with ‘P’.
select name from students where name not like 'P%';

-- Q30. Display student name in UPPERCASE and lowercase.
select name, upper(name), lower(name) from students;

-- Q31. Display student name along with city using CONCAT.
select name, concat(name, '-' ,city ) from students;

-- Q32. Display student details as:  Name - Course - City (use CONCAT_WS).
select concat_ws('-', name, course, city) from students;

-- Q33. Display students whose name starts with ‘R’ using LEFT().
select name from students where left(name, 1)= 'R';

-- Q34. Display students whose city’s first letter is ‘D’.
select name, city from students where left(city, 1) = 'D';

-- Q35. Display first 3 letters of each student’s name.
select name, left(name, 3) from students;