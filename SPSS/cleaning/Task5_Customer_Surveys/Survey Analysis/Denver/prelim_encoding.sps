cd "Z:\Projects\+REUWS_2".

compute study=1.
value labels study
1 'REUWS2'
.
compute has_survey=1.
compute survey_year=2011.

rename variables id=SurveyID.
missing values SurveyID (600000 thru hi).
SORT CASES BY SurveyID(A).

compute survey_number_of_toilets=(q1a - 1).
compute survey_number_of_bathtub_showers=(q1b - 1).
compute survey_number_of_bathtub_only=(q1c - 1).
compute survey_number_of_whirlpools=(q1d - 1).
compute survey_number_of_shower_only=(q1e - 1).
compute survey_number_of_utility_sink=(q1f - 1).
compute survey_number_of_bathtubs=sum(0, survey_number_of_bathtub_showers, survey_number_of_bathtub_only).
compute survey_number_of_showers=sum(0, survey_number_of_bathtub_showers, survey_number_of_shower_only).
 
RECODE 
q2a to q2n
(2=0) (ELSE=Copy) INTO 
survey_disposal
survey_ice_maker
survey_dishwasher
survey_clothes_washer_HE
survey_hot_water_tankless
survey_hot_water_on_demand
survey_evap_cooler
survey_humidifier
survey_treatment
survey_aquarium
survey_pets
survey_spa_indoor
survey_water_feature_indoor
survey_greenhouse_indoor
.
value labels survey_disposal to survey_greenhouse_indoor
0 'No' 1 'Yes'
.

*
* TODO: q3 verbatims
*. 

*
* TODO: check q4 don't know code
*.
missing values q4a to q4d (6).
rename variables
q4a=survey_number_of_toilets_GT16
q4b=survey_number_of_toilets_16
q4c=survey_number_of_toilets_HET
q4d=survey_number_of_toilets_dual
.

missing values q5a to q5c (6).
compute survey_number_of_showers_hydra=(q5a-1).
compute survey_number_of_showers_rain=(q5b-1).
compute survey_number_of_showers_spray=(q5c-1).

recode q6a to q6d
(2=0) (ELSE=Copy) INTO 
survey_replaced_toilets_10
survey_replaced_showerheads_10
survey_replaced_clothes_washer_10
survey_replaced_dishwasher_10
.

recode q7a to q7d
(MISSING=0) (ELSE=Copy) INTO
survey_leak_toilet
survey_faucet_drips
survey_leak_pool
survey_leak_irrigation
.

*
* TODO: q7e verbatim?
*.

recode q8a q8b q8e q8f
(MISSING=0) (ELSE=Copy) INTO
survey_hot_water_gas
survey_hot_water_electric
survey_hot_water_propane
survey_hot_water_solar
.

*
* TODO: q8c and q8d verbatims?
*.

recode q9
(2=0) (ELSE=Copy) INTO 
survey_hot_water_wait
.

recode q9a1 to q9a4
(MISSING=0) (ELSE=Copy) INTO
survey_hot_water_wait_kitchen
survey_hot_water_wait_master_bath
survey_hot_water_wait_other_bath
survey_hot_water_wait_other_room
.

value labels survey_replaced_toilets_10 to survey_hot_water_wait_other_room
0 'No' 1 'Yes'
.

recode q10
(1=0.0) (2=0.33) (3=0.67) (4=1.0) into
survey_hot_water_waiting
.
variable level survey_hot_water_waiting (ORDINAL).
value labels survey_hot_water_waiting
0.0 "Almost no time at all"
0.33 "Not very long, we just have to let the water run for a few seconds"
0.67 "Pretty long, we have to let the water run a minute or two before it gets hot"
1.0 "Very long, we have to let the water run more than two minutes before it gets hot"
.

recode q11
(1=1.0) (2=0.5) (3=0.0) into
survey_hot_water_wait_bother
.
variable level survey_hot_water_wait_bother (ORDINAL).
value labels survey_hot_water_wait_bother
1.0 "Yes, very much"
0.5 "Yes, a little bit"
0.0 "No, not really"
.

recode q12
(2=0) (ELSE=Copy) INTO 
survey_irrigation
.

compute survey_landscape_no_maintenance=any(q13, 1).
recode q13
(2=1.0) (4=0.5) (3=0.0) into
survey_landscaper
.
variable level survey_landscaper (ORDINAL).
value labels survey_landscaper
1.0 "I/We hire a company (or individual) to handle most or all of our landscape maintenance."
0.0 "I/We do most of the work ourselves."
0.5 "A combination, some I/we do ourselves, some I/we hire out for."
.

recode q14
(2=0) (ELSE=Copy) INTO 
survey_landscaper_waters
.

