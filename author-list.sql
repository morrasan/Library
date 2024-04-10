SELECT
    authors.first_name,
    authors.last_name,
    COUNT(books.id) AS books_written
FROM
    authors
        LEFT JOIN
    books ON authors.id = books.author_id
GROUP BY
    authors.id;
