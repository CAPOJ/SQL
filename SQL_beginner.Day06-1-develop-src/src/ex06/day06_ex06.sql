create sequence seq_person_discounts start 1;
alter table person_discounts alter column id set default nextval('seq_person_discounts');
select setval('seq_person_discounts', (select count(*)+1 from person_discounts));
select count(*)=1 as check1,
max("start_value") = 1 as check2,
max("last_value") > 5 as check3
from pg_sequences
where sequencename = 'seq_person_discounts'