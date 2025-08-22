set search_path to keyboard;

-- Sorting switches by WPM: 
select * 
from summary
order by mean_wpm


-- Sorting switched based on adj_mean_WPM
select *
from summary
order by adj_mean_wpm


-- How many of my test did I perform equal to or less than 75 wpm on?
select count(*)
from raw_data
where wpm <= 75

--How about 95 wpm?
select count(*)
from raw_data
where wpm >= 95

--Checking the total tests ran: 
select count(*) from raw_data


