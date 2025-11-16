use hospital;
select 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    count(ss.week) as weeks_present
from staff s
left join staff_schedule ss
    on s.staff_id = ss.staff_id
    and ss.present = 1
group by 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service
order by weeks_present desc;
