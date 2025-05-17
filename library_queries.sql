-- List all books in a category
SELECT title FROM Books JOIN Categories ON Books.category_id = Categories.category_id WHERE Categories.name = 'Fantasy';

-- Count of books per category
SELECT Categories.name, COUNT(*) as num_books
FROM Books JOIN Categories ON Books.category_id = Categories.category_id
GROUP BY Categories.name;

-- All members who joined after a certain date
SELECT * FROM Members WHERE join_date > '2024-06-01';

-- List all books along with their category and publisher names
SELECT 
    b.title AS Book_Title,
    b.author AS Author,
    c.name AS Category,
    p.name AS Publisher,
    b.copies,
    b.available
FROM Books b
JOIN Categories c ON b.category_id = c.category_id
JOIN Publishers p ON b.publisher_id = p.publisher_id
ORDER BY b.title;

-- List all movies along with their category and publisher names
SELECT 
    m.title AS Movie_Title,
    m.director AS Director,
    c.name AS Category,
    p.name AS Publisher,
    m.available
FROM Movies m
JOIN Categories c ON m.category_id = c.category_id
JOIN Publishers p ON m.publisher_id = p.publisher_id
ORDER BY m.title;

-- Find categories with the highest number of available books
SELECT 
    c.name AS Category,
    SUM(b.available) AS Total_Available_Books
FROM Books b
JOIN Categories c ON b.category_id = c.category_id
GROUP BY c.name
ORDER BY Total_Available_Books DESC;
