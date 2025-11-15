use hospital;

#daily challenge 
select p.patient_id, p.name , p.age, p.service, count(s.staff_id) as staff_count
from patients p
inner join staff s on p.service = s.service
group by p.patient_id, p.name, p.age, p.service
having count(s.staff_id) > 5
order by staff_count desc, p.name asc;
