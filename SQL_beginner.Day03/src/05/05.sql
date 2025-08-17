SELECT pz.name AS pizzeria_name
FROM pizzeria pz 
INNER JOIN person_visits pv ON pz.id=pv.pizzeria_id
INNER JOIN person p ON pv.person_id=p.id  
WHERE p.name='Andrey'
EXCEPT
SELECT pz.name
FROM person_order po
INNER JOIN person p ON po.person_id=p.id  
INNER JOIN menu ON po.menu_id=menu.id
INNER JOIN pizzeria pz ON menu.pizzeria_id=pz.id
WHERE p.name='Andrey'
ORDER BY pizzeria_name