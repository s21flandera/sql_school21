INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
money *  COALESCE(
        (SELECT rate_to_usd 
        FROM currency c 
        WHERE b.currency_id=c.id 
        AND c.updated<b.updated
        ORDER BY c.updated DESC
        LIMIT 1),
        (SELECT rate_to_usd 
        FROM currency c 
        WHERE b.currency_id=c.id 
        AND c.updated>b.updated
        ORDER BY c.updated ASC
        LIMIT 1)) AS currency_in_usd
    FROM balance b 
    INNER JOIN (SELECT c.id, c.name FROM currency c GROUP BY c.id, c.name) AS c ON c.id=b.currency_id
    LEFT JOIN "user" u ON u.id=b.user_id
    ORDER BY name DESC, lastname ASC, currency_name ASC

