# MySQL - Up and Running

## Lesson Objectives tools
1. Connect to mysql
1. Create a Database
1. Create a table
1. Insert into the table
1. Select from table
1. Update the table
1. Delete from table

<br>

## Introduction

Why are we talking about SQL?

Most applications need a [data store](https://en.wikipedia.org/wiki/Data_store)
to persist important information. A relational database is the most common
datastore for a web application. SQL is the language of relational databases.

At it's simplest, a relational database is a mechanism to store and retrieve
data in a tabular form.

Spreadsheets are a good analogy. Individual sheets as tables and the whole
spreadsheet as a database. 

> Why is this important?

Database tables are a good place to store key/value pairs, as long as the values
are simple types (e.g. string, number). The keys are the column names and the
values are stored in each row. That maps well to simple JSON objects. A group of
rows from one table maps well to a JSON array.

> What about more complicated data?

Database tables can reference other tables which allows arbitrary nesting of
groups of simple types. This is something we'll be looking at more closely
later.

<br>

## Relational Database Management System ([RDBMS](http://en.wikipedia.org/wiki/Relational_database_management_system))

A **[Database
Server](http://upload.wikimedia.org/wikipedia/commons/5/57/RDBMS_structure.png)**
is a set of processes and files that manage the databases that store the tables.
Sticking with our previous analogy a database server would map to Google Sheets.

### Verb Equivalence

**[CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete)**
_(create, read, update and delete)_, SQL, HTTP, and Rails Controller action.

| CRUD   | SQL    | HTTP   | action     |
|:-------|:-------|:-------|:-----------|
| Create | INSERT | POST   | create     |
| Read   | SELECT | GET    | index/show |
| Update | UPDATE | PATCH  | update     |
| Delete | DELETE | DELETE | destroy    |

<br>

# ACID

ACID defines a set of rules for database transactions. These rules are built-in to our database technologies, so we don't need to worry too much about actively employing them ourselves. But knowing what they are helps provide a solid grounding for a what a database does.

What does ACID stand for:

**A - Atomicity**
* All or nothing, if one part fails, the entire transaction fails

**C - Consistency**
* Any valid transaction can only result in creating an equally valid state as defined by the various rules built by the programmer, constraints, cascades, etc. Transactions need to follow the rules inherent in the database and the validations on that data.

**I - Isolation**
* Concurrent transactions will not result invalid data. Transaction results look as though Concurrent transactions were run serially (one after another).

**D - Durability**
* The durability property ensures that once a transaction has been committed, it will remain so, even in the event of power loss, crashes, or errors. Once a change has been made, nothing but another transaction will change it.


## How to manage load on Data Server
1. Load Balancers
2. Targeted Customers

## What's a Relational Database?

<!-- AM: Whiteboard a table(s) during this section. -->

The most popular type of database is a **relational** database. How do they work?

![SQL tables](https://i.imgur.com/HjwqS4R.jpg)

*Tabular!*

**Data is stored in tables**

- These tables are organized by columns and rows, much like a spreadsheet.
- Tables are named according to what they model (e.g., `authors`, `books`).
- In the case of `authors`, each row represents one author.
- Each column is called an **attribute** or **field**, such as `id`, `title`, `birth_year`.

**Communicate via SQL (Structured Query Language)**

- SQL is a database language used specifically for relational databases.
- This is in contrast to non-relational databases. <br>

**Can relate data between tables**

- Hence the name *relational* database.
- We can relate rows in the `books` table to rows in the `authors` table.
- We use a `key` to do this, which is a field that is unique for each row in a table. 
- The key is often represented using an `id`, which is a unique identifier for each entry in a table. We refer to this as a `primary_key`.
- For example, to relate a book to an author we'd add a `foreign_key` field of `author_id` to our books table. The `author_id` would be the `primary_key` (or `id`) of the author the book belongs to.

<br>


## Associations



![](https://i.imgur.com/stPn9lA.png)

*via Rails Guides*

<br>


## Types of Relational Databases

There are lots of relational databases, such as PostgreSQL, MySQL, and SQLite.
They are all similar in that they use SQL, but they do have different features.

MySQL claims to be "the most popular open-source database".

If you're interested in pros and cons, check out this [article comparing MySQL,
Postgres, and SQLite](https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems).

<br>


## MySQL Installation

[Step by Step Guide for Installation of MYSQL and Workbench](https://github.com/sei-jed-10/MySQL-Downlaod-Steps)
[MySQL For MAC & Windows](https://dev.mysql.com/downloads/installer/)
<br>
[Workbench for MAC & Windows](https://dev.mysql.com/downloads/workbench/)
<br>

## Create a Database

```SQL
CREATE DATABASE foo; -- create the sub database foo
DROP DATABASE foo; -- drop it
CREATE DATABASE test_db;
\connect test_db; -- connect to the test_db sub database
```

<br>

## Data types

MySQL has the following data types:

1. int - whole number
1. decimal - float/decimal
1. bool - boolean
1. varchar(n) - text
1. timestamp - date

<br>

## Create a table

- Instead of collections, we have tables, which are just like a spreadsheet, or grid.  Rows are entries, and columns are properties of each row.

```sql
CREATE TABLE foo ( name varchar(20) ); -- create a table called 'foo' with one column called 'name' which is a small text column
\dt -- describe your tables
DROP TABLE foo; -- drop a table
CREATE TABLE users ( id serial, name varchar(20), age int, email varchar(32) ); -- 'test' table has an id column, which is just a number, and a name column
\d users; -- describe the columns of the test sub database
```

<br>

## Insert into the table

```sql
INSERT INTO users ( name, age, email ) VALUES ( 'Matt', 36, 'matt.huntington@generalassemb.ly'); -- create a row
```

<br>

## Select from table

```sql
SELECT name FROM users; -- select all rows from the users table.  display only the name column
SELECT * FROM users; -- select all rows from the users table.  display only the all columns
SELECT * FROM users WHERE name = 'Matt'; -- select all rows from the user table where the name column is set to 'Matt'
SELECT * FROM users WHERE name LIKE '%Matt%'; -- select all rows from the user table where the name column contains 'Matt'
SELECT * FROM users WHERE name = 'Matt' AND email = 'matt.huntington@generalassemb.ly'; -- select all rows from the user table where the name column is set to 'Matt' AND the email column is set to matt.huntington@generalassemb.ly
SELECT * FROM users WHERE name = 'Matt' OR email = 'matt.huntington@generalassemb.ly'; -- select all rows from the user table where either the name column is set to 'Matt' OR the email column is set to matt.huntington@generalassemb.ly
SELECT * FROM users WHERE age = 36; -- select all rows from the user table where the age column is set to 36
SELECT * FROM users WHERE age != 16; -- select all rows from the user table where the age column is not set to 16
SELECT * FROM users WHERE age > 26; -- select all rows from the user table where the age column is greater than 26
SELECT * FROM users WHERE age < 46; -- select all rows from the user table where the age column is less than 26
SELECT * FROM users WHERE age <= 36; -- select all rows from the user table where the age column is less than or equal to 36
SELECT * FROM users WHERE age >= 36; -- select all rows from the user table where the age column is greater than or equal to 36
SELECT * FROM users WHERE age IS NULL; -- select all rows from the user table where the age column has no value
SELECT * FROM users WHERE age IS NOT NULL; -- select all rows from the user table where the age column has any value
```

<br>

## Update the table

```sql
UPDATE users SET name = 'Matthew' WHERE id = 1; -- update the users table.  Set the name column to 'Matthew' for every row that has the id column set to 1
```

<br>

## Delete from table

```sql
DELETE FROM users WHERE id = 1; -- delete all rows from the users table that have the id column set to 1
```

<br>


## Part 2 - Lesson Objectives

1. Alter a table
1. Limit
1. Sorting
1. Aggregation
1. Joins

<br>

## Alter a table

```sql
ALTER TABLE users ADD COLUMN test VARCHAR(20); -- add an test string column
ALTER TABLE users DROP COLUMN test; -- drop the test column
ALTER TABLE users RENAME name TO first_name -- rename a column
ALTER TABLE users ADD COLUMN id serial PRIMARY KEY; -- add an id column that increments with each new row
ALTER TABLE users RENAME TO people; -- rename a table
ALTER TABLE people ALTER COLUMN first_name TYPE text; -- chang the data type of a column
```

<br>

## Limit

```sql
SELECT * FROM people LIMIT 1; -- select all rows from people table, but show only the first column
SELECT * FROM people LIMIT 1 OFFSET 1; -- select all rows from people table, but show only one column.  Skip the first row
```

<br>

## Sorting

```sql
SELECT * FROM people ORDER BY first_name ASC; -- select all rows from people table, order by name alphabetically
SELECT * FROM people ORDER BY first_name DESC; -- select all rows from people table, order by name reverse alphabetically
SELECT * FROM people ORDER BY age ASC; -- select all rows from people table, order by age ascending
SELECT * FROM people ORDER BY age DESC; -- select all rows from people table, order by age descending
```

<br>

## Aggregation

```sql
SELECT SUM(age), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show the SUM of the ages of each group.  Also show what name each group has
SELECT AVG(age), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show the AVG of the ages of each group.  Also show what name each group has
SELECT MIN(age), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show the MAX of the ages of each group.  Also show what name each group has
SELECT MAX(age), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show the MIN of the ages of each group.  Also show what name each group has
SELECT COUNT(age), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show how many rows have a value in the age column.  Also show what name each group has
SELECT COUNT(*), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show the number of rows in each group.  Also show what name each group has
SELECT array_agg(first_name), age FROM people GROUP BY age; -- divide all rows into groups by age.  List the names in each group and show what age each group has
```

<br>

## JOINS

Before running the below commands...

- Create a `companies` table with `id` and `name`
- Add `employer_id` to the `people` table

<br> 

```sql
SELECT * FROM people JOIN companies ON people.employer_id = companies.id -- find all people who have an employer_id column set and show which company they work for
SELECT * FROM people LEFT JOIN companies ON people.employer_id = companies.id -- find all people have an employer_id column set and show which company they work for.  In addition to this set, add on all people who do not have an employer_id column set
SELECT * FROM people RIGHT JOIN companies ON people.employer_id = companies.id -- find all people have an employer_id column set and show which company they work for.  In addition to this set, add on all companies who do not have any people with employer_id columns set to the company's id column
SELECT * FROM people FULL OUTER JOIN companies ON people.employer_id = companies.id; -- find all people have an employer_id column set and show which company they work for.  In addition to this set, add on all companies who do not have any people with employer_id columns set to the company's id column and all people who do not have an employer_id column set
```

<br>

# Part 3 - SQL JOINs

## Learning Objectives

- Define what a foreign key is
- Describe how to represent a one-to-many relationship in SQL database
- Explain how to represent one-to-one and many-to-many relationships in a SQL DB
- Distinguish between keys, foreign keys, and indexes
- Describe the purpose of the JOIN
- Use JOIN to combine tables in a SELECT
- Describe what it means for a database to be normalized

## Introduction

One of the key features of relational databases is that they can represent relationships between rows in different tables.

Going back to our library example, we have two tables: `books` and `authors`. Our goal now is to somehow indicate the relationship between a book and an author. In this case, that relationship indicates who wrote the book.

You can imagine that we'd like to use this information in a number of ways, such as...

- Getting the author information for a given book.
- Getting all books written by a given author.
- Searching for books based on attributes of the author (e.g., all books written by an American author).

## One-to-Many (10 minutes)

How might we represent this information in our database? For this example,
let's assume that each book has only one author (even though that's not always
the case in the real world.)

#### Option 1 - Duplicate Info (Wrong)

**authors**

- name
- nationality
- birth_year

**books**

- title
- pub_date
- author_name
- author_nationality
- author_birth_year

**Downside**: duplication, keeping data in sync.

#### Option 2 - Array of IDs (Wrong)

**authors**

- name
- nationality
- book_ids

**books**

- title
- pub_date

**Downside**: Parsing list, can't index (for speed!)

#### Option 3 (Correct!)

**authors**

- name
- nationality

**books**

- title
- pub_date
- author_id

![one_to_many](https://i.imgur.com/MKde2sH.png)

<br>

## WE DO

Describe the following relationships. Which table would contain the foreign key?

- Author, Blog
- Recipe, Ingredient
- Make, Model (car)

<br>

## Joins
To SELECT information on two or more tables at ones, we can use a JOIN clause.
This will produce rows that contain information from both tables. When JOINing
two or more tables, we have to tell the database how to 'match up' the rows.
(e.g. to make sure the author information is correct for each book).

This is done using the ON clause, which specifies which properties to match.

### Writing SQL JOINS

```sql
SELECT id FROM authors where name = 'J.K. Rowling';
SELECT * FROM books where author_id = 2;

SELECT * FROM books JOIN authors ON books.author_id = authors.id;
```

- primary key - `authors.id`
- foreign key - `books.author_id`
- be specific - name the databaseName.dataTable

```sql
SELECT * FROM books JOIN authors ON books.author_id = authors.id WHERE authors.nationality = 'United States of America';
```

### Alaises

You can also simplify your SQL queries using AS to create an alias.

```sql
SELECT * FROM books JOIN authors ON books.author_id = authors.id;

// would become

SELECT * FROM books AS b JOIN authors AS a ON b.author_id = a.id;
```

<br>

## You Do: Less Common Joins

There are actually a number of ways to join multiple tables with `JOIN`, if
you're really curious, check out this article:

[A visual explanation of SQL Joins](http://blog.codinghorror.com/a-visual-explanation-of-sql-joins/)

<br>

## You Do: Books and Authors

See advanced_queries.sql in the [sql-library-lab](./sql-library-lab) exercise.

<br>

## References and links

* [SQL vs NoSQL](http://dataconomy.com/sql-vs-nosql-need-know/)
* [To SQL or NoSQL? That’s the database question](http://arstechnica.com/information-technology/2016/03/to-sql-or-nosql-thats-the-database-question/)
* [SQLite vs MySQL vs PostgresQL](https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems)
* [A beginners guide to SQL](http://www.sohamkamani.com/blog/2016/07/07/a-beginners-guide-to-sql/)
* [Khan Academy: Intro to SQL](https://www.khanacademy.org/computing/computer-programming/sql)
* [SQL Zoo](http://sqlzoo.net/)
* http://sqlfiddle.com/#!15/35773/1
* https://pgexercises.com/
* https://www.sqlteaching.com/#!select
* https://sqlbolt.com/lesson/select_queries_introduction

## Sample Quiz Questions

* What is an ERD and why would we use one?
* What is the distinctive feature of a relational database?
* How is information stored in a relational database?
* What are the different types of relations that exist in a relational database?
* How do we indicate a one-to-many relationship in a database?

