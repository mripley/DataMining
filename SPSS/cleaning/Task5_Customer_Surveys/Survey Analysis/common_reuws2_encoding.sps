cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".

*
* Depends on survey_year being defined!
* Does not EXECUTE
*. 

echo "REUWS2 common survey encoding".

compute survey_number_of_toilets=(q1a - 1).
compute survey_number_of_bathtub_showers=(q1b - 1).
compute survey_number_of_bathtub_only=(q1c - 1).
compute survey_number_of_whirlpools=(q1d - 1).
compute survey_number_of_shower_only=(q1e - 1).
compute survey_number_of_utility_sink=(q1f - 1).
compute survey_number_of_bathtubs=sum(survey_number_of_bathtub_showers, survey_number_of_bathtub_only).
compute survey_number_of_showers=sum(survey_number_of_bathtub_showers, survey_number_of_shower_only).

value labels survey_number_of_toilets to survey_number_of_utility_sink 7 '7+'.
value labels survey_number_of_bathtubs survey_number_of_showers 7 '7+'.

variable labels
survey_number_of_toilets 'Toilet'
survey_number_of_bathtub_showers 'Bathtub with shower'
survey_number_of_bathtub_only 'Standard bathtub only'
survey_number_of_whirlpools 'Large bathtub tub w/jets'
survey_number_of_shower_only 'Shower stall only'
survey_number_of_utility_sink 'Indoor utility/garage sink'
survey_number_of_bathtubs 'Bathtubs'
survey_number_of_showers 'Showers'
.

 
RECODE q2a to q2n
(2=0) (1=1) INTO 
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

variable labels
survey_disposal 'In-sink garbage disposal'
survey_ice_maker 'Automatic ice maker'
survey_dishwasher 'Dishwasher'
survey_clothes_washer_HE 'Water & energy efficient (EnergyStar) clothes washer'
survey_hot_water_tankless 'Tankless water heater'
survey_hot_water_on_demand 'On-demand hot water system (recirculating pump)'
survey_evap_cooler 'Evaporative/swamp cooler'
survey_humidifier 'Whole house humidifier (usually attached to furnace)'
survey_treatment 'Whole house water treatment system like a water softener or a reverse osmosis system'
survey_aquarium 'Fish aquarium larger than 10 gallons'
survey_pets 'Pets (e.g., dogs, cats, or other medium to large size animal)'
survey_spa_indoor 'Indoor spa or hot tub with jets (if hot tub is NOT usually filled with water, indicate "no")'
survey_water_feature_indoor 'A built-in indoor water feature (like a water fountain or water pond)'
survey_greenhouse_indoor 'Indoor garden or greenhouse'
.

recode q3
(1=0) (2=1) (ELSE=COPY)
into
survey_other_features
.
value labels survey_disposal to survey_other_features
0 'No' 1 'Yes'
.
variable labels
survey_other_features 'Do you have any water-using appliances and fixtures that were not listed in Questions #1 and #2?'
.

*
* TODO: q3 verbatims
*. 

missing values q4a to q4d (6).
compute survey_number_of_toilets_GT16=(q4a - 1).
compute survey_number_of_toilets_16=(q4b - 1).
compute survey_number_of_toilets_HET=(q4c - 1).
compute survey_number_of_toilets_dual=(q4d - 1).

missing values q5a to q5c (6).
compute survey_number_of_showers_hydra=(q5a - 1).
compute survey_number_of_showers_rain=(q5b - 1).
compute survey_number_of_showers_spray=(q5c - 1).

value labels survey_number_of_toilets_GT16 to survey_number_of_showers_spray 4 '4+'.
variable labels
survey_number_of_toilets_GT16 'Older toilet with a flush volume greater than 1.6 gallons'
survey_number_of_toilets_16 'Flush volume of 1.6 gallons/6.1 liters'
survey_number_of_toilets_HET 'Flush volume of 1.28 gallons/4.84 liters or less'
survey_number_of_toilets_dual 'Dual Flush (~1.6/0.8 gallons/ 6.1/0.3 liters)'
survey_number_of_showers_hydra 'Multiple showerheads'
survey_number_of_showers_rain 'Rain panels (on the ceiling)'
survey_number_of_showers_spray 'Body spray panels (on the wall)'
.

