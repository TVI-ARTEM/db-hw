CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE library.Categories (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "parent_id" int
);

CREATE TABLE library.Books (
  "ISBN" varchar,
  "name" varchar,
  "year" int,
  "author_id" int,
  "num_of_pages" int,
  PRIMARY KEY ("ISBN")
);

CREATE TABLE library.BooksCategories (
  "category_id" int,
  "ISBN" varchar
);

CREATE TABLE library.Publishers (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "address" varchar
);

CREATE TABLE library.BookCopies (
  "shelf_position" int PRIMARY KEY,
  "ISBN" varchar
);

CREATE TABLE library.Rents (
  "id" SERIAL PRIMARY KEY,
  "shelf_position" int,
  "date_of_return" timestamp,
  "reader_id" int
);

CREATE TABLE library.Readers (
  "id" SERIAL PRIMARY KEY,
  "surname" varchar,
  "name" varchar,
  "address" varchar,
  "data_of_birth" timestamp
);

ALTER TABLE library.Categories ADD FOREIGN KEY ("parent_id") REFERENCES library.Categories ("id");

ALTER TABLE library.BooksCategories ADD FOREIGN KEY ("category_id") REFERENCES library.Categories ("id");

ALTER TABLE library.BooksCategories ADD FOREIGN KEY ("ISBN") REFERENCES library.Books ("ISBN");

ALTER TABLE library.Books ADD FOREIGN KEY ("author_id") REFERENCES library.Publishers ("id");

ALTER TABLE library.BookCopies ADD FOREIGN KEY ("ISBN") REFERENCES library.Books ("ISBN");

ALTER TABLE library.Rents ADD FOREIGN KEY ("shelf_position") REFERENCES library.BookCopies ("shelf_position");

ALTER TABLE library.Rents ADD FOREIGN KEY ("reader_id") REFERENCES library.Readers ("id");
