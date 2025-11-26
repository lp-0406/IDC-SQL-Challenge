use hospital;
select 
    service,
    week,
    patient_satisfaction,
    patients_admitted,
    sat_rank
from (
    select 
        service,
        week,
        patient_satisfaction,
        patients_admitted,
        rank() over (
            partition by service
            order by patient_satisfaction desc
        ) as sat_rank
    from services_weekly
) as ranked
where sat_rank <= 3
order by service, sat_rank, week;
