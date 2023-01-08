TRUNCATE TABLE stock, orders RESTART IDENTITY;

INSERT INTO stock (name, unit_price, quantity) VALUES ('Bucket O Beans', 10, 5);
INSERT INTO stock (name, unit_price, quantity) VALUES ('Plain Tees', 25, 50);

INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Ryan McHugh', '6 Jan 2023', 2);
INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Robby Dobby', '3 Jan 2023', 2);