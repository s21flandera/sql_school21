SELECT fpv.name,
COALESCE(fpv.count,0)+ COALESCE(fpo.count,0) AS total_count
FROM
(SELECT pz.name,
count(*) AS count
FROM person_visits pv
INNER JOIN pizzeria pz ON pz.id=pv.pizzeria_id
GROUP BY pz.name) AS fpv
FULL JOIN
(SELECT pz.name,
count(*) AS count
FROM person_order po
INNER JOIN menu m ON m.id=po.menu_id
INNER JOIN pizzeria pz ON pz.id=m.pizzeria_id
GROUP BY pz.name) AS fpo ON fpv.name=fpo.name
ORDER BY total_count DESC, name ASC