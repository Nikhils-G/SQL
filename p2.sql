create database college;
use college;

create table student(
  rollno int primary key,
  name varchar(50),
  marks int not null,
  grade varchar(1),
  city varchar(20)
);

insert into student (rollno , name , marks,grade,city )
values 
(101,"nikhil",100,"A","HYD"),
(102,"Nitin",80,"C","Pune"),
(103,"Uday",85,"B","Pune"),
(104,"venkat",78,"C","Chennai"),
(105,"saketh",12,"F","HYD"),
(106,"nikhil",82,"B","HYD");

select distinct city from student;
select max(marks) from student;

select city,count(name) from student group by city;

select city , name , count(rollno) from student group by city,name;

select city,avg(marks) from student group by city order by avg(marks);


select city,avg(marks) from student group by city order by  avg(marks ) desc;
