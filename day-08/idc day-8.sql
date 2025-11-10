use hospital;

#task-01
select name, upper(name) as capitals
from patients;

#task-02
select name, length(name) as lengthh
from patients;

#task-03
select staff_id, staff_name , concat(staff_id, '-' , staff_name) as id_name
from staff;

#daily challenge
select patient_id, upper(name), lower(service),
case 
 when age >= 65 then ('Senior')
 when age >= 18 then ('Adult') 
 else ('Minor')
end as 'age_category'
from patients
where length(name) > 10;