CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE INDEX idx_authors_id ON authors (id);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    publication_year INTEGER,
    isbn VARCHAR(13),
    author_id INTEGER REFERENCES authors(id)
);

CREATE INDEX idx_books_id ON books (id);
CREATE INDEX idx_books_author_id ON books (author_id);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(id),
    rating INTEGER CHECK (rating >= 1 AND rating <= 10),
    content TEXT
);

CREATE INDEX idx_reviews_id ON reviews (id);
CREATE INDEX idx_reviews_book_id ON reviews (book_id);

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
