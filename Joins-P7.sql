create database school;

use school;

create table t1(
  id int primary key,
  name varchar(50)
);

create table t2(
  id int primary key,
  sub varchar(50)
);


insert into t1 values
(101,"nikhil"),
(102,"Tina"),
(103,"Priya"),
(104,"Manu");
insert into t2 values
(102,"sql"),
(105,"python"),
(103,"physics"),
(107,"eng");

select * from t1;

select * from t2;


INNER JOIN EXAMPLE --> 

select * from t1 inner join t2 on t1.id = t2.id;


-- LEFT JOIN EXAMPLE 

select * from t1 left join t2 on t1.id = t2.id;

-- here if u have table big use can remane it as like own way as t1 as t at the join leve before



select * from t1 right join t2 on t1.id=t2.id;

-- FULL OUTER JOIN performing 

select * from t1 left join t2 on t1.id = t2.id 
union 
select * from t1 right join t2 on t1.id = t2.id;

-- basically we dont perform full join but we do indirectlyby following up UNION METHOD BY RIGHT AND LEFT FORM

-- left exclusive join
select * from t1 left join  t2 on t1.id = t2.id 
where
t2.id is null;

-- right exclusive join 
select * from t1 right join  t2 on t1.id = t2.id 
where
t1.id is null;


-- self join 

select * from t1 
join t2 on
t1.id=t2.id;



select name as student_name ,sub as subject 
from t1 join t2 
on t1.id = t2.id;



