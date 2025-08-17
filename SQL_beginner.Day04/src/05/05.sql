CREATE VIEW v_price_with_discount AS
SELECT p.name,
m.pizza_name,
m.price,
round(m.price-m.price*0.1) AS discount_price
FROM person_order po
INNER JOIN person p ON p.id=po.person_id
INNER JOIN menu m ON m.id=po.menu_id
ORDER BY p.name, pizza_name