# 🧪 Experiment 4 – Conditional Control Statements in PL/SQL

## 📌 Aim

To design and implement PL/SQL programs utilizing conditional control statements such as **IF–ELSE, IF–ELSIF–ELSE, ELSIF ladder, and CASE constructs** in order to control the flow of execution based on logical conditions and to analyze decision-making capabilities in PL/SQL blocks.

---

## 🎯 Objectives

- To understand the use of conditional control statements in PL/SQL.
- To implement IF–ELSE statements for basic decision making.
- To apply IF–ELSIF–ELSE and ELSIF ladder for multiple condition evaluation.
- To use CASE statements for structured conditional execution.
- To display output using `DBMS_OUTPUT.PUT_LINE`.

---

## ⚙ Software Requirement

- **Database Management System:** Oracle FreeSQL
- **Language:** PL/SQL

---

## 🧩 Practical / Experiment Description

This experiment demonstrates the use of conditional control statements in PL/SQL.  
Different decision-making constructs such as IF–ELSE, ELSIF ladder, and CASE statements are used to evaluate conditions and control program execution.

---

## 🛠 Procedure

1. Open the Oracle FreeSQL environment.
2. Enable output using `SET SERVEROUTPUT ON`.
3. Declare required variables in the DECLARE section.
4. Implement conditional logic using IF–ELSE, ELSIF ladder, and CASE statements.
5. Display the results using `DBMS_OUTPUT.PUT_LINE`.
6. Execute the PL/SQL block and observe the output.

---

## 💻 Code

```sql
SET SERVEROUTPUT ON;

-- Program 1: IF–ELSE Statement
DECLARE
    num NUMBER := -5;
BEGIN
    IF num > 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number is Positive');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number is Non-Positive');
    END IF;
END;
/

-- Program 2: IF–ELSIF–ELSE Statement
DECLARE
    marks NUMBER := 82;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: A');
    ELSIF marks >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: B');
    ELSIF marks >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: C');
    ELSIF marks >= 40 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: D');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Grade: F');
    END IF;
END;
/

-- Program 3: ELSIF Ladder
DECLARE
    marks NUMBER := 68;
BEGIN
    IF marks >= 85 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Excellent');
    ELSIF marks >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Very Good');
    ELSIF marks >= 55 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Good');
    ELSIF marks >= 40 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Average');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Performance: Poor');
    END IF;
END;
/

-- Program 4: CASE Statement
DECLARE
    day_num NUMBER := 3;
BEGIN
    CASE day_num
        WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('Monday');
        WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('Tuesday');
        WHEN 3 THEN DBMS_OUTPUT.PUT_LINE('Wednesday');
        WHEN 4 THEN DBMS_OUTPUT.PUT_LINE('Thursday');
        WHEN 5 THEN DBMS_OUTPUT.PUT_LINE('Friday');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('Saturday');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('Sunday');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid Day Number');
    END CASE;
END;
/

## OUTPUT:
 ![alt text](<Screenshot 2026-02-06 at 12.23.24 PM.png>)
 ![alt text](<Screenshot 2026-02-06 at 12.23.31 PM.png>)
 ![alt text](<Screenshot 2026-02-06 at 12.23.38 PM.png>)
 ![alt text](<Screenshot 2026-02-06 at 12.23.46 PM.png>)


```
