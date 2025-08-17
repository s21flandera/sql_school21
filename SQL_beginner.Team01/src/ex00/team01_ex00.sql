WITH cte_latest_currency_rate AS (
    SELECT 
        id AS currency_id, 
        name AS currency_name, 
        rate_to_usd, 
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated DESC) AS row_num
    FROM currency
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    balance.type,
    SUM(balance.money) AS volume,
    COALESCE(lcr.currency_name, 'not defined') AS currency_name,
    COALESCE(lcr.rate_to_usd, 1) AS last_rate_to_usd,
    SUM(balance.money) * COALESCE(lcr.rate_to_usd, 1) AS total_volume_in_usd
FROM
    balance
	LEFT JOIN "user" u ON balance.user_id = u.id
	LEFT JOIN cte_latest_currency_rate lcr ON balance.currency_id = lcr.currency_id
										AND lcr.row_num = 1
GROUP BY
    u.name,
	u.lastname,
	balance.type,
	lcr.currency_name,
	lcr.rate_to_usd
ORDER BY
    name DESC,
	lastname ASC,
	balance.type ASC;