recode q6a to q6d
(2=0) (1=1) (ELSE=COPY) INTO 
survey_replaced_toilets_10
survey_replaced_showerheads_10
survey_replaced_clothes_washer_10
survey_replaced_dishwasher_10
.
variable labels
survey_replaced_toilets_10 'Toilets'
survey_replaced_showerheads_10 'Showerheads'
survey_replaced_clothes_washer_10 'Clothes washer'
survey_replaced_dishwasher_10 'Dishwasher'
.

recode q7a to q7e
(MISSING=0) (ELSE=Copy) INTO
survey_leak_toilet
survey_faucet_drips
survey_leak_pool
survey_leak_irrigation
survey_leak_other
.
variable labels
survey_leak_toilet 'Leaking toilet (you may hear it running when not in use)'
survey_faucet_drips 'Dripping faucet'
survey_leak_pool 'Leaks in your swimming pool system'
survey_leak_irrigation 'Leaks in your irrigation system'
survey_leak_other 'Other water leaks'
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
variable labels
survey_hot_water_gas 'Gas'
survey_hot_water_electric 'Electric'
survey_hot_water_propane 'Propane'
survey_hot_water_solar 'Solar'
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
variable labels
survey_hot_water_wait 'Does hot water take longer to reach some places in your house than others?'
survey_hot_water_wait_kitchen 'kitchen'
survey_hot_water_wait_master_bath 'master bathroom'
survey_hot_water_wait_other_bath 'other bathroom'
survey_hot_water_wait_other_room 'other room'
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
(1=1.0) (2=0.5) (3=0.0) (ELSE=COPY) into
survey_hot_water_wait_bother
.
variable level survey_hot_water_wait_bother (ORDINAL).
value labels survey_hot_water_wait_bother
1.0 "Yes, very much"
0.5 "Yes, a little bit"
0.0 "No, not really"
.
variable labels 
survey_hot_water_waiting 'Thinking of the room where it takes hot water the longest to reach, how long would you say you have to wait for hot water?'
survey_hot_water_wait_bother 'Does the wait for hot water bother you?'
.

recode q12
(2=0) (1=1) (ELSE=Copy) INTO 
survey_irrigation
.

compute survey_landscape_no_maintenance=any(q13, 1).
recode q13
(2=1.0) (4=0.5) (3=0.0) (ELSE=COPY) into
survey_landscaper
.
variable level survey_landscaper (ORDINAL).
value labels survey_landscaper
1.0 "I/We hire a company (or individual) to handle most or all of our landscape maintenance."
0.0 "I/We do most of the work ourselves."
0.5 "A combination, some I/we do ourselves, some I/we hire out for."
.

recode q14
(2=0) (1=1) (ELSE=COPY) INTO 
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

value labels survey_irrigation survey_landscape_no_maintenance survey_landscaper_waters to survey_gray_water
0 'No' 1 'Yes'
.
variable labels
survey_irrigation 'Do you regularly water your outside landscape? (Includes hand watering, irrigation system, hose and sprinkler, or other method.)'
survey_landscaper 'How do you maintain your landscape and garden?'
survey_landscaper_waters 'Is your landscape service provider responsible for adjusting your outdoor landscape watering schedule?'
survey_well 'Well water'
survey_canal_ditch 'Canal/ditch'
survey_stream 'Stream/river'
survey_rain_barrel 'Rain barrel or cistern (rainwater harvesting)'
survey_roof_direction 'Directing roof/rain water towards plants in the yard'
survey_gray_water 'Graywater reuse from indoor fixtures'
.

*
* TODO: q15h verbatim?
*.

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
(2=0) (1=1) (ELSE=COPY) INTO 
survey_irrigation_inground
.

