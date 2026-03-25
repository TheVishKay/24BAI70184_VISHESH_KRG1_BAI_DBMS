# 🧪 Experiment 6 – Understanding and Implementing Cursors for Row-by-Row Data Processing

## 📌 Aim

To understand the concept and working of cursors in PL/SQL for row-by-row data processing, and to analyze how implicit cursors, explicit cursors, and cursor attributes are used to implement business logic on multiple rows in a database table.

---

## 🎯 Objectives

- To understand the role of cursors in PL/SQL.
- To differentiate between **implicit and explicit cursors**.
- To use cursor attributes like **%FOUND, %NOTFOUND, %ROWCOUNT, and %ISOPEN**.
- To process multiple rows using cursor-based logic.
- To apply business logic on database records.

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

This experiment demonstrates how cursors are used in PL/SQL to process multiple rows returned by a query.

- **Implicit cursors** are automatically created by Oracle for single-row operations.
- **Explicit cursors** are user-defined and used to handle multiple rows.
- Cursor attributes help in controlling the execution flow and checking the status of data processing.

---

## 🛠 Procedure

1. Open Oracle SQL Developer or pgAdmin.
2. Create an **Employee table**.
3. Insert sample data into the table.
4. Write PL/SQL programs using:
   - Implicit cursor
   - Explicit cursor
   - Cursor attributes
5. Execute the PL/SQL blocks.
6. Observe and verify the output.

---

## 💻 Code

```sql
SET SERVEROUTPUT ON;

-- Step 1: Create Table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT
);

-- Step 2: Insert Data
INSERT INTO Employee VALUES (1, 'Aman', 25000);
INSERT INTO Employee VALUES (2, 'Riya', 32000);
INSERT INTO Employee VALUES (3, 'Karan', 45000);
INSERT INTO Employee VALUES (4, 'Neha', 27000);

--------------------------------------------------
-- Program 1: Implicit Cursor Example
--------------------------------------------------
BEGIN
    UPDATE Employee
    SET salary = salary + 1000
    WHERE emp_id = 1;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Record Updated Successfully');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Rows Affected: ' || SQL%ROWCOUNT);
END;
/

--------------------------------------------------
-- Program 2: Explicit Cursor Example
--------------------------------------------------
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id, emp_name, salary FROM Employee;

    v_id Employee.emp_id%TYPE;
    v_name Employee.emp_name%TYPE;
    v_salary Employee.salary%TYPE;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_id, v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id ||
                             ', Name: ' || v_name ||
                             ', Salary: ' || v_salary);
    END LOOP;

    CLOSE emp_cursor;
END;
/

--------------------------------------------------
-- Program 3: Cursor Attributes Example
--------------------------------------------------
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id, emp_name FROM Employee;

    v_id Employee.emp_id%TYPE;
    v_name Employee.emp_name%TYPE;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_id, v_name;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Processing Employee: ' || v_name);
        DBMS_OUTPUT.PUT_LINE('Rows Processed: ' || emp_cursor%ROWCOUNT);
    END LOOP;

    IF emp_cursor%ISOPEN THEN
        CLOSE emp_cursor;
    END IF;
END;
/

## OUTPUT:
![alt text](<Screenshot 2026-03-25 at 10.03.26 AM.png>)