use sakila;
CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),
('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),
('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),
('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),
('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),
('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),
('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');

select * from sales;
-- total sales
select sum(amount) as total_sales from sales;

-- mobile total sales
select sum(amount) as mobile_total_sales from sales where product = 'mobile';

-- find total sales and avg sales in the north region but for the product laptop and mobile
select sum(amount), avg(amount) from sales where region = 'north' and product in ('laptop', 'mobile');

-- find the max amount and min amount for februrary month 
select max(amount), min(amount) from sales where month(sale_date) = '02';

-- find total sales we have done in each region 
select region, sum(amount) from sales group by region;

-- find avg sales done by each person
select sales_person, avg(amount) from sales group by sales_person;

-- find total amount and total transaction/sales for each product but the amit should not be the sales person
select product, sum(amount), count(amount) from sales where sales_person != 'Amit' group by product;

-- find the no. of sales done by each person for the amount > 10000
select sales_person, count(sales_person) from sales where amount>10000 group by sales_person;

-- find the no. of transaction done from day 1 to day 7 for any  month 
select count(*) from sales where day(sale_date) BETWEEN 1 AND 7 ;
 
-- find total amount and avg amount max amount for each product of each region 
select product, region, sum(amount), avg(amount) , max(amount)  from sales  group by product, region ;

-- find the total transaction amount for each product where product should be sold more than 13 times
select product , sum(amount), count(product) from sales  group by product having count(*)>13;




-- assignment 
use sakila;
CREATE TABLE Sales_Data (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    Category VARCHAR(20),
    OrderDate DATE,
    OrderValue DECIMAL(10,2)
);

INSERT INTO Sales_Data (OrderID, CustomerID, Category, OrderDate, OrderValue)
VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500.00),
(1002, 'C203', 'Apparel', '2024-01-07', 3200.00),
(1003, 'C205', 'Home', '2024-01-10', 5800.00),
(1004, 'C201', 'Electronics', '2024-01-15', 8900.00),
(1005, 'C207', 'Apparel', '2024-01-18', 2100.00),
(1006, 'C210', 'Home', '2024-01-22', 4700.00),
(1007, 'C203', 'Electronics', '2024-02-01', 15300.00),
(1008, 'C212', 'Apparel', '2024-02-05', 1800.00),
(1009, 'C205', 'Home', '2024-02-08', 6200.00),
(1010, 'C214', 'Electronics', '2024-02-12', 9400.00),
(1011, 'C207', 'Apparel', '2024-02-17', 2900.00),
(1012, 'C210', 'Electronics', '2024-02-20', 11000.00),
(1013, 'C212', 'Home', '2024-03-01', 3500.00),
(1014, 'C201', 'Apparel', '2024-03-05', 4100.00),
(1015, 'C214', 'Home', '2024-03-10', 7800.00);

-- level 1 
-- Q1. Calculate the total revenue (sum of OrderValue) for each product Category.
select category, sum(ordervalue) from sales_data group by category order by sum(ordervalue) desc;

-- Q2. Count the total number of orders placed in each Category.
select category, count(orderid) from sales_data group by category order by count(OrderId) desc;

-- Q3. Find the highest (maximum) single OrderValue within each Category.
select category, max(ordervalue) from sales_data group by category order by max(ordervalue) desc;

-- level 2
-- Q1. List all unique product Categories that appear in the Sales_Data table.
select distinct(category) from sales_data order by category;

-- Q2. List all unique CustomerIDs who have placed at least one order.
select distinct(customerID) from sales_data order by customerID;

-- Q3. Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories).
select distinct customerID , category from sales_data order by customerID, category;

-- level 3
-- Q1. Revenue by CustomerID and Category
select customerId, category, sum(ordervalue) from sales_data group by customerid, category;

-- Q2. Order Count by CustomerID and Category
select customerid, category, count(*) from sales_data group by customerid, category;

-- Q3. Revenue by Category and Month
SELECT Category, MONTH(OrderDate),  SUM(OrderValue) 
FROM Sales_Data GROUP BY Category, MONTH(OrderDate) ORDER BY month(orderdate), Category;

-- Level 4 Solutions — GROUP BY with HAVING
-- Q1. Categories with Revenue > $20,000
SELECT Category, SUM(OrderValue) AS Total_Revenue
FROM Sales_Data GROUP BY Category
HAVING SUM(OrderValue) > 20000
ORDER BY Total_Revenue DESC;

-- Q2. Customers with More Than 1 Order
SELECT CustomerID, COUNT(OrderID) AS Order_Count
FROM Sales_Data GROUP BY CustomerID HAVING COUNT(OrderID) > 1 ORDER BY Order_Count DESC;

-- Q3. Customer + Category Spending > $10,000
SELECT
CustomerID,
Category,
SUM(OrderValue) AS Total_Spent
FROM Sales_Data
GROUP BY CustomerID, Category
HAVING SUM(OrderValue) > 10000
ORDER BY Total_Spent DESC;

-- Level 5 Solutions — Advanced Multi-Function Queries
-- Q1. Category KPI Dashboard (Avg > $5,000)
SELECT
Category,
COUNT(OrderID) AS Total_Orders,
SUM(OrderValue) AS Total_Revenue,
ROUND(AVG(OrderValue), 2) AS Avg_OrderValue
FROM Sales_Data
GROUP BY Category
HAVING AVG(OrderValue) > 5000
ORDER BY Total_Revenue DESC;

-- Q2. High-Value Repeat Customers
SELECT
CustomerID,
COUNT(OrderID) AS Order_Count,
ROUND(AVG(OrderValue), 2) AS Avg_OrderValue
FROM Sales_Data
GROUP BY CustomerID
HAVING COUNT(OrderID) > 1
AND AVG(OrderValue) > 6000
ORDER BY Avg_OrderValue DESC;

-- Q3. Category-Month Performance (Min 2 Orders)
SELECT
CustomerID,
COUNT(OrderID) AS Order_Count,
ROUND(AVG(OrderValue), 2) AS Avg_OrderValue
FROM Sales_Data
GROUP BY CustomerID
HAVING COUNT(OrderID) > 1
AND AVG(OrderValue) > 6000
ORDER BY Avg_OrderValue DESC;