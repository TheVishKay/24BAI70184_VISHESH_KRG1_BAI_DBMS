# Experiment: Trigger for Automatic Primary Key Generation

## AIM

To design a trigger that automatically implements the functionality of a primary key, ensuring unique identification of records without manual intervention.

---

## SOFTWARE REQUIREMENTS

### Database Management System:

- Oracle Database Express Edition (Oracle XE)
- PostgreSQL Database

### Database Administration Tool / Client Tool:

- Oracle SQL Developer (for Oracle XE)
- pgAdmin (for PostgreSQL)

---

## OBJECTIVE

- To create a database trigger that automatically enforces primary key constraints or generates unique key values.
- To replicate the functionality of a stored procedure using triggers.
- To demonstrate automated primary key functionality in a table.

---

## PROBLEM STATEMENT

In enterprise-level databases, every record must have a unique primary key. Manual assignment of keys can lead to duplication and errors.

Design a trigger that:

- Automatically generates or enforces a primary key value during record insertion.
- Implements logic similar to a stored procedure.
- Ensures every record has a unique identifier.

**Industry Relevance:** Amazon, Flipkart, Oracle

---

## THEORY

A **trigger** is a database object that executes automatically in response to specific events such as `INSERT`, `UPDATE`, or `DELETE`.

Primary key automation ensures:

- Data integrity
- Elimination of duplicate entries
- Reduced manual effort

Triggers can be combined with sequences (Oracle) or identity/serial mechanisms (PostgreSQL) to generate unique values.

---

## PROCEDURE / PRACTICAL STEPS

1. Identify the table requiring automatic primary key enforcement.
2. Create a sequence (for Oracle).
3. Design a `BEFORE INSERT` trigger.
4. Assign a unique value to the primary key column inside the trigger.
5. Insert multiple records to validate the trigger functionality.

---

## IMPLEMENTATION

### PostgreSQL Implementation

```sql
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE OR REPLACE FUNCTION auto_id_function()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id IS NULL THEN
        NEW.id := nextval('students_id_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER student_trigger
BEFORE INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION auto_id_function();
```

---

## TESTING

```sql
INSERT INTO students (name) VALUES ('Alice');
INSERT INTO students (name) VALUES ('Bob');
INSERT INTO students (name) VALUES ('Charlie');

SELECT * FROM students;
```

---

## OUTPUT

![alt text](<Screenshot 2026-04-24 at 11.45.25 AM.png>)
![alt text](<Screenshot 2026-04-24 at 11.45.48 AM.png>)
![alt text](<Screenshot 2026-04-24 at 11.46.28 AM.png>)

---

## RESULT

The trigger was successfully created and executed. Each inserted record was automatically assigned a unique primary key value without manual input. This confirms that the trigger effectively ensures uniqueness and maintains data integrity.

---

## LEARNING OUTCOME

After completing this experiment, the learner is able to:

- Understand the concept and working of database triggers
- Implement `BEFORE INSERT` triggers
- Automate primary key generation using sequences and triggers
- Ensure data integrity and uniqueness in database tables
- Apply trigger-based automation in real-world applications

---

## CONCLUSION

Triggers provide an efficient and reliable way to automate primary key generation. This eliminates manual errors and ensures consistency, making it highly useful in enterprise-level database systems.
