-- PLSQL Assignment One - Sunrise Supermarket
-- Name: Kabanyana Sarah | Student ID: 20251SEN237
-- seed_data.sql : sample rows for all four tables
-- 6 customers (1 with zero orders), 8 products across 4 categories,
-- 15 orders, 25 order items, spanning Jan-Mar 2026.


-- CUSTOMERS (6 total - Nkurunziza deliberately has zero orders)

INSERT INTO customers (customer_id, customer_name, email, city) VALUES (1, 'Aline Uwase',             'aline.uwase@example.com',      'Kigali');
INSERT INTO customers (customer_id, customer_name, email, city) VALUES (2, 'Eric Habimana',           'eric.habimana@example.com',    'Musanze');
INSERT INTO customers (customer_id, customer_name, email, city) VALUES (3, 'Divine Mukamana',         'divine.mukamana@example.com',  'Huye');
INSERT INTO customers (customer_id, customer_name, email, city) VALUES (4, 'Patrick Niyibizi',        'patrick.niyibizi@example.com', 'Rubavu');
INSERT INTO customers (customer_id, customer_name, email, city) VALUES (5, 'Sandrine Umutoni',        'sandrine.umutoni@example.com', 'Muhanga');
INSERT INTO customers (customer_id, customer_name, email, city) VALUES (6, 'Jean de Dieu Nkurunziza', 'jean.nkurunziza@example.com',  'Nyagatare');


-- PRODUCTS (8 total, 4 categories: Beverages, Snacks, Dairy, Bakery)

INSERT INTO products (product_id, product_name, category, price) VALUES (1, 'Bottled Water 500ml', 'Beverages', 0.80);
INSERT INTO products (product_id, product_name, category, price) VALUES (2, 'Soda Can 330ml',      'Beverages', 1.20);
INSERT INTO products (product_id, product_name, category, price) VALUES (3, 'Potato Chips 150g',   'Snacks',    2.50);
INSERT INTO products (product_id, product_name, category, price) VALUES (4, 'Chocolate Bar 100g',  'Snacks',    1.80);
INSERT INTO products (product_id, product_name, category, price) VALUES (5, 'Milk 1L',             'Dairy',     1.50);
INSERT INTO products (product_id, product_name, category, price) VALUES (6, 'Yogurt Cup 150g',     'Dairy',     1.00);
INSERT INTO products (product_id, product_name, category, price) VALUES (7, 'White Bread Loaf',    'Bakery',    2.00);
INSERT INTO products (product_id, product_name, category, price) VALUES (8, 'Croissant',           'Bakery',    1.60);


-- ORDERS (15 total across Jan-Mar 2026)

INSERT INTO orders (order_id, customer_id, order_date) VALUES (1,  1, TO_DATE('2026-01-05', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (2,  2, TO_DATE('2026-01-07', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (3,  1, TO_DATE('2026-01-10', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (4,  3, TO_DATE('2026-01-14', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (5,  4, TO_DATE('2026-01-17', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (6,  2, TO_DATE('2026-01-22', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (7,  5, TO_DATE('2026-01-26', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (8,  1, TO_DATE('2026-02-02', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (9,  3, TO_DATE('2026-02-09', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (10, 4, TO_DATE('2026-02-13', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (11, 2, TO_DATE('2026-02-19', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (12, 5, TO_DATE('2026-02-24', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (13, 1, TO_DATE('2026-03-01', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (14, 3, TO_DATE('2026-03-07', 'YYYY-MM-DD'));
INSERT INTO orders (order_id, customer_id, order_date) VALUES (15, 4, TO_DATE('2026-03-14', 'YYYY-MM-DD'));


-- ORDER_ITEMS (25 rows total)

INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (1,  1,  1, 3);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (2,  1,  3, 1);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (3,  2,  5, 2);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (4,  3,  2, 4);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (5,  3,  7, 1);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (6,  4,  4, 2);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (7,  4,  6, 3);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (8,  5,  8, 2);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (9,  6,  1, 5);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (10, 6,  3, 2);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (11, 7,  5, 1);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (12, 8,  2, 2);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (13, 8,  4, 1);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (14, 9,  6, 2);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (15, 9,  7, 2);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (16, 10, 8, 3);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (17, 11, 1, 2);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (18, 11, 5, 3);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (19, 12, 3, 1);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (20, 13, 7, 1);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (21, 13, 2, 3);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (22, 14, 4, 2);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (23, 14, 6, 1);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (24, 15, 8, 2);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (25, 15, 1, 4);


COMMIT;


-- Quick check: expected counts are 6, 8, 15, 25

SELECT (SELECT COUNT(*) FROM customers)   AS customers,
       (SELECT COUNT(*) FROM products)    AS products,
       (SELECT COUNT(*) FROM orders)      AS orders,
       (SELECT COUNT(*) FROM order_items) AS order_items
FROM dual;
