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