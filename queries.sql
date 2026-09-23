
-- PLSQL Assignment One - Sunrise Supermarket
# Name: Kabanyana Sarah | Student ID: 20251SEN237
-- queries.sql : all 8 required queries (3 JOINs, 1 CTE, 4 window fns)



SET LINESIZE 150
SET PAGESIZE 100
COLUMN customer_name FORMAT A20
COLUMN product_name FORMAT A20
COLUMN category FORMAT A12
COLUMN city FORMAT A10


-- JOIN 1: every order with customer name, city, order date
-
SELECT o.order_id, c.customer_name, c.city, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date;


-- JOIN 2: every order item with product name, category, price, qty

SELECT oi.order_item_id, oi.order_id, p.product_name, p.category,
       p.price, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
ORDER BY oi.order_id, oi.order_item_id;


-- JOIN 3: all customers and their orders, including customers
-- with no orders at all

SELECT c.customer_id, c.customer_name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
ORDER BY c.customer_id, o.order_date;


-- CTE: each customer's total spend, then only those above average

WITH customer_totals AS (
    SELECT c.customer_id, c.customer_name,
           COALESCE(SUM(oi.quantity * p.price), 0) AS total_spend
    FROM customers c
    LEFT JOIN orders o ON o.customer_id = c.customer_id
    LEFT JOIN order_items oi ON oi.order_id = o.order_id
    LEFT JOIN products p ON p.product_id = oi.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id, customer_name, total_spend
FROM customer_totals
WHERE total_spend > (SELECT AVG(total_spend) FROM customer_totals)
ORDER BY total_spend DESC;


-- WINDOW 1: rank customers by total spend, highest first

WITH customer_totals AS (
    SELECT c.customer_id, c.customer_name,
           COALESCE(SUM(oi.quantity * p.price), 0) AS total_spend
    FROM customers c
    LEFT JOIN orders o ON o.customer_id = c.customer_id
    LEFT JOIN order_items oi ON oi.order_id = o.order_id
    LEFT JOIN products p ON p.product_id = oi.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id, customer_name, total_spend,
       RANK() OVER (ORDER BY total_spend DESC) AS spend_rank
FROM customer_totals
ORDER BY spend_rank;


-- WINDOW 2: number each customer's orders in the order placed

SELECT o.customer_id, c.customer_name, o.order_id, o.order_date,
       ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS order_seq
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
ORDER BY o.customer_id, o.order_date;


-- WINDOW 3: running total of revenue over time, ordered by date

WITH order_revenue AS (
    SELECT o.order_id, o.order_date,
           COALESCE(SUM(oi.quantity * p.price), 0) AS order_revenue
    FROM orders o
    LEFT JOIN order_items oi ON oi.order_id = o.order_id
    LEFT JOIN products p ON p.product_id = oi.product_id
    GROUP BY o.order_id, o.order_date
)
SELECT order_id, order_date, order_revenue,
       SUM(order_revenue) OVER (ORDER BY order_date, order_id) AS running_total_revenue
FROM order_revenue
ORDER BY order_date, order_id;


-- WINDOW 4: days between current and previous order, for
-- customers with more than one order

WITH order_gaps AS (
    SELECT o.customer_id, c.customer_name, o.order_id, o.order_date,
           LAG(o.order_date) OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS previous_order_date,
           COUNT(*) OVER (PARTITION BY o.customer_id) AS orders_for_customer
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
)
SELECT customer_id, customer_name, order_id, order_date, previous_order_date,
       (order_date - previous_order_date) AS days_since_previous_order
FROM order_gaps
WHERE orders_for_customer > 1
ORDER BY customer_id, order_date;
