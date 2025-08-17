CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (a bigint) AS $$
WITH RECURSIVE fibonacci(a,b) AS (
    SELECT 0, 1 
    UNION ALL
    SELECT b, a+b 
    FROM fibonacci
    WHERE b<pstop)
SELECT a 
FROM fibonacci
$$LANGUAGE SQL;



select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
