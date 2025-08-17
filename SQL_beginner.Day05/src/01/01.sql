SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT pizza_name,
pz.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria pz ON pz.id=menu.pizzeria_id;


