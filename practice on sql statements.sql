create database example3;

use example3;
 
CREATE TABLE drivers (
  driver_id   INT PRIMARY KEY,
  driver_name VARCHAR(50) NOT NULL,
  base_area   VARCHAR(50) NOT NULL
);

-- Create table: trips  (DATE column included)
CREATE TABLE trips (
  trip_id      INT PRIMARY KEY,
  driver_id    INT NOT NULL,
  trip_date    DATE NOT NULL,
  distance_km  DECIMAL(5,1) NOT NULL,
  fare         INT NOT NULL,
  rating       DECIMAL(3,1) NOT NULL,
  CONSTRAINT fk_trips_driver
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- Insert data: drivers (4 rows)

INSERT INTO drivers (driver_id, driver_name, base_area) VALUES
(1, 'Asha',  'Indiranagar'),
(2, 'Ravi',  'Koramangala'),
(3, 'Meera', 'Whitefield'),
(4, 'Kabir', 'HSR Layout');

-- Insert data: trips (10 rows)

INSERT INTO trips (trip_id, driver_id, trip_date, distance_km, fare, rating) VALUES
(101, 1, '2025-11-01', 12.0, 350, 4.8),
(102, 1, '2025-11-02',  5.5, 180, 4.6),
(103, 2, '2025-11-01',  8.0, 260, 4.9),
(104, 2, '2025-11-03', 15.0, 500, 4.7),
(105, 3, '2025-11-02',  3.0, 120, 4.2),
(106, 3, '2025-11-04', 22.0, 780, 4.9),
(107, 4, '2025-11-01',  6.0, 210, 4.5),
(108, 4, '2025-11-03',  9.0, 300, 4.4),
(109, 4, '2025-11-04',  4.0, 150, 4.8),
(110, 1, '2025-11-04', 18.0, 620, 4.9);

SELECT * FROM drivers ORDER BY driver_id;
SELECT * FROM trips ORDER BY trip_id;

-- 1. For each trip_date, show number of trips, total fare, and average rating.
SELECT 
  trip_date,
  COUNT(*) AS total_trips,
  SUM(fare) AS total_fare,
  ROUND(AVG(rating), 2) AS avg_rating
FROM trips
GROUP BY trip_date
ORDER BY trip_date;

-- 2. By base_area, show total trips, total fare, and average distance.
SELECT 
  d.base_area,
  COUNT(t.trip_id) AS total_trips,
  SUM(t.fare) AS total_fare,
  ROUND(AVG(t.distance_km), 2) AS avg_distance
FROM drivers d
JOIN trips t ON d.driver_id = t.driver_id
GROUP BY d.base_area;

-- 3. Rating buckets count (>=4.8 as “High”, else “Other”)
SELECT 
  CASE 
    WHEN rating >= 4.8 THEN 'High'
    ELSE 'Other'
  END AS rating_bucket,
  COUNT(*) AS trip_count
FROM trips
GROUP BY rating_bucket;

-- 4. Days where total fare >= 800 (GROUP BY + HAVING)
SELECT 
  trip_date,
  SUM(fare) AS total_fare
FROM trips
GROUP BY trip_date
HAVING SUM(fare) >= 800;

-- 5. Base-area average rating, only areas with avg rating >= 4.7 (HAVING)
SELECT 
  d.base_area,
  ROUND(AVG(t.rating), 2) AS avg_rating
FROM drivers d
JOIN trips t ON d.driver_id = t.driver_id
GROUP BY d.base_area
HAVING AVG(t.rating) >= 4.7;

-- 6. Trips with fare greater than the overall average fare (single-row subquery)
SELECT *
FROM trips
WHERE fare > (
  SELECT AVG(fare) FROM trips
);

-- 7. Drivers who have at least one trip rated 4.9 (multi-row IN subquery)
SELECT *
FROM drivers
WHERE driver_id IN (
  SELECT DISTINCT driver_id
  FROM trips
  WHERE rating = 4.9
);

-- 8. Drivers whose total fare is greater than the average total fare per driver
-- Hint: (subquery on aggregated derived table) Hard level
SELECT driver_id, SUM(fare) AS total_fare
FROM trips
GROUP BY driver_id
HAVING SUM(fare) >
(
  SELECT AVG(total_fare)
  FROM (
    SELECT SUM(fare) AS total_fare
    FROM trips
    GROUP BY driver_id
  ) AS driver_totals
);

-- 9. Latest trip per driver
SELECT *
FROM (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY driver_id 
           ORDER BY trip_date DESC, trip_id DESC
         ) AS rn
  FROM trips
) x
WHERE rn = 1;

-- 10. Row number of trips per driver ordered by date (then trip_id)
SELECT *,
       ROW_NUMBER() OVER (
         PARTITION BY driver_id
         ORDER BY trip_date, trip_id
       ) AS row_num
FROM trips;

-- 11. Running total fare per driver over time
SELECT *,
       SUM(fare) OVER (
         PARTITION BY driver_id
         ORDER BY trip_date, trip_id
       ) AS running_total_fare
FROM trips;

-- 12. Rank trips by fare within each driver (highest fare rank 1)
SELECT *,
       RANK() OVER (
         PARTITION BY driver_id
         ORDER BY fare DESC
       ) AS fare_rank
FROM trips;

-- 13. Show each trip’s fare minus the driver’s average fare (window AVG)
SELECT *,
       fare - AVG(fare) OVER (PARTITION BY driver_id) 
       AS fare_diff_from_avg
FROM trips;

-- 14. For each driver, show the previous trip’s fare (LAG) ordered by date
SELECT *,
       LAG(fare) OVER (
         PARTITION BY driver_id
         ORDER BY trip_date, trip_id
       ) AS previous_fare
FROM trips;