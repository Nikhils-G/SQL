--- 1. Auto-Increment (Primary Key)

use school;
create  table user(
  id int auto_increment primary key,
  name varchar(50)
);

insert into user(name) values
("NIkhil"),
("Tina"),
("Tina2"),
("Tina3");

select * from user;


--- 2. Case Sensitivity

CREATE TABLE MyTable (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO MyTable (id, name) VALUES (1, 'Alice'), (2, 'Bob');

SELECT * FROM MyTable; -- Works (case-insensitive)

CREATE TABLE products (
    id INT PRIMARY KEY,
    details JSON
);

INSERT INTO products (id, details) 
VALUES (1, '{"name": "Laptop", "price": 1200}');

select * from products;





-- Create table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer JSON,
    items JSON
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
WHERE JSON_EXTRACT(customer, '$.name') = 'John Doe';

SELECT * FROM orders 
WHERE JSON_CONTAINS(items, '{"name": "Laptop"}');

SELECT order_id, 
       SUM(JSON_EXTRACT(items, '$[*].quantity') * JSON_EXTRACT(items, '$[*].price')) AS total_cost
FROM orders
GROUP BY order_id;

-- Update JSON data
UPDATE orders 
SET customer = JSON_SET(customer, '$.email', 'john.doe@example.com')
WHERE order_id = 1;




