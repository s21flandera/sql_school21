(SELECT pz.name,
count(*) AS count,
'visit' AS action_type
FROM person_visits pv
INNER JOIN pizzeria pz ON pz.id=pv.pizzeria_id
GROUP BY pz.name)
UNION
(SELECT pz.name,
count(*) AS count,
'order' AS action_type
FROM person_order po
INNER JOIN menu m ON m.id=po.menu_id
INNER JOIN pizzeria pz ON pz.id=m.pizzeria_id
GROUP BY pz.name)
ORDER BY action_type ASC, count DESC