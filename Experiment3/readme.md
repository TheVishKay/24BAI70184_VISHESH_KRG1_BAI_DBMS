🧪 Experiment 3 – PL/SQL Block Structure

📌 Aim

To understand the basic structure of a PL/SQL program by creating and executing a simple PL/SQL block that includes declaration and execution sections, performs calculations, and uses conditional statements to make decisions.

🎯 Objectives

To create a simple PL/SQL program demonstrating Declaration Section and Execution Section.
To understand the use of conditional statements (IF–ELSE) in PL/SQL for decision-making operations.
To perform salary-based calculations inside a PL/SQL block.

⚙ Software Requirement:-

Oracle FreeSQL

🧩 Practical / Experiment Steps

A PL/SQL block is created using the DECLARE keyword.
Variables for employee details such as ID, name, and basic salary are declared.
House Rent Allowance (HRA) is calculated as 40% of the basic salary.
An IF–ELSE condition is used to determine tax applicability.
All outputs are displayed using DBMS_OUTPUT.PUT_LINE.

🛠 Procedure

Start the Oracle FreeSQL environment.
Declare required variables in the DECLARE section.
Assign values to the declared variables.
Write execution logic inside the BEGIN block.
Calculate HRA using an arithmetic expression.
Display employee details and HRA.
Apply IF–ELSE condition to check tax applicability.
Display the tax status.
End the PL/SQL block using END; and execute the program.
Verify the output.

💻 Code

    DECLARE
    EMP_ID NUMBER := 719;
    EMP_NAME VARCHAR2(25) := 'Vishesh';
    BASIC_SALARY NUMBER := 148000;
    HRA_AMOUNT NUMBER;

    BEGIN
    HRA_AMOUNT := BASIC_SALARY \* 0.40;

    DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID: ' || EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME: ' || EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('BASIC SALARY: RS. ' || BASIC_SALARY);
    DBMS_OUTPUT.PUT_LINE('HOUSE RENT ALLOWANCE: RS. ' || HRA_AMOUNT);

    IF BASIC_SALARY > 60000 THEN
        DBMS_OUTPUT.PUT_LINE('TAX APPLICABLE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('TAX NOT APPLICABLE');
    END IF;

    END;

Output
![alt text](<Screenshot 2026-02-05 at 11.56.11 AM.png>)

📚 Learning Outcomes

Understood the structure of a PL/SQL block (Declaration & Execution sections).
Learned to declare and initialize variables in PL/SQL.
Performed arithmetic calculations inside a block.
Implemented IF–ELSE conditional logic.
Used DBMS_OUTPUT.PUT_LINE to display results.
