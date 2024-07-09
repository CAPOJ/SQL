CREATE TABLE person_discounts
(id bigint primary key ,
person_id bigint,
pizzeria_id bigint,
discount numeric,
CONSTRAINT fk_person_discounts_person_id foreign key (person_id) references person(id),
CONSTRAINT fk_person_discounts_pizzeria_id foreign key (pizzeria_id) references pizzeria(id)
);
SELECT COUNT(*) = 1 AS is_exist
FROM pg_tables
WHERE tablename = 'person_discounts';