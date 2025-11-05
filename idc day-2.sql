use hospital;
# day-02
# task - 01
select * from patients 
where age > 60;


#task - 02
select * from staff
where service = "emergency";


#task - 03
select * from services_weekly
where patients_request > 100;

#daily challenge 
select patient_id,name,age,satisfaction
from patients as p 
where service = 'surgery' and satisfaction < 70;
 