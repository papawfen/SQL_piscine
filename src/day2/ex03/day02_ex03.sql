WITH date(missing_date) AS
    (SELECT date_trunc('day', dd)::date AS missing_dates
        FROM generate_series('2022-01-01'::timestamp,
                             '2022-01-10'::timestamp,
                             '1 day'::interval) dd
        LEFT JOIN person_visits ON (person_id = 1 or person_id = 2) and visit_date = dd
        WHERE visit_date isnull
        ORDER BY missing_dates)

SELECT missing_date FROM date;