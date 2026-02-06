DO $$
DECLARE
    marks INTEGER := 82;   
BEGIN
    IF marks >= 90 THEN
        RAISE NOTICE 'Grade: A';
    ELSIF marks >= 75 THEN
        RAISE NOTICE 'Grade: B';
    ELSIF marks >= 60 THEN
        RAISE NOTICE 'Grade: C';
    ELSIF marks >= 40 THEN
        RAISE NOTICE 'Grade: D';
    ELSE
        RAISE NOTICE 'Grade: F (Fail)';
    END IF;
END $$;