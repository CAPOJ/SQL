ALTER TABLE person_discounts ADD CONSTRAINT ch_nn_person_id check ( person_id is not null);
ALTER TABLE person_discounts ADD CONSTRAINT ch_nn_pizzeria_id check ( pizzeria_id is not null);
ALTER TABLE person_discounts ADD CONSTRAINT ch_nn_discount check ( discount is not null);
ALTER TABLE person_discounts alter column discount set default 0;
ALTER TABLE person_discounts ADD CONSTRAINT ch_range_discount check ( discount between 0 and 100);
select count(*) = 4 as check
from pg_constraint
where conname in ('ch_nn_person_id','ch_nn_pizzeria_id','ch_nn_discount','ch_range_discount');
select column_default::integer = 0 as check
from information_schema.columns
where column_name = 'discount' and table_name = 'person_discounts';

