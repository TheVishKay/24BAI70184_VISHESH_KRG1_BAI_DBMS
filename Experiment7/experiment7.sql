DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

--------------------------------------------------
-- Step 2: Insert Data
--------------------------------------------------
INSERT INTO Department VALUES (1, 'HR');
INSERT INTO Department VALUES (2, 'IT');
INSERT INTO Department VALUES (3, 'Finance');

INSERT INTO Employee VALUES (1, 'Aman', 25000, 1);
INSERT INTO Employee VALUES (2, 'Riya', 32000, 2);
INSERT INTO Employee VALUES (3, 'Karan', 45000, 2);
INSERT INTO Employee VALUES (4, 'Neha', 27000, 3);

--------------------------------------------------
-- Step 3: Simple View
--------------------------------------------------
CREATE VIEW simple_view AS
SELECT emp_id, emp_name, salary
FROM Employee;

--------------------------------------------------
-- Step 4: Complex View (JOIN + Aggregation)
--------------------------------------------------
CREATE VIEW complex_view AS
SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees,
       AVG(e.salary) AS avg_salary
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

--------------------------------------------------
-- Step 5: Materialized View
--------------------------------------------------
CREATE MATERIALIZED VIEW materialized_view AS
SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees,
       AVG(e.salary) AS avg_salary
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

--------------------------------------------------
-- Step 6: Query Execution
--------------------------------------------------
-- Simple View
SELECT * FROM simple_view;

-- Complex View
SELECT * FROM complex_view;

-- Materialized View
SELECT * FROM materialized_view;

--------------------------------------------------
-- Step 7: Performance Analysis
--------------------------------------------------
EXPLAIN ANALYZE SELECT * FROM simple_view;
EXPLAIN ANALYZE SELECT * FROM complex_view;
EXPLAIN ANALYZE SELECT * FROM materialized_view;

--------------------------------------------------
-- Step 8: Refresh Materialized View
--------------------------------------------------
REFRESH MATERIALIZED VIEW materialized_view;