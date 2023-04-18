--SESSION 1
BEGIN TRANSACTION ISOLATION READ COMMITTED;
    SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
    SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
    SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--SESSION 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
    UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
    SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
