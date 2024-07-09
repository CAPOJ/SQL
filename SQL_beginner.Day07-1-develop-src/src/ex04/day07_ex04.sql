select p.name, count(*) as "count_of_visits" from person_visits inner join person p on p.id = person_visits.person_id
group by p.name having count(*) > 3;