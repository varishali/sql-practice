-- JSON practice

USE practice;

CREATE TABLE marks (
	id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(30),
    score INT
);

-- INSERT DATA

INSERT INTO marks (id, student_id, subject, score)
VALUES (1, 1, 'Math', 92);

INSERT INTO marks (id, student_id, subject, score)
VALUES (2, 2, 'Physics', 87);

INSERT INTO marks (id, student_id, subject, score)
VALUES (3, 3, 'Math', 75);

-- INNER JOIN

SELECT students.name, marks.subject, marks.score
FROM students
INNER JOIN marks ON students.id = marks.student_id;

-- group by

SELECT students.name, SUM(marks.score) AS total_score
FROM students
JOIN marks ON students.id = marks.student_id
GROUP BY students.name;

-- order by

SELECT students.name, marks.subject, marks.score
FROM students
JOIN marks ON students.id = marks.student_id
ORDER BY marks.score DESC;