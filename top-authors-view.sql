-- Create a perspective containing the 5 authors with the highest average rating
CREATE VIEW top_authors AS
SELECT
    authors.id,
    authors.first_name,
    authors.last_name,
    AVG(reviews.rating) AS avg_rating
FROM
    authors
        JOIN
    books ON authors.id = books.author_id
        JOIN
    reviews ON books.id = reviews.book_id
GROUP BY
    authors.id
ORDER BY
    avg_rating DESC
LIMIT 5;
