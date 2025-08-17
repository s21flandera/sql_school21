WITH res AS (
    WITH RECURSIVE nn AS (
        SELECT
            point1,
            point2,
            cost,
            ARRAY[point1] AS path,
            point1 = point2 AS cycle,
            ARRAY[cost] AS costs,
            1 AS iteration_number
        FROM nodes
        WHERE point1 = 'a'
        
        UNION ALL
        
        SELECT
            n.point1,
            n.point2,
            nn.cost + n.cost AS cost,
            nn.path || n.point1 AS path,
            n.point1 = ANY(nn.path) AS cycle,
            nn.costs || n.cost AS costs,
            nn.iteration_number + 1 AS iteration_number
        FROM nodes n
        JOIN nn ON nn.point2 = n.point1 AND NOT nn.cycle
        WHERE nn.iteration_number < 5 
    )
    SELECT 
        cost - costs[5] AS total_cost, 
        path AS tour
    FROM nn
    WHERE 
        iteration_number = 5
        AND path[1] = 'a'  
        AND path[5] = 'a'  
        AND 'b' = ANY(path)
        AND 'c' = ANY(path)
        AND 'd' = ANY(path)
)
(SELECT DISTINCT *
FROM res 
where total_cost = (select min(total_cost) from res)
ORDER BY total_cost, tour)
union 
(SELECT DISTINCT *
FROM res 
where total_cost = (select max(total_cost) from res)
ORDER BY total_cost, tour)

