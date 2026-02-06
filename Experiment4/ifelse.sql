DO $$
DECLARE
    num INTEGER := -5;  
BEGIN
    IF num > 0 THEN
        RAISE NOTICE 'The number % is Positive', num;
    ELSE
        RAISE NOTICE 'The number % is Non-Positive', num;
    END IF;
END $$;