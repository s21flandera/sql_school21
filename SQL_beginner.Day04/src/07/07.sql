INSERT INTO person_visits(id,person_id,pizzeria_id,visit_date) VALUES
((SELECT max(id)+1 FROM person_visits),(SELECT person.id FROM person WHERE name='Dmitriy'),((SELECT pizzeria.id FROM pizzeria 
INNER JOIN menu ON pizzeria.id=menu.pizzeria_id
WHERE menu.price<800)
EXCEPT
(SELECT pizzeria.id FROM pizzeria
INNER JOIN mv_dmitriy_visits_and_eats mv ON pizzeria.name=mv.pizzeria_name)ORDER BY 1 LIMIT 1),'2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;