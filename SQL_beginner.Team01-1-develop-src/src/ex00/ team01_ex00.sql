WITH
       last_dates AS (
              SELECT
                     id,
                     name,
                     MAX(updated) AS updated
              FROM
                     currency
              GROUP BY
                     id,
                     name
       ),
       update_cur AS (
              SELECT
                     id AS currency_id,
                     name AS currency_name,
                     rate_to_usd
              FROM
                     currency
                     JOIN last_dates USING (id, name, updated)
       ),
       sumbalance AS (
              SELECT
                     currency_id,
                     user_id,
                     type,
                     SUM(money) AS volume
              FROM
                     balance
              GROUP BY
                     currency_id,
                     user_id,
                     type
       )
SELECT
       COALESCE(name, 'not defined') AS name,
       COALESCE(lastname, 'not defined') AS lastname,
       type,
       volume,
       COALESCE(currency_name, 'not defined') AS currency_name,
       COALESCE(rate_to_usd, 1) AS last_rate_to_usd,
       volume * COALESCE(rate_to_usd, 1) AS total_volume_in_usd
FROM
       public.user AS u (user_id)
       FULL JOIN sumbalance AS sb USING (user_id)
       FULL JOIN update_cur AS uc USING (currency_id)
ORDER BY
       name DESC,
       lastname ASC,
       type ASC;

/* RESULT:
 * "name",           "lastname",  "type", "volume", "currency_name",  "last_rate_to_usd",  "total_volume_in_usd"
 * "Петр",           "not defined", 2,    "203",    "not defined",    "1",                 "203"
 * "Иван",           "Иванов",      1,    "410",    "EUR",            "0.9",               "369.0"
 * "not defined",    "not defined", 0,    "120",    "JPY",            "0.0087",            "1.0440"
 * "not defined",    "not defined", 1,    "120",    "USD",            "1",                 "120"
 * "not defined",    "Сидоров",     0,    "50",     "EUR",            "0.9",               "45.0"
 * "not defined",    "Сидоров",     1,    "500",    "USD",            "1",                 "500"
 * "not defined",    "Сидоров",     2,    "500",    "JPY",            "0.0087",            "4.3500"
 */