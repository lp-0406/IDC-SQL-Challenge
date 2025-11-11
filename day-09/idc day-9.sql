use hospital;

#task-01
select name, arrival_date, year(arrival_date) as arrivalyr
from patients;

#task-02
select name, arrival_date, departure_date, datediff(departure_date , arrival_date) as stay_days
from patients;

#task-03
select name, arrival_date, month(arrival_date) as month_arrival
from patients;

#dailychallenge
select service, avg(datediff(departure_date , arrival_date)) as avg_stay , count(patient_id) as count
from patients
group by service
having avg_stay > 7
order by avg_stay desc;
