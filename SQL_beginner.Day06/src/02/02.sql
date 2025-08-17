SELECT p.name,
m.pizza_name,
m.price,
round(m.price-(pd.discount*m.price/100)) AS discount_price,
pz.name AS pizzeria_name
FROM person_order po 
INNER JOIN menu m ON m.id=po.menu_id
INNER JOIN person p ON po.person_id=p.id 
INNER JOIN person_discounts pd ON m.pizzeria_id=pd.pizzeria_id AND pd.person_id=p.id
INNER JOIN pizzeria pz ON pz.id=m.pizzeria_id
ORDER BY p.name, m.pizza_name