-- create table
CREATE TABLE suppliers (
  supplier_id SERIAL PRIMARY KEY,
  city VARCHAR(50),
  product_category VARCHAR(50)
);

-- insert sample data
INSERT INTO suppliers (city, product_category) VALUES
('Delhi', 'Electronics'),
('Delhi', 'Clothing'),
('Mumbai', 'Electronics'),
('Mumbai', 'Furniture'),
('Delhi', 'Electronics'),   -- duplicate
('Chandigarh', 'Clothing');

-- query: distinct combinations
SELECT DISTINCT city, product_category
FROM suppliers;