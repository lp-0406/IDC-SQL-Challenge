use hospital;
select 
    stats.service,
    stats.total_admitted,
    stats.total_admitted - stats.avg_admitted as diff_from_avg,
    case 
        when stats.total_admitted > stats.avg_admitted then 'above average'
        when stats.total_admitted = stats.avg_admitted then 'average'
        else 'below average'
    end as rank_indicator
from (
    select 
        service,
        sum(patients_admitted) as total_admitted,
        (select avg(total)
         from (
             select sum(patients_admitted) as total
             from services_weekly
             group by service
         ) as t
        ) as avg_admitted
    from services_weekly
    group by service
) as stats
order by total_admitted desc;
