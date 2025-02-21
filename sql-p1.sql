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

select name,marks from student;

select * from student;

select distinct city from student;

select * from student where marks>=80;

select * from student where city="HYD";
select * from student where marks>80;


select * from student where grade="F";

select * from student where marks > 80 AND city="HYD" ;

select distinct name from student;

select * from student where marks + 10 > 100;

select * from student where marks=80;

select * from student where marks > 80 OR city="HYD" ;

select * from student where marks between 80 AND 90;

select * from student where city in ("Pune" , "HYD","Delhi");

select * from student where city not in ("HYD") ;

select * from student where city not in ("HYD" , "Chennai") ;

select * from student where marks<80 limit 1;


select * from student order by marks asc;


select * from student order by marks desc;

