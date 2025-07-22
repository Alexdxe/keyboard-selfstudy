-- Observing Updated Dataset:

set search_path to updated_keyboard;

-- Sorting switches by WPM: 
select * 
from updated_summary
order by mean_wpm

/* Observations:
  1) When comparing the original to the updated, we see that Holy Pandas jumps from being in the lower half of our order, to the upper half.
  2) Comparing adj_means, it also seems that Tangerines, Curry, and Holy Pandas all have signifiant changes to their statistics, indicating that retesting all switches influenced our data. 
 */


-- Sorting switches by WPM: 
select *
from updated_date_averages
order by date

/* Observations:
 -The addition of extra dates further proves  I performed much better near the latter half of the typing tests.
 */


-- How many of my test did I perform less than 75 wpm on(only accounting for retesting days)?
select count(*)
from updated_raw_data
where wpm <= 75
and date >= '6/27/2025'

/* Observations:
 -Only 27 of our (3*60)180 tests were below a 75.
 */


--How about 95 wpm?
select count(*)
from updated_raw_data
where wpm >= 95
and date >= '6/27/2025'

/* Observations:
 -6 of our 180 tests achieved a WPM above 95. 
 */


--What if we counted the number of tests with a <75/>95 per day?
select count(*)
from updated_raw_data
where wpm <= 75
group by date
order by date asc

select count(*)
from updated_raw_data
where wpm >= 95
group by date
order by date asc
/* Observations:
 1) This further supports our suspicion that I am performing better near the end of the testing phase in comparison to the start.
 -I tended to have less tests <=75 WPM the further we advanced in our testing process. 
 -While on the first 3 days I only saw 1-2 tests with scores above 95 WPM, after I would achieve 3-9 tests with 95 WPM.
*/



--Of the "fun" switches out there, what were the adj. mean WPM, loudness, enjoyment, tactility, and date statistics?
select uda.date, us.switch, uda.avg_wpm as date_WPM, uda.avg_accuracy as date_accuracy, us.adj_mean_WPM, ud.sound, us."enjoyment(/10)" as enjoyment
from updated_summary us, updated_descriptions ud, updated_date_averages uda
where us.id = ud.switch_id
and us.date = uda.date
and to_tsvector(notes) @@ plainto_tsquery('fun')

/* Observations:
 1) Of the switches I found 'fun' we see that I did better with the following switch in comparison to the benchmark one.
 2) I seemed to also enjoy typing on the switches that were 'fun', with all achieving atleast a 7/10, with a majority being 9/10. 
 3) A majority of the switches I found fun seemed to be high pitched switches(with the HMX Sonja being the one exception). 
*/


