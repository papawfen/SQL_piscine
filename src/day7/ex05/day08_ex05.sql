--SESSION 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SELECT SUM(rating) FROM pizzeria;
    SELECT SUM(rating) FROM pizzeria;
COMMIT;
    SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--SESSION 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
    UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut';
COMMIT;
    SELECT * FROM pizzeria WHERE name = 'Pizza Hut';