recode q15b to q15g
(MISSING=0) (ELSE=Copy) INTO
survey_well
survey_canal_ditch
survey_stream
survey_rain_barrel
survey_roof_direction
survey_gray_water
.

*
* TODO: q15h verbatim?
*.

value labels survey_irrigation survey_landscape_no_maintenance survey_landscaper_waters to survey_gray_water
0 'No' 1 'Yes'
.

missing values q16 (5).
compute survey_other_sources_pct=(2*q16 - 1)/8.
value labels survey_other_sources_pct
0.125 "Less than 25%"
0.375 "About 25% to 50%"
0.625 "About 51% to 75%"
0.875 "More than 75%"
.

recode q17a to q17f
(MISSING=0) (ELSE=Copy) INTO
survey_landscape_turf
survey_landscape_trees_and_shrubs
survey_garden_veggie
survey_garden_flower
survey_landscape_low_water
survey_landscape_nonirrigated
.
value labels survey_landscape_turf to survey_landscape_nonirrigated
0 'No' 1 'Yes'
.

recode q18
(1=1.0)
(2=0.67)
(3=0.33)
(4=0.0)
into survey_manual_irrigation_pct
.
variable level survey_manual_irrigation_pct (ORDINAL).
value labels survey_manual_irrigation_pct
1.0 "All of it (100%)"
0.67 "More than half"
0.33 "Less than half"
0.0 "None"
.

recode q19
(2=0) (ELSE=Copy) INTO 
survey_irrigation_inground
.

recode q20a to q20e
(MISSING=0) (ELSE=Copy) INTO
survey_irrigation_inground_timer
survey_irrigation_inground_wbic
survey_irrigation_inground_master
survey_irrigation_inground_bfp
survey_irrigation_inground_drip
.

*
* TODO: q20f verbatim?
*.

recode q21b to q21d
(MISSING=0) (ELSE=Copy) INTO
survey_irrigation_manual_override
survey_irrigation_sensor_soil
survey_irrigation_sensor_rain
.
value labels survey_irrigation_inground to survey_irrigation_sensor_rain
0 'No' 1 'Yes'
.

*
* TODO: q22
*.

RECODE 
q23
(2=0) (ELSE=Copy) INTO
survey_spa_or_hot_tub_outdoor
.

recode
q24
(1=1.0) (2=0.5) (3=0.0) into
survey_spa_or_hot_tub_outdoor_filled
.
variable level survey_spa_or_hot_tub_outdoor_filled (ORDINAL).
value labels survey_spa_or_hot_tub_outdoor_filled
1.0 "Yes, usually filled"
0.5 "No, sometimes filled"	
0.0 "No, it is never filled"	
.

RECODE 
q25 q26
(2=0) (ELSE=Copy) INTO
survey_water_feature_outdoor
survey_pool
.

value labels
survey_spa_or_hot_tub_outdoor survey_water_feature_outdoor survey_pool
0 'No' 1 'Yes'
.

recode
q27
(1=0) (2=1) into
survey_pool_fill_automatic
.
value labels survey_pool_fill_automatic
0 'Manual'
1 'Automatic'
.

compute survey_pool_cover_chemical=any(q28, 2).
compute survey_pool_cover=any(q28,3,4).
compute survey_pool_cover_overnight=any(q28,4).

recode q29a q29b
(1=0) (2=5) (3=4) (4=2) (5=1) (6=0.5) into
survey_car_washed
survey_walk_washed
.
variable level survey_car_washed survey_walk_washed (ORDINAL).
value labels survey_car_washed survey_walk_washed
0 "Never"
5 "More than once a week"
4 "About once a week"
2 "About twice a month"	
1 "About once a month"	
0.5 "Less than once a month"	
.

RECODE 
q30 q32
(2=0) (ELSE=Copy) INTO
survey_program_participation_3
survey_conservation_last_few
.

recode q31a to q31d
(MISSING=0) (ELSE=Copy) INTO
survey_giveaway_3
survey_retrofit_rebate_3
survey_landscape_rebate_3
survey_followed_guidelines
.
value labels survey_program_participation_3 to survey_followed_guidelines
0 'No' 1 'Yes'
.

*
* TODO: q31e verbatim
*.

recode q33a to q33k q33m to q33w
(MISSING=0) (ELSE=Copy) INTO
survey_replaced_clothes_washer_HE
survey_conservation_shower_short
survey_replaced_showerheads_LF
survey_toilet_inserts
survey_replaced_toilets_last_few
survey_disposal_used_less
survey_dishwasher_used_less
survey_clothes_washer_used_less
survey_faucet_drips_repaired
survey_audit_last_few
survey_shower_bucket
survey_replaced_dishwasher_HE
survey_car_washed_less_often
survey_irrigation_less_often
survey_irrigation_avoid_heat
survey_landscape_low_water_last_few
survey_irrigation_timer_shortened_last_few
survey_leak_irrigation_repaired
survey_irrigation_inground_monitor
survey_irrigation_inground_cycle
survey_gray_water_last_few
survey_rain_barrel_last_few
.

