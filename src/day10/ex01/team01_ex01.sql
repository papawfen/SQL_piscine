CREATE OR REPLACE FUNCTION past(balance_update timestamp, currency_id bigint) returns numeric AS $$
 SELECT CASE
        WHEN (SELECT updated
              FROM currency
              WHERE currency.updated <= balance_update AND currency_id = currency.id
              ORDER BY updated DESC LIMIT 1) is not null
        THEN (SELECT rate_to_usd
              FROM currency
              WHERE currency.updated <= balance_update AND currency_id = currency.id
              ORDER BY updated DESC LIMIT 1)
        ELSE (SELECT rate_to_usd
              FROM currency
              WHERE currency.updated > balance_update AND currency_id = currency.id
              ORDER BY updated LIMIT 1)
    END AS dates
    FROM currency
$$ language sql;


SELECT coalesce("user".name, 'not defined') AS name,
       coalesce("user".lastname, 'not defined') AS lastname,
       currency.name AS currency_name,
       balance.money * past(balance.updated, currency.id) AS currensy_in_usd
FROM "user"
RIGHT JOIN balance on "user".id = balance.user_id
JOIN currency on balance.currency_id = currency.id
GROUP BY "user".name, "user".lastname, currency.name, balance.money, balance.updated, currency.id
ORDER BY 1 desc, 2, 3;
