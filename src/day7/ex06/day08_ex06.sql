--SESSION 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    SELECT SUM(rating) FROM pizzeria;
    SELECT SUM(rating) FROM pizzeria;
COMMIT;
    SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--SESSION 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut';
COMMIT;
    SELECT * FROM pizzeria WHERE name = 'Pizza Hut';