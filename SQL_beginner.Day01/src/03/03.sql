SELECT order_date AS actoin_date,
person_id
FROM person_order
INTERSECT ALL
SELECT visit_date AS actoin_date,
person_id
FROM person_visits
ORDER BY actoin_date ASC, person_id DESC
