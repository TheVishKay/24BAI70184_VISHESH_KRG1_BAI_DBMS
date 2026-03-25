# 🧪 Experiment 7 – Design and Performance Analysis of Materialized Views

## 📌 Aim

To design and implement a materialized view and to compare and analyze execution time and performance differences between simple views, complex views, and materialized views, thereby understanding their impact on query optimization and system performance.

---

## 🎯 Objectives

- To understand the concept of **views and materialized views**.
- To create **simple views and complex views**.
- To implement **materialized views** for performance optimization.
- To compare execution time of different query approaches.
- To analyze the advantages of materialized views in real-world applications.

---

## ⚙ Software Requirement

- **Database Management System:**
  - Oracle Database Express Edition (Oracle XE)
  - PostgreSQL

- **Client Tools:**
  - Oracle SQL Developer
  - pgAdmin

---

## 🧩 Practical / Experiment Description

In large-scale systems, complex queries executed repeatedly can slow down performance.  
This experiment demonstrates how **simple views, complex views, and materialized views** work and how they affect execution time.

- **Simple View:** Based on a single table  
- **Complex View:** Uses joins and aggregations  
- **Materialized View:** Stores precomputed results for faster access  

---

## 🛠 Procedure

1. Open pgAdmin or Oracle SQL Developer.  
2. Create required tables (**Employee, Department**).  
3. Insert sample data.  
4. Create a **simple view**.  
5. Create a **complex view using JOIN and aggregation**.  
6. Create a **materialized view**.  
7. Execute queries on each view.  
8. Compare execution time using `EXPLAIN ANALYZE`.  
9. Observe and record performance differences.  

---

## 💻 Code

```sql
--------------------------------------------------
-- Step 1: Create Tables
--------------------------------------------------
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

## OUTPUT:
![alt text](<Screenshot 2026-03-25 at 10.08.41 AM.png>)
![alt text](<Screenshot 2026-03-25 at 10.09.11 AM.png>)
![alt text](<Screenshot 2026-03-25 at 10.09.38 AM.png>)