*
* TODO: q33l verbatim
*.

value labels survey_replaced_clothes_washer_HE to survey_rain_barrel_last_few
0 'No' 1 'Yes'.

recode q34
(1=0.0) (2=0.33) (3=0.67) (4=1.0) into
survey_drought
.
variable level survey_drought (ORDINAL).
value labels survey_drought
0 "No drought"
0.33 "Mild drought"
0.67 "Moderate drought"
1.0 "Severe drought"
.

recode q35a to q35s
(1=1) (2=0.5) (3=-0.5) (4=-1.0) (5=0) into
reuws2_attitude_A
reuws2_attitude_B
reuws2_attitude_C
reuws2_attitude_D
reuws2_attitude_E
reuws2_attitude_F
reuws2_attitude_G
reuws2_attitude_H
reuws2_attitude_I
reuws2_attitude_J
reuws2_attitude_K
reuws2_attitude_L
reuws2_attitude_M
reuws2_attitude_N
reuws2_attitude_O
reuws2_attitude_P
reuws2_attitude_Q
reuws2_attitude_R
reuws2_attitude_S
.
variable level reuws2_attitude_A to reuws2_attitude_S (ORDINAL).
value labels reuws2_attitude_A to reuws2_attitude_S
1.0 "Strongly agree"	
0.5 "Somewhat agree"	
-0.5 "Somewhat disagree"	
-1.0 "Strongly disagree"	
0.0 "Not applicable"	
.

recode q36
(2=0) (ELSE=Copy) INTO
survey_household_pays
.
value labels survey_household_pays
0 "Landlord or a homeowner's association pays"
1 "Household pays"
. 

recode q37
(1=1940) (2=1945) (3=1955) (4=1965) (5=1975) (6=1985) (7=1992) (8=1997.5) (9=2003) (10=2006) into
survey_year_built
.
compute survey_age_of_home=(survey_year-survey_year_built).
value labels survey_year_built
1 "Before 1940"
2 "In the 1940s"
3 "In the 1950s"
4 "In the 1960s"
5 "In the 1970s"
6 "In the 1980s"
7 "Between 1990 and 1994"
8 "Between 1995 and 2000"
9 "Between 2001 and 2005"
10 "After 2006"
.

rename variables q38=survey_year_moved_in.
compute survey_years_in_home=(survey_year-survey_year_moved_in).

recode q39
(2=0) (ELSE=Copy) INTO
survey_renter
.
value labels survey_renter
0 'Own' 1 'Rent'
.

missing values q40 to q41d (0).
* recode q40 to q41d
(MISSING=0) (ELSE=COPY) into
survey_number_of_bedrooms
survey_number_of_adults
survey_number_of_teenagers
survey_number_of_children
survey_number_of_infants
.
rename variables
q40=survey_number_of_bedrooms
q41a=survey_number_of_adults
q41b=survey_number_of_teenagers
q41c=survey_number_of_children
q41d=survey_number_of_infants
.

compute capita=sum(survey_number_of_adults to survey_number_of_infants).

compute survey_homies=(q42 - 1).
compute survey_adults_employed=(q43 - 1).
compute survey_baths_per_week=(q44 - 1).
compute survey_showers_not_at_home=(q45 - 1).

recode q46
(1=10) (2=12) (3=13) (4=14) (4=16) (5=18) into
survey_highest_grade
.
variable level survey_highest_grade (ORDINAL).
value labels survey_highest_grade
10 "12th grade or less, no diploma"
12 "High school diploma"
13 "Some college, no degree"
14 "Associate's degree (e.g. AA, AS)"
16 "Bachelor's degree (e.g. BA, AB, BS)"
18 "Graduate degree or professional degree"
.

recode q47
(1=25000)
(2=37500)
(3=62500)
(4=87500)
(5=125000)
(6=175000)
(7=200000)
into
survey_income
.
formats survey_income (DOLLAR6.0).

recode partic
(1=0) (MISSING=1) (ELSE=COPY) into
survey_participant
.

execute.

SAVE OUTFILE='Task5_Customer_Surveys\Survey Responses\Denver preliminary recoded.sav'
  /DROP=q1a to q2n q5a to q7d q8a q8b q8e q8f q9 to q15g q16 to q20e q21b to q21d q23 to q31d q32 to q33k q33m to q37 q39 a42 to q47 partic
  /COMPRESSED.
