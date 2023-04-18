COMMENT ON TABLE person_discounts IS 'Таблица скидок для посетителей пиццерий';
COMMENT ON COLUMN person_discounts.id IS 'Колонка нумерации';
COMMENT ON COLUMN person_discounts.person_id IS 'id посетителя';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'id пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Скидка для посетителя в процентах';