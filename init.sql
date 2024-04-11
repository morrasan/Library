CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    publication_year INTEGER,
    isbn VARCHAR(13),
    author_id INTEGER REFERENCES authors(id)
);

CREATE INDEX idx_books_author_id ON books (author_id);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(id),
    rating INTEGER CHECK (rating >= 1 AND rating <= 10),
    content TEXT
);

CREATE INDEX idx_reviews_book_id ON reviews (book_id);
