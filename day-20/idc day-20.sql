use hospital;
select
    service,
    week,
    patients_admitted,
    
    -- running total (cumulative admissions)
    sum(patients_admitted) over (
        partition by service
        order by week
    ) as cumulative_admissions,
    
    -- 3-week moving average (current + 2 previous)
    round(
        avg(patient_satisfaction) over (
            partition by service
            order by week
            rows between 2 preceding and current row
        ), 2
    ) as moving_avg_3week,
    
    -- difference between this week's admissions and service average
    patients_admitted
        - avg(patients_admitted) over (partition by service)
      as diff_from_service_avg

from services_weekly
where week between 10 and 20
order by service, week;
