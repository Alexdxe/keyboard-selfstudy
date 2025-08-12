-- Let's make our new ideal dataset:
set search_path to updated_keyboard

create table if not exists updated_keyboard_dataset as
select urd."ID" as "ID", urd."WPM" as "WPM", urd."Accuracy(%):" as "Accuracy", ud.price as "Price", us.adj_mean_wpm as "Adj. Mean WPM", us."loudness (DB)" as "Loudness", 
ud.tactility as "Tactility", ud."bottom_out (grams)" as" Weight", urd."Date:" as "Date", uda.avg_wpm as "Date Average", uda.avg_accuracy as "Date Accuracy" 
from updated_date_averages uda, updated_descriptions ud, updated_summary us, updated_raw_data urd
where urd."ID" = ud.switch_id 
and urd."ID" = us.id
and urd."Date:" = uda.date