recode q20a to q20e
(MISSING=0) (ELSE=Copy) INTO
survey_irrigation_inground_timer
survey_irrigation_inground_wbic1
survey_irrigation_inground_master
survey_irrigation_inground_bfp
survey_irrigation_inground_drip
.

variable labels
survey_other_sources_pct 'About how much of your outdoor irrigation water comes from the source(s) above (assuming the rest comes from water supplier)?'
survey_landscape_turf 'Lawn/grass/turf (any variety)'
survey_landscape_trees_and_shrubs 'Trees and shrubs'
survey_garden_veggie 'Vegetable garden'
survey_garden_flower 'Flower garden'
survey_landscape_low_water 'Low-water use trees, shrubs, and plants'
survey_landscape_nonirrigated 'Non-watered ground cover (mulch, gravel, rocks, artificial turf, etc.)'
survey_manual_irrigation_pct 'About how much of your outdoor landscape is watered by hand/manually?'
survey_irrigation_inground 'Do you have an in-ground irrigation/sprinkling system?'
survey_irrigation_inground_timer 'Automatic timer/controller'
survey_irrigation_inground_master 'Master valve'
survey_irrigation_inground_bfp 'Back-flow preventer (anti-siphon device)'
survey_irrigation_inground_drip 'Drip irrigation, micro spray and/or bubbler'
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
variable labels
survey_irrigation_manual_override 'No, but I manually try and turn it off when it rains'
survey_irrigation_sensor_soil 'Yes, soil moisture sensor installed'
survey_irrigation_sensor_rain 'Yes, rain shut-off sensor installed'
.

*
* TODO: q21a q21e q21f
*.

recode q22
(1=0) (3=1) (4=4) (5=12) (6=52)
into
survey_irrigation_inground_timer_adjusted.

value labels survey_irrigation_inground_timer_adjusted
0 "I use the factory settings that came with the timer"
1 "About once a year, at the start of the irrigation season"
4 "About 4 times a year/quarterly"
12 "About once a month"
52 "About once a week or more"
.

compute survey_irrigation_inground_wbic2=any(q22,2).
compute survey_irrigation_inground_wbic=any(1, survey_irrigation_inground_wbic1, survey_irrigation_inground_wbic2).
value labels survey_irrigation_inground_wbic
0 'No' 1 'Yes'
.

RECODE q23
(2=0) (1=1) (ELSE=COPY) INTO
survey_spa_or_hot_tub_outdoor
.

recode q24
(1=1.0) (2=0.5) (3=0.0) (ELSE=COPY) into
survey_spa_or_hot_tub_outdoor_filled
.
variable level survey_spa_or_hot_tub_outdoor_filled (ORDINAL).
value labels survey_spa_or_hot_tub_outdoor_filled
1.0 "Yes, usually filled"
0.5 "No, sometimes filled"	
0.0 "No, it is never filled"	
.

RECODE q25 q26
(2=0) (1=1) (ELSE=COPY) INTO
survey_water_feature_outdoor
survey_pool
.

value labels
survey_spa_or_hot_tub_outdoor survey_water_feature_outdoor survey_pool
0 'No' 1 'Yes'
.

recode q27
(1=0) (2=1) (ELSE=COPY) into
survey_pool_fill_automatic
.
value labels survey_pool_fill_automatic
0 'Manual'
1 'Automatic'
.

compute survey_pool_cover_chemical=any(q28, 2).
compute survey_pool_cover=any(q28,3,4).
compute survey_pool_cover_overnight=any(q28,4).
value labels
survey_pool_cover_chemical to survey_pool_cover_overnight
0 'No' 1 'Yes'
.

recode q29a q29b
(1=0) (2=5) (3=4) (4=2) (5=1) (6=0.5) (ELSE=COPY) into
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

