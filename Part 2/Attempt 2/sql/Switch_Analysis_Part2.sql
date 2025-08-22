-- Observing Updated Dataset:

set search_path to updated_keyboard;

-- Sorting switches by WPM: 
select * 
from updated_summary
order by mean_wpm


-- Sorting switches by adj_mean_WPM: 
select *
from updated_summary
order by adj_mean_wpm


-- Sorting switches by Date Average WPM: 
select *
from updated_date_averages
order by date


--Comparing Tactility:
select d.tactility, avg(s.mean_wpm) as mean_wpm, avg(s.accuracy) as mean_accuracy
from updated_summary s, updated_descriptions d
where s.id = d.switch_id
group by d.tactility 


-- How many of my test did I perform less than 75 wpm on(only accounting for retesting days)?
select count(*)
from updated_raw_data
where wpm <= 75
and date >= '6/27/2025'


--How about 95 wpm?
select count(*)
from updated_raw_data
where wpm >= 95
and date >= '6/27/2025'



--How many tests did I perform <=75 and >=95(Counted per day)?
select date, count(*)
from updated_raw_data
where wpm <= 75
group by date
order by date asc

select date, count(*)
from updated_raw_data
where wpm >= 95
group by date
order by date asc




--Of the "fun" switches out there, what were the adj. mean WPM, loudness, enjoyment, tactility, and date statistics?
select uda.date, us.switch, uda.avg_wpm as date_WPM, uda.avg_accuracy as date_accuracy, us.adj_mean_WPM, ud.sound, us."enjoyment(/10)" as enjoyment
from updated_summary us, updated_descriptions ud, updated_date_averages uda
where us.id = ud.switch_id
and us.date = uda.date
and to_tsvector(notes) @@ plainto_tsquery('fun')



