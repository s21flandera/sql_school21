(SELECT pz.name AS pizzeria_name
FROM pizzeria pz 
INNER JOIN menu ON menu.pizzeria_id=pz.id
INNER JOIN person_order po ON po.menu_id=menu.id
INNER JOIN person p ON p.id=po.person_id
WHERE p.gender='female'
EXCEPT
SELECT pz.name 
FROM pizzeria pz 
INNER JOIN menu ON menu.pizzeria_id=pz.id
INNER JOIN person_order po ON po.menu_id=menu.id
INNER JOIN person p ON p.id=po.person_id
WHERE p.gender='male')
UNION
(SELECT pz.name 
FROM pizzeria pz 
INNER JOIN menu ON menu.pizzeria_id=pz.id
INNER JOIN person_order po ON po.menu_id=menu.id
INNER JOIN person p ON p.id=po.person_id
WHERE p.gender='male'
EXCEPT
SELECT pz.name 
FROM pizzeria pz 
INNER JOIN menu ON menu.pizzeria_id=pz.id
INNER JOIN person_order po ON po.menu_id=menu.id
INNER JOIN person p ON p.id=po.person_id
WHERE p.gender='female')

ORDER BY pizzeria_name