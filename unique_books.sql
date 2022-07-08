-- Question 1:
-- Given three database tables
-- Students
-- |id|name|
-- Books
-- |id|title|
-- Readings
-- |id|book_id|student_id|reading_duration|

-- write a query that returns a list of the number of unique books read by each student. If a student
-- has not read any books, the list should display a 0. The list should be sorted by the number of
-- books read, then alphabetically by name.

-- -- -- SOLUTION

-- ex. 
-- students 
-- 1 - John
-- 2 - Dafne
-- 3 - Leon

-- books 
-- 3 - 12 Rules For Life
-- 4 - Harry Potter

-- readings
-- 6 - 3 - 1 - 30
-- 7 - 4 - 2 - 20
-- 8 -   - 3 - 0

SELECT student_id,
CASE
    WHEN (book_id == null) THEN 0
    ELSE COUNT(DISTINCT(book_id))
END
FROM readings
ORDER BY book_id ASC,student_id; 
-- currently this is sorting by book_id and student_id instead of sorting by book name and student name. The next step would be to update it to pull the data from the other tables. 