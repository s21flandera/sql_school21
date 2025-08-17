SELECT pizza_name,
price,
pz.name AS pizzeria_name,
pv.visit_date
FROM menu
INNER JOIN pizzeria pz ON pz.id=menu.pizzeria_id
INNER JOIN person_visits pv ON pz.id=pv.pizzeria_id
INNER JOIN person p ON p.id=pv.person_id
WHERE p.name='Kate'
AND menu.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name