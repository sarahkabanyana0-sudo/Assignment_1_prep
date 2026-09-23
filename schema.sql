-- PLSQL Assignment One - Sunrise Supermarket
-- Name: Kabanyana Sarah | Student ID: 20251SEN237
-- schema.sql : drops (if they exist) and recreates the four tables


-- Drop in child-to-parent order, ignoring "table does not exist" errors
-- so this script can be re-run safely from scratch.
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE order_items PURGE';
EXCEPTION WHEN OTHERS THEN
   IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE orders PURGE';
EXCEPTION WHEN OTHERS THEN
   IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE products PURGE';
EXCEPTION WHEN OTHERS THEN
   IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE customers PURGE';
EXCEPTION WHEN OTHERS THEN
   IF SQLCODE != -942 THEN RAISE; END IF;
END;
/


-- Parent tables first

CREATE TABLE customers (
  customer_id   NUMBER        CONSTRAINT pk_customers PRIMARY KEY,
  customer_name VARCHAR2(100) CONSTRAINT nn_customers_name NOT NULL,
  email         VARCHAR2(100),
  city          VARCHAR2(50)
);

CREATE TABLE products (
  product_id   NUMBER        CONSTRAINT pk_products PRIMARY KEY,
  product_name VARCHAR2(100) CONSTRAINT nn_products_name NOT NULL,
  category     VARCHAR2(50),
  price        NUMBER(10,2)  CONSTRAINT nn_products_price NOT NULL
                             CONSTRAINT ck_products_price CHECK (price >= 0)
);


-- Child tables

CREATE TABLE orders (
  order_id    NUMBER CONSTRAINT pk_orders PRIMARY KEY,
  customer_id NUMBER CONSTRAINT nn_orders_customer NOT NULL
                     CONSTRAINT fk_orders_customer REFERENCES customers(customer_id),
  order_date  DATE   CONSTRAINT nn_orders_date NOT NULL
);

CREATE TABLE order_items (
  order_item_id NUMBER CONSTRAINT pk_order_items PRIMARY KEY,
  order_id      NUMBER CONSTRAINT nn_items_order NOT NULL
                       CONSTRAINT fk_items_order REFERENCES orders(order_id),
  product_id    NUMBER CONSTRAINT nn_items_product NOT NULL
                       CONSTRAINT fk_items_product REFERENCES products(product_id),
  quantity      NUMBER CONSTRAINT nn_items_qty NOT NULL
                       CONSTRAINT ck_items_qty CHECK (quantity > 0)
);


-- Indexes on foreign keys (speeds up the JOINs in queries.sql)

CREATE INDEX idx_orders_customer  ON orders(customer_id);
CREATE INDEX idx_items_order      ON order_items(order_id);
CREATE INDEX idx_items_product    ON order_items(product_id);
