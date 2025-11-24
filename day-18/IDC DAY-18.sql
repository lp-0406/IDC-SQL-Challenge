use hospital;
select 
    p.patient_id as identifier,
    p.name as full_name,
    'patient' as type,
    p.service
from patients p
where p.service in ('surgery', 'emergency')

union all

select 
    s.staff_id as identifier,
    s.staff_name as full_name,
    'staff' as type,
    s.service
from staff s
where s.service in ('surgery', 'emergency')

order by type, service, full_name;
