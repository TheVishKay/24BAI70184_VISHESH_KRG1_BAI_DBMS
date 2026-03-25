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