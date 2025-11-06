use hospital;

#task-01
select count(patient_id) from patients;

#task-02
select avg(satisfaction) from patients;

#task-03
select min(age), max(age) from patients;

#daily challenge
select count(patients_admitted), count(patients_refused) , round(avg(patient_satisfaction),2)
from services_weekly;