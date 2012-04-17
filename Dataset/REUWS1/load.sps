cd 'S:\local\home\matt'.
cd 'csci7000\Project'.
cd 'Dataset'.
GET
  FILE='REUWS1\sample5574.sav'.

*
* Cleanup
*.
compute survey_age_of_home=survey_year-survey_year_built.
compute pct_flushes_gt_2_2 = Numberofflushesgreaterthan2_2Gal / ToiletEvents.
compute pct_flushes_lt_2_2 =  Numberofflusheslessthan2_2Gal / ToiletEvents.
execute.
variable level Keycode survey_irrigation_inground survey_irrigation_inground_timer (nominal).
variable level reuws1_attitude_A survey_drought survey_highest_grade (ordinal).

insert file="random_number_generation.sps".