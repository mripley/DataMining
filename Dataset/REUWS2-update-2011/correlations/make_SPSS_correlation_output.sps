
* OMS.
OMS
  /SELECT TABLES
  /IF COMMANDS=['Correlations'] SUBTYPES=['Correlations']
  /DESTINATION FORMAT=SAV NUMBERED=TableNumber_
   OUTFILE='S:\local\home\matt\Data_Mining_project\Dataset\REUWS2-update\correlations\SPSS_correlation_output.sav'.

*
* Scale
*.
CORRELATIONS
  /VARIABLES=AnnualKgal capita PctSeasonal PremiseYear SeasonalKgal 
    survey_age_of_home survey_income survey_other_sources_pct survey_year survey_year_built 
    survey_years_in_home SurveyID
    reuws2_attitude_A to reuws2_attitude_S 
    survey_car_washed survey_drought survey_highest_grade survey_hot_water_wait_bother 
    survey_hot_water_waiting survey_landscaper survey_manual_irrigation_pct 
    survey_spa_or_hot_tub_outdoor_filled survey_walk_washed RandomSequence
    Clayton_attitude_A Clayton_attitude_B Clayton_attitude_C Clayton_attitude_D 
    Fort_Collins_attitude_A Scottsdale_aerator_rebates Scottsdale_attitude_A Scottsdale_attitude_B 
    Scottsdale_attitude_C Scottsdale_hot_water_recirculator_rebates 
    Scottsdale_irrigation_controller_rebates Scottsdale_showerhead_rebates Scottsdale_toilet_rebates 
    Scottsdale_turf_rebates survey_adults_employed survey_aquarium survey_audit_last_few 
    survey_baths_per_week survey_canal_ditch survey_car_washed_less_often survey_clothes_washer_HE 
    survey_clothes_washer_used_less survey_conservation_last_few survey_conservation_shower_short 
    survey_dishwasher survey_dishwasher_used_less survey_disposal survey_disposal_used_less 
    survey_evap_cooler survey_faucet_drips survey_faucet_drips_repaired survey_followed_guidelines 
    survey_garden_flower survey_garden_veggie survey_giveaway_3 survey_gray_water 
    survey_gray_water_last_few survey_greenhouse_indoor survey_homies survey_hot_water_electric 
    survey_hot_water_gas survey_hot_water_on_demand survey_hot_water_propane survey_hot_water_solar 
    survey_hot_water_tankless survey_hot_water_wait survey_hot_water_wait_kitchen 
    survey_hot_water_wait_master_bath survey_hot_water_wait_other_bath survey_hot_water_wait_other_room 
    survey_household_pays survey_humidifier survey_ice_maker survey_irrigation 
    survey_irrigation_avoid_heat survey_irrigation_inground survey_irrigation_inground_bfp 
    survey_irrigation_inground_cycle survey_irrigation_inground_drip survey_irrigation_inground_master 
    survey_irrigation_inground_monitor survey_irrigation_inground_timer 
    survey_irrigation_inground_timer_adjusted survey_irrigation_inground_wbic 
    survey_irrigation_less_often survey_irrigation_manual_override survey_irrigation_sensor_rain 
    survey_irrigation_sensor_soil survey_irrigation_timer_shortened_last_few survey_landscape_low_water 
    survey_landscape_low_water_last_few survey_landscape_no_maintenance survey_landscape_nonirrigated 
    survey_landscape_rebate_3 survey_landscape_trees_and_shrubs survey_landscape_turf 
    survey_landscaper_waters survey_leak_irrigation survey_leak_irrigation_repaired survey_leak_other 
    survey_leak_pool survey_leak_toilet survey_number_of_adults survey_number_of_bathtub_only 
    survey_number_of_bathtub_showers survey_number_of_bathtubs survey_number_of_bedrooms 
    survey_number_of_children survey_number_of_infants survey_number_of_shower_only 
    survey_number_of_showers survey_number_of_showers_hydra survey_number_of_showers_rain 
    survey_number_of_showers_spray survey_number_of_teenagers survey_number_of_toilets 
    survey_number_of_toilets_16 survey_number_of_toilets_dual survey_number_of_toilets_GT16 
    survey_number_of_toilets_HET survey_number_of_utility_sink survey_number_of_whirlpools 
    survey_other_features survey_participant survey_pets survey_pool survey_pool_cover 
    survey_pool_cover_chemical survey_pool_cover_overnight survey_pool_fill_automatic 
    survey_program_participation_3 survey_rain_barrel survey_rain_barrel_last_few survey_renter 
    survey_replaced_clothes_washer_10 survey_replaced_clothes_washer_HE survey_replaced_dishwasher_10 
    survey_replaced_dishwasher_HE survey_replaced_showerheads_10 survey_replaced_showerheads_LF 
    survey_replaced_toilets_10 survey_replaced_toilets_last_few survey_retrofit_rebate_3 
    survey_roof_direction survey_shower_bucket survey_showers_not_at_home survey_spa_indoor 
    survey_spa_or_hot_tub_outdoor survey_stream survey_toilet_inserts survey_treatment 
    survey_water_feature_indoor survey_water_feature_outdoor survey_well RandomSequence
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

omsend.
