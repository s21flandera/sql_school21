SELECT order_date AS actoin_date,
(SELECT name FROM person WHERE person.id = person_order.person_id) AS person_name
FROM person_order
INTERSECT
SELECT visit_date AS actoin_date,
(SELECT name FROM person WHERE person.id = person_visits.person_id) AS person_name
FROM person_visits
ORDER BY actoin_date ASC, person_name DESC