set search_path to keyboard;

-- Sorting switches by WPM: 
select * 
from summary
order by mean_wpm

/*Observations: 
1) The mean WPM ranges from 76.9- 86.8. This is almost a 10 WPM difference across our testing dates.
2) Accuracy maybe correlated with mean wpm, as I tend to do better in WPM, there is a slight postitive difference in accuracy. 
 */

--Sorting by Date (Exploration):
select *
from date_averages
order by date

/*Observations:
  1) With each passing date, there seemed to be a slight increase in WPM, going from high 70s, to landing on mid-high 80s.
  2) Same can we attribited with accuracy, as I started at 89, but then never achieved anything lower than 91 after the 16th. 
*/


--Comparing Tactility(Exploration)
select d.tactility, avg(s.mean_wpm) as mean_wpm, avg(s.accuracy) as mean_accuracy
from summary s, descriptions d
where s.id = d.switch_id
group by d.tactility 

/*Observations:
  I generally performed better on tactile switches, just by observing the averages of both wpm and accuracy.
  I performed slightly better on both accuracy and WPM when tactility was present.
 */


-- How many of my test did I perform less than 75 wpm on?
select count(*)
from raw_data
where wpm <= 75

--How about 95 wpm?
select count(*)
from raw_data
where wpm >= 95

--Checking the total tests ran: 
select count(*) from raw_data

/* Observations:
   1) Of the 770 tests ran, 187 of the tests were less than 75 WPM. 
   - While I was shocked by this statistic, I soon remembered I often underperformed at the start of most tests.
   
   2) Only 33 of my tests went above/equal to 95 wpm.
   */


