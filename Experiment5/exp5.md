# 🧪 Experiment 5 – SQL Conditional Logic (Odd & Even Values)

## 📌 Aim

To understand and apply conditional logic in SQL by using the **MOD (%) operator** to analyze numerical data and classify employee salaries as **odd or even**, thereby improving data analysis and decision-making skills in SQL.

---

## 🎯 Objectives

- To understand the use of the **MOD (%) operator** in SQL.
- To identify whether a number is **odd or even** using SQL queries.
- To apply conditional logic using **CASE statements**.
- To display employee salary data based on conditions.
- To improve data filtering and classification skills.

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

This experiment demonstrates the use of SQL conditional logic to classify employee salaries as **odd or even** using the **MOD (%) operator**.

By applying SQL queries, we analyze salary values and separate them based on their mathematical properties, which is useful in real-world data analysis.

---

## 🛠 Procedure

1. Open Oracle SQL Developer or pgAdmin.
2. Create an **Employee table**.
3. Insert sample data into the table.
4. Use the **MOD (%) operator** to check odd and even salaries.
5. Apply **CASE statements** for classification.
6. Execute queries and observe the output.

---

## 💻 Code

```sql
-- Step 1: Create Employee Table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Salary INT
);

-- Step 2: Insert Sample Data
INSERT INTO Employee VALUES (1, 'Aman', 25000);
INSERT INTO Employee VALUES (2, 'Riya', 32001);
INSERT INTO Employee VALUES (3, 'Karan', 45000);
INSERT INTO Employee VALUES (4, 'Neha', 27555);
INSERT INTO Employee VALUES (5, 'Arjun', 30000);

-- Step 3: Display All Records
SELECT * FROM Employee;

-- Program 1: Find Even Salaries
SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE MOD(Salary, 2) = 0;

-- Program 2: Find Odd Salaries
SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE MOD(Salary, 2) <> 0;

-- Program 3: Classify Salaries using CASE
SELECT Emp_ID, Emp_Name, Salary,
       CASE
           WHEN MOD(Salary, 2) = 0 THEN 'Even Salary'
           ELSE 'Odd Salary'
       END AS Salary_Type
FROM Employee;

-- Program 4: Count Odd and Even Salaries
SELECT
    COUNT(CASE WHEN MOD(Salary, 2) = 0 THEN 1 END) AS Even_Count,
    COUNT(CASE WHEN MOD(Salary, 2) <> 0 THEN 1 END) AS Odd_Count
FROM Employee;

## OUTPUT:
![alt text](<Screenshot 2026-03-25 at 9.44.21 AM.png>)
```
