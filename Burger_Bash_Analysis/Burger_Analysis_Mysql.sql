USE burger_db;
SELECT * FROM  burger_names;
SELECT * FROM  burger_runner;
SELECT * FROM  runner_orders;
SELECT * FROM customr_orders;

-- 1. How many burgers were ordered?
SELECT COUNT(burger_id) AS Burgers_ordered FROM customr_orders;

-- 2. How many unique customer orders were made?
SELECT COUNT(DISTINCT customer_id) AS Unique_customer_orders 
FROM customr_orders;

SELECT COUNT(DISTINCT order_id) AS Unique_customer_orders_1
FROM customr_orders;

-- 3. How many successful orders were delivered by each runner?
SELECT runner_id, COUNT(order_id) AS successful_orders
FROM runner_orders
WHERE cancellation IS NULL
GROUP BY runner_id;

-- 4. How many of each type of burgers were delivered?
SELECT COUNT(co.burger_id) AS Count_of_burgers, bn.burger_name
FROM runner_orders ro
JOIN customr_orders co ON ro.order_id = co.order_id
JOIN burger_names bn ON co.burger_id = bn.burger_id
GROUP BY bn.burger_name;

-- 5. How many Vegetarian and Meatlovers were ordered by each customer?
SELECT COUNT(co.burger_id) AS Count_of_burgers, bn.burger_name, co.customer_id
FROM runner_orders ro
JOIN customr_orders co ON ro.order_id = co.order_id
JOIN burger_names bn ON co.burger_id = bn.burger_id
GROUP BY co.customer_id, bn.burger_name;

-- 6. What was the maximum number of burgers delivered in a single order?
SELECT COUNT(co.burger_id) AS Max_burgers, ro.order_id
FROM runner_orders ro
JOIN customr_orders co ON ro.order_id = co.order_id
WHERE ro.cancellation IS NULL
GROUP BY ro.order_id
ORDER BY Max_burgers DESC
LIMIT 1;

-- 7. For each customer, how many delivered burgers had at least 1 change and how many had no changes?
SELECT co.customer_id,
SUM(CASE when co.exclusions IS NULL or co.extras IS NULL then 1 else 0 end) as
with_no_changes,
SUM(CASE when co.exclusions IS NOT NULL or co.extras IS NOT NULL then 1 else 0 end) as
with_changes
FROM customr_orders co
JOIN runner_orders ro ON co.order_id = ro.order_id
WHERE ro.cancellation IS NULL
GROUP BY co.customer_id;

-- 8. What was the total volume of burgers ordered for each hour of the day?
SELECT COUNT(order_id) AS  total_volume , hour(order_time) AS each_hour 
FROM customr_orders
GROUP BY each_hour;

-- 9.  How many runners signed up for each 1 week period? 
SELECT COUNT(runner_id) AS  signed_up_runners , week(registration_date) AS each_one_week 
FROM burger_runner
GROUP BY each_one_week;
SELECT * FROM  burger_runner;

-- 10. What was the average distance travelled for each customer?
SELECT co.customer_id, ROUND (AVG(ro.distance),2) AS Avg_distance
FROM runner_orders ro
JOIN customr_orders co ON ro.order_id = co.order_id
WHERE ro.cancellation IS NULL
GROUP BY co.customer_id
ORDER BY 1;