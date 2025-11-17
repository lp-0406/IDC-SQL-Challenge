use hospital;
select 
    sw.service,
    sum(sw.patients_admitted) as total_admitted,
    sum(sw.patients_refused) as total_refused,
    avg(sw.patient_satisfaction) as avg_satisfaction,
    count(distinct s.staff_id) as staff_assigned,
    sum(case when ss.present = 1 then 1 else 0 end) as staff_present
from services_weekly sw
left join staff s 
    on sw.service = s.service
left join staff_schedule ss
    on s.staff_id = ss.staff_id
    and sw.week = ss.week
where sw.week = 20
group by sw.service
order by total_admitted desc;