variable labels
survey_irrigation_inground_timer_adjusted 'How frequently do you (or your landscape company) adjust the run times on your irrigation timer?'
survey_irrigation_inground_wbic 'Weather-based "smart" controller'
survey_spa_or_hot_tub_outdoor 'Does your home have an outdoor spa or hot tub?'
survey_spa_or_hot_tub_outdoor_filled 'Is the outdoor spa or hot tub usually filled?'
survey_water_feature_outdoor 'Do you have an outdoor water feature like a fountain or pond that is filled regularly?'
survey_pool 'Does your home have a swimming pool (indoor and/or outdoor)?'
survey_pool_fill_automatic 'Automatic swimming pool filling/re-filling system'
survey_pool_cover_chemical 'Chemical pool cover'
survey_pool_cover 'What type of swimming pool cover, if any, do you use?'
survey_pool_cover_overnight 'Physical pool cover replaced overnight'
survey_car_washed 'Wash a car / personal vehicle at home'
survey_walk_washed 'Use a hose to clean the sidewalks, patios and driveways around your home'
.

RECODE q30 q32
(2=0) (1=1) (ELSE=Copy) INTO
survey_program_participation_3
survey_conservation_last_few
.

recode q31a to q31d
(MISSING=0) (ELSE=COPY) INTO
survey_giveaway_3
survey_retrofit_rebate_3
survey_landscape_rebate_3
survey_followed_guidelines
.
value labels survey_program_participation_3 to survey_followed_guidelines
0 'No' 1 'Yes'
.
variable labels
survey_program_participation_3 'In the past three years, have you participated in a water conservation program sponsored by your local water utility?'
survey_conservation_last_few 'In the last several years, has your household taken any action to conserve water, or are you currently engaging in water conservation practices?'
survey_giveaway_3 'A water fixture give-away or exchange program'
survey_retrofit_rebate_3 'A water fixture or water appliance rebate program (i.e., get reimbursed some or all of the cost of purchasing a high efficiency water fixture or appliance)'
survey_landscape_rebate_3 'A landscape rebate for removing lawn or high water use plants or increasing the efficiency of the irrigation system'
survey_followed_guidelines 'Followed water conservation guidelines set by the water utility'
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
value labels survey_replaced_clothes_washer_HE to survey_rain_barrel_last_few
0 'No' 1 'Yes'.
variable labels
survey_replaced_clothes_washer_HE 'Installed water-efficient clothes washer'
survey_conservation_shower_short 'Take shorter showers'
survey_replaced_showerheads_LF 'Installed low-flow showerheads'
survey_toilet_inserts 'Installed water savers (inserts) in toilet'
survey_replaced_toilets_last_few 'Installed new toilet(s)'
survey_disposal_used_less 'Use garbage disposal less often'
survey_dishwasher_used_less 'Use dishwasher less/use fuller loads'
survey_clothes_washer_used_less 'Use clothes washer less/use fuller loads'
survey_faucet_drips_repaired 'Repaired leaks in faucet/toilet'
survey_audit_last_few 'Had a home water audit/survey done'
survey_shower_bucket 'Catch water in bucket to re-use while waiting for water to get hot'
survey_replaced_dishwasher_HE 'Installed water-efficient dishwasher'
survey_car_washed_less_often 'Wash car less often'
survey_irrigation_less_often 'Water lawn and shrubs less often'
survey_irrigation_avoid_heat 'Avoid watering lawn and shrubs during the heat of the day'
survey_landscape_low_water_last_few 'Installed low-water-use landscaping/plants'
survey_irrigation_timer_shortened_last_few 'Reduced run-times on automatic sprinklers'
survey_leak_irrigation_repaired 'Repaired damaged or leaking irrigation system'
survey_irrigation_inground_monitor 'Monitor irrigation system for leaks, blown heads, etc.'
survey_irrigation_inground_cycle 'Cycle irrigate lawns (e.g., 5 min. on, 1 hour off, repeated several times or similar arrangement)'
survey_gray_water_last_few 'Use graywater/reuse household water'
survey_rain_barrel_last_few 'Installed a rain barrel or cistern'
.

