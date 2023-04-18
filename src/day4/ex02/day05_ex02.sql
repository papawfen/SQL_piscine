DROP INDEX IF EXISTS idx_person_name;
CREATE INDEX idx_person_name ON person (upper(name)) where upper(name) = name;
SET enable_seqscan = false;
SELECT name FROM person WHERE upper(name) = name;
