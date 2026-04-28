-- create table
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_name VARCHAR(50),
  order_date DATE
);

-- insert sample data
INSERT INTO orders (customer_name, order_date) VALUES
('Aman', '2024-01-01'),
('Riya', '2024-02-01');

-- create trigger function
CREATE FUNCTION prevent_order_date_update()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.order_date <> OLD.order_date THEN
    RAISE EXCEPTION 'Modification of order_date is not allowed';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- create trigger
CREATE TRIGGER trg_no_order_date_update
BEFORE UPDATE ON orders
FOR EACH ROW
EXECUTE FUNCTION prevent_order_date_update();

-- test (this will FAIL)
UPDATE orders
SET order_date = '2025-01-01'
WHERE order_id = 1;

-- valid update (this will work)
UPDATE orders
SET customer_name = 'Rahul'
WHERE order_id = 1;

-- view data
SELECT * FROM orders;