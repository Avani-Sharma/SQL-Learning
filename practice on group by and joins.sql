create database example2;

use example2;

-- Create table: events
CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- Create table: ticket_sales
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Insert data: events
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

-- Insert data: ticket_sales
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);

SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;

-- Find the total quantity sold per event_id. 
SELECT event_id, SUM(qty) AS total_qty
FROM ticket_sales
GROUP BY event_id; 

-- Find the total revenue per event_id. 
SELECT event_id,
       SUM(qty * price_per_ticket) AS total_revenue
FROM ticket_sales
GROUP BY event_id;

-- Find monthly total revenue (group by month of sale_date)
SELECT MONTH(sale_date) AS sale_month,
       SUM(qty * price_per_ticket) AS total_revenue
FROM ticket_sales
GROUP BY MONTH(sale_date);

-- Find the maximum price_per_ticket per event_id.
SELECT event_id,
       MAX(price_per_ticket) AS max_price
FROM ticket_sales
GROUP BY event_id;

-- Find total revenue per month and ticket_type. 
SELECT MONTH(sale_date) AS sale_month,
       ticket_type,
       SUM(qty * price_per_ticket) AS total_revenue
FROM ticket_sales
GROUP BY MONTH(sale_date), ticket_type;

-- List all sales with event_name and sale_date.
SELECT e.event_name, t.sale_date
FROM ticket_sales t
JOIN events e ON t.event_id = e.event_id;

-- Show event_name, ticket_type, qty for each sale.
SELECT e.event_name, t.ticket_type, t.qty
FROM ticket_sales t
JOIN events e ON t.event_id = e.event_id;

-- Show sales where the event city is Mumbai.
SELECT *
FROM ticket_sales t
JOIN events e ON t.event_id = e.event_id
WHERE e.city = 'Mumbai';

-- Show all events and matching sales
SELECT *
FROM events e
LEFT JOIN ticket_sales t
ON e.event_id = t.event_id;

-- Show distinct event names that have at least one sale. 
SELECT DISTINCT e.event_name
FROM events e
JOIN ticket_sales t ON e.event_id = t.event_id;

-- Show each sale’s computed revenue with event name.
SELECT e.event_name,
       t.sale_id,
       t.qty * t.price_per_ticket AS revenue
FROM ticket_sales t
JOIN events e ON t.event_id = e.event_id;

-- Find total quantity per event_name. 
SELECT e.event_name,
       SUM(t.qty) AS total_qty
FROM ticket_sales t
JOIN events e ON t.event_id = e.event_id
GROUP BY e.event_name;

-- Find total VIP revenue per event_name.
SELECT e.event_name,
       SUM(t.qty * t.price_per_ticket) AS vip_revenue
FROM ticket_sales t
JOIN events e ON t.event_id = e.event_id
WHERE t.ticket_type = 'VIP'
GROUP BY e.event_name;

-- Find monthly revenue per city.
SELECT MONTH(t.sale_date) AS sale_month,
       e.city,
       SUM(t.qty * t.price_per_ticket) AS total_revenue
FROM ticket_sales t
JOIN events e ON t.event_id = e.event_id
GROUP BY MONTH(t.sale_date), e.city;

-- Find total quantity per city and ticket_type.
SELECT e.city,
       t.ticket_type,
       SUM(t.qty) AS total_qty
FROM ticket_sales t
JOIN events e ON t.event_id = e.event_id
GROUP BY e.city, t.ticket_type;

-- Find sales that happened on the latest sale_date in the table. 
SELECT *
FROM ticket_sales
WHERE sale_date = (SELECT MAX(sale_date) FROM ticket_sales);

-- Find sales where revenue is greater than the overall average sale revenue. 
SELECT *,
       qty * price_per_ticket AS revenue
FROM ticket_sales
WHERE (qty * price_per_ticket) >
      (SELECT AVG(qty * price_per_ticket) FROM ticket_sales);

-- Find events that have at least one VIP sale. 
SELECT DISTINCT e.event_name
FROM events e
JOIN ticket_sales t ON e.event_id = t.event_id
WHERE t.ticket_type = 'VIP';

-- Find events in cities that have at least one VIP sale. 
-- Hint: subquery will use the joins
SELECT DISTINCT e.event_name
FROM events e
WHERE e.city IN (
    SELECT e2.city
    FROM events e2
    JOIN ticket_sales t2 ON e2.event_id = t2.event_id
    WHERE t2.ticket_type = 'VIP'
);

-- Find events that have at least one sale in February 2025.
SELECT DISTINCT e.event_name
FROM events e
JOIN ticket_sales t ON e.event_id = t.event_id
WHERE t.sale_date BETWEEN '2025-02-01' AND '2025-02-28';

-- For each event, return the highest price_per_ticket sale row. 
-- Hint: read the question twice
SELECT *
FROM ticket_sales t
WHERE price_per_ticket = (
    SELECT MAX(price_per_ticket)
    FROM ticket_sales
    WHERE event_id = t.event_id
);

-- Show monthly total revenue and monthly total quantity, but only include months
-- where total revenue is at least 10,000.
SELECT MONTH(sale_date) AS sale_month,
       SUM(qty * price_per_ticket) AS total_revenue,
       SUM(qty) AS total_qty
FROM ticket_sales
GROUP BY MONTH(sale_date)
HAVING SUM(qty * price_per_ticket) >= 10000;

-- Show month-wise count of sales rows, but only include months that have at least 3 sales rows.
SELECT MONTH(sale_date) AS sale_month,
       COUNT(*) AS sale_count
FROM ticket_sales
GROUP BY MONTH(sale_date)
HAVING COUNT(*) >= 3;

-- Show average revenue per sale row per month, but only include months where 
-- average sale revenue is above 4000. sale_month avg_sale_revenue
SELECT MONTH(sale_date) AS sale_month,
       AVG(qty * price_per_ticket) AS avg_sale_revenue
FROM ticket_sales
GROUP BY MONTH(sale_date)
HAVING AVG(qty * price_per_ticket) > 4000;

-- Show revenue per month and ticket_type, but only include groups where total
-- revenue is at least 5000. sale_month ticket_type total_revenue
SELECT MONTH(sale_date) AS sale_month,
       ticket_type,
       SUM(qty * price_per_ticket) AS total_revenue
FROM ticket_sales
GROUP BY MONTH(sale_date), ticket_type
HAVING SUM(qty * price_per_ticket) >= 5000;
