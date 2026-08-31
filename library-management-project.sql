-- PROJECT : Library Management System

-- Create Database
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

-- Create Table

-- Member table (jo log book issue karate hain)
CREATE TABLE members(
	member_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATE
    );
    
-- Books table
CREATE TABLE books(
	book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50),
    genre VARCHAR(50),
    total_copies INT DEFAULT 1
);  

-- Issue books table (kounsi book kisne li, kab li. kab bapas ki)
CREATE TABLE issue_books(
	issue_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
    );  
    
-- Insert data

-- Members
INSERT INTO members (member_id, name, email, join_date) VALUES
(1, 'Varish', 'vr@gamil.com', '2026-01-02'),
(2, 'Zainul', 'zr@gamil.com', '2026-02-05'),
(3, 'Sohil', 'sl@gmail.com', '2025-11-22');    

-- Books
INSERT INTO books (book_id, title, author, genre, total_copies) VALUES
(101, 'Atomic Habits', 'James Clear', 'Self-Help', 3),
(102, 'Harry Potter', 'J.K Rowling', 'Fantasy', 5),
(103, 'The Alchemist', 'Poulo Coelho', 'Fiction', 2),
(104, 'Clean Code', 'Robert Martin', 'Technology', 4);

ALTER TABLE issue_books RENAME TO issued_books;
-- Issued Book
INSERT INTO issued_books (issue_id, book_id, member_id, issue_date, return_date) VALUES
(1, 101, 1, '2026-08-01', '2026-10-02'),
(2, 102, 2, '2026-07-22', NULL), -- abhi tak bapas nahi ki
(3, 103, 3, '2026-04-19', '2026-06-09'),
(4, 104, 3, '2026-06-30', NULL);  -- abhi tak bapas nahi kill


-- [practice queries]

-- 1. sare members dekho
 SELECT * FROM members;

-- 2. sari books dekho
SELECT * FROM books;

-- 3. fantasy genre ki books
SELECT * FROM books WHERE genre = 'Fantasy'; 

-- 4. bboks ko title ke alphabetical order main dikhao
SELECT title, author FROM books ORDER BY title;

-- 5. kounsi book abhi tak return nahi hui (join + where)
SELECT members.name, books.title, issued_books.issue_date
FROM issued_books
JOIN members ON issued_books.member_id = members.member_id
JOIN books ON issued_books.book_id = books.book_id
WHERE issued_books.return_date IS NULL;

-- 6. har member ne kitni books issue ki hain (group by)
SELECT members.name, COUNT(issued_books.issue_id) AS total_books_issued
FROM members
JOIN issued_books ON members.member_id = issued_books.member_id
GROUP BY members.name;

-- 7. Sab se jyada copis bali books
SELECT title, total_copies FROM books ORDER BY total_copies DESC LIMIT 1;

-- 8. genre ke hisab se kitni books hain , grouping karke dikhao
SELECT genre, COUNT(*) AS total_books
FROM books
GROUP BY genre;

-- 9. kisi specific member ne kounsi book li hai
SELECT books.title, issued_books.issue_date, issued_books.return_date
FROM issued_books
JOIN books ON issued_books.book_id = books.book_id
JOIN members ON issued_books.member_id = members.member_id
WHERE members.name = 'Varish';

-- 10. naya number add karo
INSERT INTO members (member_id, name, email, join_date)
VALUES (4, 'Aman', 'aman@gamin.com', '2026-08-25');

-- 11. Ek book ki details update(copies badhao)
UPDATE books SET total_copies = total_copies + 2 WHERE book_id = 103;

-- 12. return date update karo jab book bapas aay
UPDATE issued_books SET return_date = '2026-08-03' WHERE issue_id = 2;
