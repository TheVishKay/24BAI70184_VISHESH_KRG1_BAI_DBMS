DO $$
DECLARE
    day_num INTEGER := 3;
BEGIN
    CASE day_num
        WHEN 1 THEN RAISE NOTICE 'Monday';
        WHEN 2 THEN RAISE NOTICE 'Tuesday';
        WHEN 3 THEN RAISE NOTICE 'Wednesday';
        WHEN 4 THEN RAISE NOTICE 'Thursday';
        WHEN 5 THEN RAISE NOTICE 'Friday';
        WHEN 6 THEN RAISE NOTICE 'Saturday';
        WHEN 7 THEN RAISE NOTICE 'Sunday';
        ELSE
            RAISE NOTICE 'Invalid Day Number';
    END CASE;
END $$;