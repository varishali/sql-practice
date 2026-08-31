CREATE DATABASE IF NOT EXISTS practice;
USE practice;
-- Create table
CREATE TABLE students (
	id INT PRIMARY KEY,
    NAME VARCHAR(50),
    age INT,
    class VARCHAR(10)
);

-- Date insert 
INSERT INTO students (id, name, age,  class)
VALUES (1, 'Varish', 20, '12th');

INSERT INTO students (id, name, age, class)
VALUES (2, 'Zainul', 21, '11th');

-- select -> data nikalna

-- sara data 
SELECT * FROM students;

-- specific columns
SELECT name, age FROM students;

    
    