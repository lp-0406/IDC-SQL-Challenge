use hospital;

#task-01
select service, sum(patients_admitted) as total_admitted
from services_weekly
group by service
having total_admitted > 500;

#task-02
select service, avg(patient_satisfaction) as avg_sat
from services_weekly
group by service
having avg(patient_satisfaction) < 75;

#task-03
select week, sum(staff_morale) as total_presence
from services_weekly
group by week
having total_presence < 50;

#daily challenge
select service,
       sum(patients_refused) as total_refused,
       round(avg(patient_satisfaction),2) as avg_satisfaction
from services_weekly
group by service
having total_refused > 100
   and avg(patient_satisfaction) < 80;
