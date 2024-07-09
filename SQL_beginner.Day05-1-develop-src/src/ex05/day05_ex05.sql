SET enable_seqscan = OFF;
explain analyse
select menu_id from person_order where order_date = '2022-01-01' and person_id =2;