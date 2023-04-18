CREATE SEQUENCE seq_person_discounts AS
    bigint START 1
    INCREMENT 1;
SELECT setval('seq_person_discounts', (SELECT max(id)
                                       FROM person_discounts));
ALTER TABLE person_discounts
    ALTER COLUMN  id SET DEFAULT (nextval('seq_person_discounts'));
