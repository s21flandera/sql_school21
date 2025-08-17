(SELECT pz.name AS pizzeria_name
FROM pizzeria pz 
INNER JOIN person_visits pv ON pz.id=pv.pizzeria_id
INNER JOIN person p ON p.id=pv.person_id
WHERE p.gender='female'
EXCEPT ALL
SELECT pz.name 
FROM pizzeria pz 
INNER JOIN person_visits pv ON pz.id=pv.pizzeria_id
INNER JOIN person p ON p.id=pv.person_id
WHERE p.gender='male')
UNION ALL
(SELECT pz.name 
FROM pizzeria pz 
INNER JOIN person_visits pv ON pz.id=pv.pizzeria_id
INNER JOIN person p ON p.id=pv.person_id
WHERE p.gender='male'
EXCEPT ALL
SELECT pz.name 
FROM pizzeria pz 
INNER JOIN person_visits pv ON pz.id=pv.pizzeria_id
INNER JOIN person p ON p.id=pv.person_id
WHERE p.gender='female')
ORDER BY pizzeria_name