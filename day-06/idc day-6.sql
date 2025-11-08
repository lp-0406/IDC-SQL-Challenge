use hospital;

#task-01
select service, count(*)
from patients
group by service;

select service, avg(age) as avg_age
from patients 
group by service;

#3
select role, count(*)
from staff
group by role;

#daily challenge
select service, sum(patients_admitted), count(patients_refused), 
sum(patients_admitted)/ sum(patients_admitted)+sum(patients_refused) as admission_rate
from services_weekly
group by service
order by admission_rate desc;