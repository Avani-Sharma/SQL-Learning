use sakila;
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
city VARCHAR(30) NOT NULL,
category VARCHAR(30) NOT NULL,
product VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
order_date DATE NOT NULL
);

INSERT INTO orders VALUES
(1001, 'Rahul Sharma', 'Mumbai', 'Electronics', 'Laptop', 1,
55000, '2024-01-05'),
(1002, 'Priya Patel', 'Delhi', 'Clothing', 'Kurta', 3,
1500, '2024-01-07'),
(1003, 'Amit Singh', 'Bangalore', 'Electronics', 'Smartphone', 2,
18000, '2024-01-10'),
(1004, 'Sunita Rao', 'Chennai', 'Furniture', 'Chair', 4,
3200, '2024-01-12'),
(1005, 'Vikram Joshi', 'Mumbai', 'Electronics', 'Tablet', 1,
22000, '2024-01-15'),
(1006, 'Neha Gupta', 'Delhi', 'Clothing', 'Saree', 2,
4500, '2024-01-18'),
(1007, 'Kiran Kumar', 'Bangalore', 'Furniture', 'Table', 1,
8500, '2024-01-20'),
(1008, 'Deepak Verma', 'Chennai', 'Electronics', 'Headphones', 5,
2500, '2024-02-02'),
(1009, 'Anjali Mehta', 'Mumbai', 'Clothing', 'Jacket', 2,
3800, '2024-02-05'),
(1010, 'Ravi Nair', 'Bangalore', 'Electronics', 'Monitor', 1,
15000, '2024-02-08'),
(1011, 'Pooja Iyer', 'Chennai', 'Furniture', 'Sofa', 1,
25000, '2024-02-12'),
(1012, 'Suresh Patil', 'Delhi', 'Electronics', 'Keyboard', 3,
1800, '2024-02-15'),
(1013, 'Meena Desai', 'Mumbai', 'Furniture', 'Bookshelf', 2,
6000, '2024-02-18'),
(1014, 'Arun Reddy', 'Bangalore', 'Clothing', 'Jeans', 3,
2200, '2024-02-22'),
(1015, 'Lalita Shah', 'Delhi', 'Electronics', 'Smartwatch', 2,
9500, '2024-02-25');

select * from orders;
-- Q1 How many orders were placed in each city? (Sort by city A–Z)
SELECT city, COUNT(*) AS total_orders
FROM orders
GROUP BY city
ORDER BY city ASC;

-- Q2 What is the total revenue (price × quantity) earned from each category? (Sort by total_revenue DESC)
SELECT category, SUM(price * quantity) AS total_revenue
FROM orders
GROUP BY category
ORDER BY total_revenue DESC;

-- Q3 How many orders belong to each category? (Sort by category A–Z)
SELECT category, COUNT(*) AS order_count
FROM orders
GROUP BY category
ORDER BY category ASC;

-- Q4 What is the average price of orders in each city? Round to 2 decimal places. (Sort by city A–Z)
SELECT city, ROUND(AVG(price), 2) AS avg_price
FROM orders
GROUP BY city
ORDER BY city ASC;

-- Q5 What is the maximum price of a product in each category? (Sort by category A–Z)
SELECT category, MAX(price) AS max_price
FROM orders
GROUP BY category
ORDER BY category ASC;

-- Q6 What is the minimum price of a product ordered in each city? (Sort by city A–Z)
SELECT city, MIN(price) AS min_price
FROM orders
GROUP BY city
ORDER BY city ASC;

-- Q7 What is the total quantity of items sold per category? (Sort by total_quantity DESC)
SELECT category, SUM(quantity) AS total_qty
FROM orders
GROUP BY category
ORDER BY total_qty DESC;

-- Q8 List each city along with the total number of items ordered (sum of quantity). (Sort by total_items DESC)
SELECT city, SUM(quantity) AS total_items
FROM orders
GROUP BY city
ORDER BY total_items DESC, city ASC;

-- Q9 Find cities that have more than 3 orders. Show city and order count. (Sort by order_count DESC)
SELECT city, COUNT(*) AS order_count
FROM orders
GROUP BY city
HAVING COUNT(*) > 3
ORDER BY order_count DESC;

-- Q10 Find categories where the total revenue (price × quantity) is more than 50000. (Sort by total_revenue DESC)
SELECT category, SUM(price * quantity) AS total_revenue
FROM orders
GROUP BY category
HAVING SUM(price * quantity) > 50000
ORDER BY total_revenue DESC;

-- Q11 Which cities have an average order price greater than 10000? Show city and avg_price. (Sort by avg_price DESC)
SELECT city, ROUND(AVG(price), 2) AS avg_price
FROM orders
GROUP BY city
HAVING AVG(price) > 10000
ORDER BY avg_price DESC;

-- Q12 Find the total revenue per city, but only include orders from the 'Electronics' category.
-- (Sort by total_revenue DESC)
SELECT city, SUM(price * quantity) AS total_revenue
FROM orders
WHERE category = 'Electronics'
GROUP BY city
ORDER BY total_revenue DESC;

-- Q13 Find categories where the total quantity sold is greater than 8. (Sort by total_qty DESC)
SELECT category, SUM(quantity) AS total_qty
FROM orders
GROUP BY category
HAVING SUM(quantity) > 8
ORDER BY total_qty DESC;

-- Q14 Find the number of distinct cities from which each category received orders. (Sort by category A–Z)
SELECT category, COUNT(DISTINCT city) AS city_count
FROM orders
GROUP BY category
ORDER BY category ASC;

-- Q15 List cities where the minimum order price is less than 2000. Show city and min_price. (Sort by min_price ASC)
SELECT city, MIN(price) AS min_price
FROM orders
GROUP BY city
HAVING MIN(price) < 2000
ORDER BY min_price ASC;

-- Q16 Find each city's total revenue (price × quantity). Show only cities where total revenue
-- is between 30000 and 100000. (Sort by total_revenue DESC)
SELECT city, SUM(price * quantity) AS total_revenue
FROM orders
GROUP BY city
HAVING SUM(price * quantity) BETWEEN 30000 AND 100000
ORDER BY total_revenue DESC;

-- Q17 For each combination of city and category, find the total revenue. Show only
-- combinations where total revenue > 20000. (Sort by total_revenue DESC)
SELECT city, category, SUM(price * quantity) AS total_revenue
FROM orders
GROUP BY city, category
HAVING SUM(price * quantity) > 20000
ORDER BY total_revenue DESC;