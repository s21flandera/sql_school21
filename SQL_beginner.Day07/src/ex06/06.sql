SELECT pz.name,
count(*) AS count_of_orders,
round(avg(m.price),2) AS average_price,
max(m.price) AS max_price,
min(m.price) AS min_price
FROM person_order po
INNER JOIN menu m ON po.menu_id=m.id
INNER JOIN pizzeria pz ON pz.id=m.pizzeria_id
GROUP BY pz.name
ORDER BY pz.name