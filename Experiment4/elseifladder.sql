DO $$
DECLARE
    marks INTEGER := 68;   
BEGIN
    IF marks >= 85 THEN
        RAISE NOTICE 'Performance: Excellent';
    ELSIF marks >= 70 THEN
        RAISE NOTICE 'Performance: Very Good';
    ELSIF marks >= 55 THEN
        RAISE NOTICE 'Performance: Good';
    ELSIF marks >= 40 THEN
        RAISE NOTICE 'Performance: Average';
    ELSE
        RAISE NOTICE 'Performance: Poor';
    END IF;
END $$;