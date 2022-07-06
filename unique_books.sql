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

IF SELECT COUNT(DISTINCT Books) FROM Students == 0 
  RETURN 0;
ELSE
  SELECT COUNT(DISTINCT Books) FROM Students
  ORDER BY Books
  ORDER BY Books DESC;
