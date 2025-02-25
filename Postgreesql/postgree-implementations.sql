--- 1. Auto-Increment (Primary Key)

create table t1(
  id serial primary key,
  name varchar(50)
);

insert into t1(name) values
('tina'),('nikhil'),('tina');


select * from "t1";



2. Case Sensitivity

CREATE TABLE "MyTable" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO "MyTable" (id, name) VALUES (1, 'Alice'), (2, 'Bob');

SELECT * FROM "MyTable"; 
SELECT * FROM MyTable;   -- Error: table "mytable" does not exist



-- 3.JSON (javascipt Object Notation)

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    details JSONB
);

INSERT INTO products (id, details) 
VALUES (1, '{"name": "Laptop", "price": 1200}');

SELECT * FROM products WHERE details @> '{"name": "Laptop"}';


-- another example 


-- Create table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer JSONB,
    items JSONB
);

-- Insert data
INSERT INTO orders (order_id, customer, items) 
VALUES 
(1, '{"name": "John Doe", "email": "john@example.com", "address": "123 Main St"}', 
 '[{"name": "Laptop", "quantity": 1, "price": 1200}, {"name": "Mouse", "quantity": 2, "price": 25}]'),

(2, '{"name": "Jane Smith", "email": "jane@example.com", "address": "456 Elm St"}', 
 '[{"name": "Phone", "quantity": 1, "price": 800}, {"name": "Charger", "quantity": 1, "price": 20}]');

-- Query JSON data
SELECT * FROM orders 
WHERE customer @> '{"name": "John Doe"}';

SELECT * FROM orders 
WHERE items @> '[{"name": "Laptop"}]';

SELECT order_id, 
       SUM((item->>'quantity')::int * (item->>'price')::numeric) AS total_cost
FROM orders, jsonb_array_elements(items) AS item
GROUP BY order_id;

-- Update JSON data
UPDATE orders 
SET customer = jsonb_set(customer, '{email}', '"john.doe@example.com"')
WHERE order_id = 1;


select * from orders;


create table market(
 id serial primary key,
 customer json,
 invest json
);


INSERT INTO market (customer, invest) VALUES
('{"name": "Nikhil"}', '{"invested": 9000}'),
('{"name": "Tina"}', '{"invested": 8000}'),
('{"name": "Nikt"}', '{"invested": 1000}');

select * from market where @> '{"name": "Nikhil"}';



