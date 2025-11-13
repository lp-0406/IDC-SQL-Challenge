use hospital;

#1
select distinct service
from patients;

#2
select distinct role
from staff;

#3
select distinct month
from services_weekly;


#daily challenge
select 
    service, 
    event, 
    count(*) as event_count
from services_weekly
where event is not null 
  and event not in ('none', '')
group by service, event
order by event_count desc;


