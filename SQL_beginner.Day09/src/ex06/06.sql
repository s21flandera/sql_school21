CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar DEFAULT 'Dmitriy',
pprice numeric DEFAULT 500,
pdate date DEFAULT '2022-01-08')
RETURNS TABLE(name varchar) AS $$
BEGIN
RETURN QUERY
SELECT pz.name AS pizzeria_name
FROM pizzeria pz
INNER JOIN menu m ON m.pizzeria_id=pz.id
INNER JOIN person_visits pv ON pv.pizzeria_id=pz.id 
INNER JOIN person p ON p.id=pv.person_id 
WHERE price < pprice 
AND p.name=pperson
AND visit_date=pdate;
END;
$$ LANGUAGE plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
