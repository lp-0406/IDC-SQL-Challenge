use hospital;

#1
select week
from services_weekly
where event is null or event = '';


#2
select 
    count(*) as total_rows,
    count(event) as non_null_events,
    count(*) - count(event) as null_events
from services_weekly;


#3
select distinct service
from services_weekly
where event is not null 
  and event <> '';


#daily challenge
select 
    case 
        when event is null or event = '' then 'no event'
        else 'with event'
    end as event_status,
    count(*) as week_count,
    avg(patient_satisfaction) as avg_satisfaction,
    avg(staff_morale) as avg_morale
from services_weekly
group by event_status
order by avg_satisfaction desc;
