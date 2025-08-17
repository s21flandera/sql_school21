SELECT pizza_name, price, pz.name
FROM (SELECT id AS menu_id 
FROM menu 
EXCEPT 
SELECT menu_id
FROM person_order) AS mi 
INNER JOIN menu ON menu.id=mi.menu_id
INNER JOIN pizzeria pz ON menu.pizzeria_id=pz.id
ORDER BY pizza_name, price