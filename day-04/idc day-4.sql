use hospital;

#task-01
select* from patients limit 5;

#task-02
select* from patients limit 10 offset 10;

#task-03
select * from patients order by arrival_date desc limit 10; 

#daily challenge
select  patient_id, name, service, satisfaction
from patients 
order by satisfaction desc 
limit 5 offset 2;