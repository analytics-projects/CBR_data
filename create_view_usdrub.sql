create view v_usdrub as 
(
with usdrub_eop as 
(select dt, year(dt) as year, month(dt) as month, value as eop from usdrub
where dt in
(select max(dt) as dt from usdrub
group by year(dt), month(dt))),
usdrub_avg as 
(select year(dt) as year, month(dt) as month, avg(value) as avg from usdrub
group by year(dt), month(dt))

select eop.dt as dt_eom, date_add(last_day(eop.dt), interval 1 day) as dt_som, eop.eop as eop, avg.avg as avg
from usdrub_eop as eop
inner join usdrub_avg as avg
on eop.year=avg.year and eop.month=avg.month
)