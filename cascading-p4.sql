-- Step 1: Create the database
CREATE DATABASE library;

USE library;

-- Step 2: Create the 'authors' table
CREATE TABLE authors (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(100)
);

-- Step 3: Insert data into the 'authors' table
INSERT INTO authors (author_id, author_name) VALUES
(1, 'J.K. Rowling'),
(2, 'George Orwell'),
(3, 'J.R.R. Tolkien');

-- Step 4: Create the 'books' table with a foreign key reference to 'authors'
CREATE TABLE books (
  book_id INT PRIMARY KEY,
  book_title VARCHAR(100),
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES authors(author_id)
    ON DELETE CASCADE  -- If an author is deleted, their books are also deleted
    ON UPDATE CASCADE  -- If an author ID is updated, it cascades to the books
);

-- Step 5: Insert data into the 'books' table
INSERT INTO books (book_id, book_title, author_id) VALUES
(1, 'Harry Potter and the Philosopher\'s Stone', 1),
(2, '1984', 2),
(3, 'The Hobbit', 3);

-- Step 6: View the data from both tables
SELECT * FROM authors;
SELECT * FROM books;

-- Step 7: Demonstrate ON UPDATE CASCADE
-- Update author_id from 2 to 4 for 'George Orwell'
UPDATE authors
SET author_id = 4
WHERE author_id = 2;

-- View books table to see that author_id has been updated automatically
SELECT * FROM books;

-- Step 8: Demonstrate ON DELETE CASCADE
-- Delete 'J.K. Rowling' from the authors table
DELETE FROM authors
WHERE author_id = 1;

-- View books table to see that the books of 'J.K. Rowling' have been deleted automatically
SELECT * FROM books;
