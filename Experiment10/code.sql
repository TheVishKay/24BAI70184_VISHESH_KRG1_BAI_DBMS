
-- SQL CODE FOR POSTGRESQL


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

-- TESTING
INSERT INTO students (name) VALUES ('Alice');
INSERT INTO students (name) VALUES ('Bob');
INSERT INTO students (name) VALUES ('Charlie');

SELECT * FROM students;