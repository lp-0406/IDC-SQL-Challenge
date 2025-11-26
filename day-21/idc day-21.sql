use hospital;
with 
-- 1) service-level metrics
service_stats as (
    select
        service,
        sum(patients_admitted) as total_admitted,
        sum(patients_refused) as total_refused,
        avg(patient_satisfaction) as avg_satisfaction,
        case 
            when sum(patients_admitted) + sum(patients_refused) = 0 
                then 0
            else 1.0 * sum(patients_admitted) 
                 / (sum(patients_admitted) + sum(patients_refused))
        end as admission_rate
    from services_weekly
    group by service
),

-- 2) staff metrics
staff_stats as (
    select
        s.service,
        count(distinct s.staff_id) as total_staff,
        avg(ss.present) as avg_weeks_present
    from staff s
    left join staff_schedule ss 
        on s.staff_id = ss.staff_id
    group by s.service
),

-- 3) patient demographics per service
patient_stats as (
    select
        service,
        count(*) as patient_count,
        avg(age) as avg_age
    from patients
    group by service
)

-- final dashboard
select 
    s.service,
    s.total_admitted,
    s.total_refused,
    s.avg_satisfaction,
    s.admission_rate,
    st.total_staff,
    st.avg_weeks_present,
    p.patient_count,
    p.avg_age,

    -- performance score = 60% admission_rate + 40% satisfaction
    round(
        (0.6 * s.admission_rate * 100)
        + (0.4 * s.avg_satisfaction),
    2) as performance_score

from service_stats s
left join staff_stats st on s.service = st.service
left join patient_stats p on s.service = p.service
order by performance_score desc;
