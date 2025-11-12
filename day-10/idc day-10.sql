use hospital;

#task-01
select patient_id, name, satisfaction, 
case
when satisfaction > 85 then "high"
when satisfaction between 70 and 85 then "medium"
else "low"
end as score
from patients;


#task-02
select staff_id, staff_name, role, 
case 
when role = 'doctor' then "medical"
else "support"
end as roles
from staff;


#task-03
select name, age ,
case
when age between 0 and 18 then "minor"
when age between 19 and 40 then "adult"
when age between 41 and 65 then "middle aged"
else "senior citizen"
end as category
from patients;


#daily challenge
select service, count(patients_admitted), avg(patient_satisfaction) as avg_score,
case 
when avg(patient_satisfaction) >= 85 then "excellent"
when avg(patient_satisfaction) between 75 and 85 then "good"
when avg(patient_satisfaction) between 65 and 75 then "needs imporvement"
else "needs imporvement"
end as avg_satisfaction
from services_weekly
group by service
order by avg(patient_satisfaction) desc;