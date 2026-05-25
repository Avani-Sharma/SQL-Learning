create database const_db;
use const_db;

-- to access the database 
SELECT DATABASE();

-- DDL ( data defination language) create 
CREATE TABLE IF NOT EXISTS test1 (
    id INT,
    age INT
);

-- DML (data manipulation language) insert
INSERT INTO test1 VALUES
(101,32),
(102,NULL);

-- to fetch the data
SELECT * FROM test1;

-- Constraints
-- Constraints are rules applied on table columns to prevent invalid data in the table

CREATE TABLE IF NOT EXISTS test3 (
    id INT not null ,
    age INT
);

INSERT INTO test3 VALUES (102,32);
INSERT INTO test3 VALUES (NULL,40);

SELECT * FROM test3;


-- ==============================
-- PRIMARY KEY
-- Primary key NULL nahi ho sakti
-- aur duplicate bhi nahi ho sakti
-- ==============================

CREATE TABLE IF NOT EXISTS tests6 (
    id INT PRIMARY KEY,
    age INT
);

INSERT INTO tests6 VALUES (80,23);

-- Error aayega because primary key NULL nahi ho sakti
-- INSERT INTO tests6 VALUES (NULL,27);

SELECT * FROM tests6;


-- ==============================
-- COMPOSITE PRIMARY KEY
-- multiple columns milkar primary key banati hain
-- ==============================

CREATE TABLE IF NOT EXISTS tests8 (
    id INT,
    age INT,
    salary INT,
    PRIMARY KEY (id, age)
);

INSERT INTO tests8 VALUES
(1,50,5000000),
(2,40,20000),
(1,51,6000000),
(3,50,100);

SELECT * FROM tests8;

DESC tests8;

-- Super key = saare possible unique combinations
-- Composite key = smallest combination of columns
-- jo uniquely identify kare


-- ==============================
-- CHECK Constraint
-- ==============================

CREATE TABLE IF NOT EXISTS tests9 (
    id INT,
    age INT CHECK (age > 18)
);

INSERT INTO tests9 VALUES (1,50);

-- Error aayega because age 18 se choti hai
-- INSERT INTO tests9 VALUES (1,10);

SELECT * FROM tests9;


-- ==============================
-- CHECK with BETWEEN
-- ==============================

CREATE TABLE IF NOT EXISTS test10 (
    id INT,
    age INT CHECK(age BETWEEN 18 AND 22)
);

INSERT INTO test10 VALUES (1,20);

-- Error aayega because 10 range ke bahar hai
-- INSERT INTO test10 VALUES (1,10);

SELECT * FROM test10;


-- ==============================
-- FOREIGN KEY
-- ==============================

CREATE TABLE class (
    cname VARCHAR(20) PRIMARY KEY
);

INSERT INTO class VALUES
('10'),
('8'),
('9');

SELECT * FROM class;


CREATE TABLE student (
    id INT,
    name VARCHAR(20),
    cname VARCHAR(20),
    FOREIGN KEY (cname) REFERENCES class(cname)
);

INSERT INTO student VALUES
(1,'naina','10'),
(2,'abhi','9');

SELECT * FROM student;


-- ==============================
-- SQL Data Types
-- INT         -> Integer values
-- VARCHAR(n)  -> String values
-- DATE        -> Date values
-- FLOAT       -> Decimal numbers
-- ==============================