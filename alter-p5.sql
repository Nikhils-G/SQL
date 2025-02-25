CREATE DATABASE school_database;

USE school_database;

CREATE TABLE school_info (
  school_id INT PRIMARY KEY,
  school_name VARCHAR(100),
  location VARCHAR(100),
  num_students INT,
  school_type ENUM('Government', 'Private') DEFAULT 'Private',
  principal_name VARCHAR(100),
  established_year INT,
  contact_number VARCHAR(15),
  website VARCHAR(100)
);

-- Insert sample data for Indian schools
INSERT INTO school_info (school_id, school_name, location, num_students, school_type, principal_name, established_year, contact_number, website)
VALUES 
(1, 'Lotus Valley School', 'New Delhi', 1200, 'Private', 'Mr. Sharma', 1995, '011-12345678', 'www.lotusvalleyschool.in'),
(2, 'Vidya Bharati School', 'Mumbai', 1500, 'Government', 'Mrs. Rani', 1980, '022-98765432', 'www.vidyabharatischool.org'),
(3, 'Gyan Jyoti Academy', 'Bangalore', 800, 'Private', 'Dr. Gupta', 2005, '080-23456789', 'www.gyanjyotiacademy.edu'),
(4, 'Shree Ram Vidyalaya', 'Ahmedabad', 950, 'Private', 'Mr. Verma', 1990, '079-34567890', 'www.shreramvidyalaya.com'),
(5, 'Vedic School', 'Pune', 600, 'Government', 'Mrs. Desai', 1975, '020-45678901', 'www.vedicschool.edu');

-- Retrieve the data to verify
SELECT * FROM school_info;


alter table school_info add column students_count int ;

SELECT * FROM school_info;


alter table school_info drop column students_count ;

select * from school_info;

alter table school_info rename school;
select * from school;


alter table school change column location loc varchar(50);

select * from school;

alter table school modify num_students float;

select * from school;


CREATE TABLE info (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(100),
  age INT,
  height DECIMAL(5,2),
  rank_in_class INT,
  gender ENUM('Male', 'Female') 
);

-- Inserting 50 rows of sample student data with gender
INSERT INTO info (student_id, student_name, age, height, rank_in_class, gender)
VALUES 
(1, 'Aarav Kumar', 16, 5.5, 1, 'Male'),
(2, 'Priya Sharma', 17, 5.6, 2, 'Female'),
(3, 'Ishaan Patel', 15, 5.3, 3, 'Male'),
(4, 'Diya Reddy', 16, 5.7, 4, 'Female'),
(5, 'Raj Singh', 17, 5.9, 5, 'Male'),
(6, 'Ananya Gupta', 16, 5.4, 6, 'Female'),
(7, 'Karan Desai', 15, 5.2, 7, 'Male'),
(8, 'Maya Rao', 17, 5.6, 8, 'Female'),
(9, 'Aman Mehta', 16, 5.8, 9, 'Male'),
(10, 'Sanya Kapoor', 15, 5.5, 10, 'Female'),
(11, 'Vikram Singh', 16, 5.9, 11, 'Male'),
(12, 'Neha Yadav', 17, 5.7, 12, 'Female'),
(13, 'Arjun Nair', 16, 5.5, 13, 'Male'),
(14, 'Pooja Verma', 15, 5.6, 14, 'Female'),
(15, 'Ravi Joshi', 17, 5.8, 15, 'Male'),
(16, 'Simran Bhatia', 16, 5.4, 16, 'Female'),
(17, 'Rahul Arora', 15, 5.7, 17, 'Male'),
(18, 'Shreya Patel', 16, 5.3, 18, 'Female'),
(19, 'Ishita Chauhan', 17, 5.6, 19, 'Female'),
(20, 'Kritika Soni', 16, 5.5, 20, 'Female'),
(21, 'Harshit Verma', 15, 5.6, 21, 'Male'),
(22, 'Ritika Sharma', 17, 5.7, 22, 'Female'),
(23, 'Siddharth Dubey', 16, 5.8, 23, 'Male'),
(24, 'Nidhi Agarwal', 15, 5.4, 24, 'Female'),
(25, 'Gaurav Rathi', 16, 5.9, 25, 'Male'),
(26, 'Rupal Joshi', 17, 5.5, 26, 'Female'),
(27, 'Manish Rathi', 16, 5.3, 27, 'Male'),
(28, 'Aditi Sethi', 15, 5.6, 28, 'Female'),
(29, 'Shubham Yadav', 16, 5.7, 29, 'Male'),
(30, 'Tanya Malik', 17, 5.5, 30, 'Female'),
(31, 'Kiran Tiwari', 16, 5.6, 31, 'Female'),
(32, 'Nitin Rajput', 15, 5.4, 32, 'Male'),
(33, 'Ankur Sharma', 16, 5.8, 33, 'Male'),
(34, 'Sneha Agarwal', 17, 5.7, 34, 'Female'),
(35, 'Aditya Chauhan', 16, 5.5, 35, 'Male'),
(36, 'Madhuri Verma', 15, 5.3, 36, 'Female'),
(37, 'Suresh Patel', 17, 5.9, 37, 'Male'),
(38, 'Kavita Reddy', 16, 5.6, 38, 'Female'),
(39, 'Nikhil Soni', 15, 5.8, 39, 'Male'),
(40, 'Radhika Yadav', 16, 5.4, 40, 'Female'),
(41, 'Vishal Joshi', 17, 5.7, 41, 'Male'),
(42, 'Arvind Rathi', 16, 5.5, 42, 'Male'),
(43, 'Niharika Verma', 15, 5.9, 43, 'Female'),
(44, 'Deepika Kapoor', 16, 5.6, 44, 'Female'),
(45, 'Tarun Joshi', 17, 5.5, 45, 'Male'),
(46, 'Ankita Verma', 16, 5.4, 46, 'Female'),
(47, 'Ajay Nair', 15, 5.8, 47, 'Male'),
(48, 'Anjali Mehta', 16, 5.7, 48, 'Female'),
(49, 'Kushal Reddy', 17, 5.9, 49, 'Male'),
(50, 'Pranjal Arora', 16, 5.5, 50, 'Male');

-- Retrieve the data to verify
SELECT * FROM info;



truncate table info;

select * from info; -- the data will be removed but the table is yet not deleted !!!


DELETE FROM student_info
WHERE marks < 90;

ALTER TABLE student_info
DROP COLUMN grade;
