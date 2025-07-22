-- Let's make our ideal dataset:
set search_path to updated_keyboard

create table keyboard_dataset as
select us.id as "ID", us.date as "Date", us.switch as "Switch Name", us.mean_wpm as "Average WPM", us.benchmark_mean as "Benchmark Average", us.adj_mean_wpm as "Adj. Mean WPM", us.accuracy as "Average Accuracy", us."loudness (DB)" as "Loudness",
us."enjoyment(/10)" as "Enjoyment", ud."bottom_out (grams)" as" Weight", ud.sound as "Sound", ud.tactility as "Tactility", uda.avg_wpm as "Date Average", uda.avg_accuracy as "Date Accuracy" 
from updated_date_averages uda, updated_descriptions ud, updated_summary us
where us.id = ud.switch_id 
and us.date = uda.date
