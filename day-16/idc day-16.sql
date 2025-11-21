use hospital;

select 
    p.patient_id,
    p.name,
    p.service,
    p.satisfaction
from patients p
where p.service in (
    select sw.service
    from services_weekly sw
    group by sw.service
    having 
        sum(sw.patients_refused) > 0
        and avg(sw.patient_satisfaction) <
            (select avg(patient_satisfaction) from services_weekly)
);
