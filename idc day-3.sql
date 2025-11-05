# idc day -03
use hospital;



#task -01
select * from patients order by age desc;



#task-02
select * from services_weekly order by week asc, patients_request desc; 



#task-03
select * from staff order by staff_name asc;





#daily challenge
select week, service, patients_refused,patients_request
from services_weekly
order by patients_refused desc
limit 5;