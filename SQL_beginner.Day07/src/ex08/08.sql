SELECT p.address,
pz.name,
count(*) AS count_of_orders
FROM person_order po 
INNER JOIN person p ON p.id=po.person_id
INNER JOIN menu m ON m.id=po.menu_id
INNER JOIN pizzeria pz ON pz.id=m.pizzeria_id 
GROUP BY p.address, pz.name
ORDER BY p.address, pz.name