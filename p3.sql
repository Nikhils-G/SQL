create database college;

use college ;


CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    marks INT
);

INSERT INTO student (id, name, city, marks) VALUES
(1, 'Alice Johnson', 'New York', 95),
(2, 'Bob Smith', 'Los Angeles', 85),
(3, 'Charlie Brown', 'Chicago', 92),
(4, 'David Wilson', 'New York', 88),
(5, 'Emma Davis', 'Los Angeles', 91),
(6, 'Fiona Clark', 'Chicago', 89),
(7, 'George White', 'New York', 97),
(8, 'Hannah Lewis', 'Los Angeles', 93),
(9, 'Ian Hall', 'Chicago', 94),
(10, 'Jack Turner', 'Miami', 78);



select * from student;


select city,count(city) from student group by city order by count(city) desc;

select marks,count(marks) from student where marks < 90 group by marks order by marks;


CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    marks INT,
    grade CHAR(1),
    city VARCHAR(100)
);
INSERT INTO students (id, name, marks, grade, city) 
VALUES 
(1, 'Alice', 85, 'A', 'New York'),
(2, 'Bob', 75, 'B', 'Los Angeles'),
(3, 'Charlie', 92, 'A', 'Chicago'),
(4, 'Diana', 68, 'C', 'Houston'),
(5, 'Eve', 88, 'B', 'San Francisco'),
(6, 'Frank', 79, 'C', 'Miami'),
(7, 'Grace', 95, 'A', 'Seattle'),
(8, 'Hank', 60, 'D', 'Austin'),
(9, 'Ivy', 82, 'B', 'Boston'),
(10, 'Jack', 91, 'A', 'Denver');



select city,count(id) from students where marks > 90 group by city;


select city from students where grade="A" group by city having max(marks)>90;





set SQL_SAFE_UPDATES = 0;
update students set grade = "N" where grade ="A" ;


select * from students;

select name,marks from students where marks between 70 and 90;


create table p1(
  id int primary key,
  name varchar(50),
  grade char(1),
  marks varchar(20)
);

INSERT INTO p1(id, name, marks, grade) 
VALUES 
(1, 'Alice', 85, 'A'),
(2, 'Bob', 75, 'B'),
(3, 'Charlie', 92, 'A'),
(4, 'Diana', 68, 'C'),
(5, 'Eve', 88, 'B'),
(6, 'Frank', 79, 'C'),
(7, 'Grace', 95, 'A'),
(8, 'Hank', 60, 'D'),
(9, 'Ivy', 82, 'B'),
(10, 'Jack', 91, 'A');


select * from p1;


update p1 set grade ="S" where marks > 70 and marks <90;

select * from p1;

update p1 set marks= marks+1;

select * from p1;
