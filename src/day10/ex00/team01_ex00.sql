SELECT coalesce("user".name, 'not defined') AS name,
       coalesce("user".lastname, 'not defined') AS lastname,
       balance.type AS type,
       sum(balance.money) AS volume,
       coalesce(currency.name, 'not defined') AS currency_name,
       coalesce(currency.rate_to_usd, 1) AS last_rate_to_usd,
       sum(balance.money * coalesce(currency.rate_to_usd, 1)) AS total_volume_in_usd
 FROM "user"
 RIGHT JOIN balance ON "user".id = balance.user_id
 LEFT OUTER JOIN currency ON balance.currency_id = currency.id
     AND currency.updated = (SELECT max(updated)
                             FROM currency
                             WHERE id = balance.currency_id)
GROUP BY "user".name, "user".lastname, type, currency_name, last_rate_to_usd
ORDER BY name desc, lastname, type;