*
* TODO: q33l verbatim
*.

recode q34
(1=0.0) (2=0.33) (3=0.67) (4=1.0) (ELSE=COPY) into
survey_drought
.
variable level survey_drought (ORDINAL).
value labels survey_drought
0 "No drought"
0.33 "Mild drought"
0.67 "Moderate drought"
1.0 "Severe drought"
.
variable label survey_drought 'At the present time, would you say that your community is experiencing:'.

*
* q35 is site-dependent
*.

*
* Clayton county has a tri-state q36:
*.
recode q36
(2=0) (1=1) (4=0.5) (ELSE=COPY) INTO
survey_household_pays
.
value labels survey_household_pays
0 "Landlord or a homeowner's association pays"
0.5 "It's a combination, the household pays for inside water use and the HOA pays for all or part of the landscape irrigation"
1 "Household pays"
. 
variable labels
survey_household_pays "Is your household responsible for paying the water bill, OR does a landlord or homeowners' association pay it?"
.

recode q37
(1=1940) (2=1945) (3=1955) (4=1965) (5=1975) (6=1985) (7=1992) (8=1997.5) (9=2003) (10=2006) (ELSE=COPY) into
survey_year_built
.
compute survey_age_of_home=(survey_year-survey_year_built).
value labels survey_year_built
1940 "Before 1940"
1945 "In the 1940s"
1955 "In the 1950s"
1965 "In the 1960s"
1975 "In the 1970s"
1985 "In the 1980s"
1992 "Between 1990 and 1994"
1997.5 "Between 1995 and 2000"
2003 "Between 2001 and 2005"
2006 "After 2006"
.

rename variables q38=survey_year_moved_in.
compute survey_years_in_home=(survey_year-survey_year_moved_in).

variable labels
survey_age_of_home "House age (years)"
survey_year_built "When was your home built?"
survey_year_moved_in "In what year did you move to this home?"
survey_years_in_home "Residency (years)"
.

recode q39
(2=0) (1=1) (ELSE=COPY) INTO
survey_renter
.
value labels survey_renter
0 'Own' 1 'Rent'
.
variable labels
survey_renter 'Do you rent or own your home?'
.

* missing values q40 to q41d (0).
rename variables
q40=survey_number_of_bedrooms
q41a=survey_number_of_adults
q41b=survey_number_of_teenagers
q41c=survey_number_of_children
q41d=survey_number_of_infants
q41e=capita
.

* compute capita=sum(survey_number_of_adults to survey_number_of_infants).

compute survey_homies=(q42 - 1).
compute survey_adults_employed=(q43 - 1).
compute survey_baths_per_week=(q44 - 1).
compute survey_showers_not_at_home=(q45 - 1).

value labels survey_homies to survey_showers_not_at_home 5 '5+'.
variable labels
survey_homies 'What number of adults living at this address are usually at home during the day on a weekday (i.e., not at work outside the home or a full-time student)?'
survey_adults_employed 'What is the number of adults living at this address who are employed full or part-time?'
survey_baths_per_week 'About how many times per week does someone take a bath (in a bathtub) in your household?'
survey_showers_not_at_home 'About how many times per week does someone in your home take a shower at an athletic club or recreation center instead of at home?'
.

recode q46
(1=10) (2=12) (3=13) (4=14) (5=16) (6=18) (ELSE=COPY) into
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
(ELSE=COPY)
into
survey_income
.
formats survey_income (DOLLAR6.0).
value labels survey_income 25000 '$25,000 or less' 200000 '$200,000 or more'.

recode partic
(1=0) (MISSING=1) (ELSE=COPY) into
survey_participant
.
value labels survey_participant 0 'No' 1 'Yes'.

variable labels
survey_highest_grade 'What is the highest level of education in the household?'
survey_income 'About how much was your household''s total income before taxes for all of 2010? (Please include in your total income money from all sources for all persons living in your household.)'
survey_participant 'Agree to participate'
.

insert file="common_reuws2_roles.sps".