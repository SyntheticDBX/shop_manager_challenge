CREATE TABLE stock (
  id SERIAL PRIMARY KEY,
  name text,
  unit_price int,
  quantity int
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_name text,
  order_date text,
  item_id int,
  constraint fk_item foreign key(item_id)
    references stock(id)
    on delete cascade
);