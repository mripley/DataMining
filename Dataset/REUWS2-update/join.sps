*
* Before running this,
* Collect city fields: ServiceCity = City serv_city 
* Collect zip code fields: ServiceZip = Postal Zip serv_zip
* Collect meter size fields: MeterSize = MeterSizeDesc meter_size
* Collect meter model fields: MeterModel = ModelDesc Model
* Collect state fields: ServiceState = St serv_state
* Collect meter manufacturer codes: MeterMake = ManfCode manufacturer
*.

*
* Switch to task 5
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".

ADD FILES 
/file="Clayton_county/Normalized.sav"
/file="Denver/Normalized.sav"
/file="Fort_Collins/Normalized.sav"
/file="Scottsdale/Normalized.sav"
.
variable level NonseasonalKgal (scale) utility (nominal).
EXECUTE.

cd "S:\local\home\matt".
cd "Data_Mining_project\Dataset\REUWS2-update".
insert file="cleaning.sps".
EXECUTE.

SAVE TRANSLATE /TYPE=ODBC
  /CONNECT='DSN=MS Access Database;DBQ='+
    'S:\local\home\matt\Data_Mining_project\Dataset\REUWS2-update\REUWS2-update.mdb;DriverId='+
    '25;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;'
  /ENCRYPTED
  /MISSING=RECODE
  /SQL='CREATE TABLE tblREUWS2 (ServiceCity varchar (255), ServiceState varchar (2), ServiceZip '+
    'varchar (5), MeterMake varchar (255), MeterModel varchar (255), MeterSize varchar (255), '+
    'MeterLocation varchar (255), dateofaccountinitiation datetime , SampleReads double , '+
    'SampleBegins datetime , SampleEnds datetime , AnnualKgal double , SeasonalKgal double , '+
    'NonseasonalKgal double , PctSeasonal double , Log_AnnualKgal_Bin double , wave double , '+
    '`language` double , q8c double , q8d double , q15a double , q15h double , q20f double , q21a '+
    'double , q31e double , q33l double , Clayton_attitude_A double , Clayton_attitude_B double , '+
    'Clayton_attitude_C double , Clayton_attitude_D double , survey_year_moved_in double , '+
    'survey_number_of_bedrooms double , survey_number_of_adults double , '+
    'survey_number_of_teenagers double , survey_number_of_children double , '+
    'survey_number_of_infants double , capita double , utility double , PrimaryFirst double , '+
    'survey_year double , survey_number_of_toilets double , survey_number_of_bathtub_showers '+
    'double , survey_number_of_bathtub_only double , survey_number_of_whirlpools double , '+
    'survey_number_of_shower_only double , survey_number_of_utility_sink double , '+
    'survey_number_of_bathtubs double , survey_number_of_showers double , survey_disposal double , '+
    'survey_ice_maker double , survey_dishwasher double , survey_clothes_washer_HE double , '+
    'survey_hot_water_tankless double , survey_hot_water_on_demand double , survey_evap_cooler '+
    'double , survey_humidifier double , survey_treatment double , survey_aquarium double , '+
    'survey_pets double , survey_spa_indoor double , survey_water_feature_indoor double , '+
    'survey_greenhouse_indoor double , survey_other_features double , '+
    'survey_number_of_toilets_GT16 double , survey_number_of_toilets_16 double , '+
    'survey_number_of_toilets_HET double , survey_number_of_toilets_dual double , '+
    'survey_number_of_showers_hydra double , survey_number_of_showers_rain double , '+
    'survey_number_of_showers_spray double , survey_replaced_toilets_10 double , '+
    'survey_replaced_showerheads_10 double , survey_replaced_clothes_washer_10 double , '+
    'survey_replaced_dishwasher_10 double , survey_leak_toilet double , survey_faucet_drips double '+
    ', survey_leak_pool double , survey_leak_irrigation double , survey_leak_other double , '+
    'survey_hot_water_gas double , survey_hot_water_electric double , survey_hot_water_propane '+
    'double , survey_hot_water_solar double , survey_hot_water_wait double , '+
    'survey_hot_water_wait_kitchen double , survey_hot_water_wait_master_bath double , '+
    'survey_hot_water_wait_other_bath double , survey_hot_water_wait_other_room double , '+
    'survey_hot_water_waiting double , survey_hot_water_wait_bother double , survey_irrigation '+
    'double , survey_landscape_no_maintenance double , survey_landscaper double , '+
    'survey_landscaper_waters double , survey_well double , survey_canal_ditch double , '+
    'survey_stream double , survey_rain_barrel double , survey_roof_direction double , '+
    'survey_gray_water double , survey_other_sources_pct double , survey_landscape_turf double , '+
    'survey_landscape_trees_and_shrubs double , survey_garden_veggie double , survey_garden_flower '+
    'double , survey_landscape_low_water double , survey_landscape_nonirrigated double , '+
    'survey_manual_irrigation_pct double , survey_irrigation_inground double , '+
    'survey_irrigation_inground_timer double , survey_irrigation_inground_master double , '+
    'survey_irrigation_inground_bfp double , survey_irrigation_inground_drip double , '+
    'survey_irrigation_manual_override double , survey_irrigation_sensor_soil double , '+
    'survey_irrigation_sensor_rain double , survey_irrigation_inground_timer_adjusted double , '+
    'survey_irrigation_inground_wbic double , survey_spa_or_hot_tub_outdoor double , '+
    'survey_spa_or_hot_tub_outdoor_filled double , survey_water_feature_outdoor double , '+
    'survey_pool double , survey_pool_fill_automatic double , survey_pool_cover_chemical double , '+
    'survey_pool_cover double , survey_pool_cover_overnight double , survey_car_washed double , '+
    'survey_walk_washed double , survey_program_participation_3 double , '+
    'survey_conservation_last_few double , survey_giveaway_3 double , survey_retrofit_rebate_3 '+
    'double , survey_landscape_rebate_3 double , survey_followed_guidelines double , '+
    'survey_replaced_clothes_washer_HE double , survey_conservation_shower_short double , '+
    'survey_replaced_showerheads_LF double , survey_toilet_inserts double , '+
    'survey_replaced_toilets_last_few double , survey_disposal_used_less double , '+
    'survey_dishwasher_used_less double , survey_clothes_washer_used_less double , '+
    'survey_faucet_drips_repaired double , survey_audit_last_few double , survey_shower_bucket '+
    'double , survey_replaced_dishwasher_HE double , survey_car_washed_less_often double , '+
    'survey_irrigation_less_often double , survey_irrigation_avoid_heat double , '+
    'survey_landscape_low_water_last_few double , survey_irrigation_timer_shortened_last_few '+
    'double , survey_leak_irrigation_repaired double , survey_irrigation_inground_monitor double , '+
    'survey_irrigation_inground_cycle double , survey_gray_water_last_few double , '+
    'survey_rain_barrel_last_few double , survey_drought double , survey_household_pays double , '+
    'survey_year_built double , survey_age_of_home double , survey_years_in_home double , '+
    'survey_renter double , survey_homies double , survey_adults_employed double , '+
    'survey_baths_per_week double , survey_showers_not_at_home double , survey_highest_grade '+
    'double , survey_income currency , survey_participant double , reuws2_attitude_A double , '+
    'reuws2_attitude_B double , reuws2_attitude_C double , reuws2_attitude_D double , '+
    'reuws2_attitude_E double , reuws2_attitude_F double , reuws2_attitude_G double , '+
    'reuws2_attitude_H double , reuws2_attitude_I double , reuws2_attitude_J double , '+
    'reuws2_attitude_K double , reuws2_attitude_L double , reuws2_attitude_M double , '+
    'reuws2_attitude_N double , reuws2_attitude_O double , reuws2_attitude_P double , '+
    'reuws2_attitude_Q double , reuws2_attitude_R double , reuws2_attitude_S double , imported '+
    'datetime , MeterSPTypeDesc varchar (24), Dateactive datetime , SampleDays double , AverageGPD '+
    'double , WinterReads double , Fort_Collins_attitude_A double , PremiseYear double , '+
    'Scottsdale_aerator_rebates double , Scottsdale_irrigation_controller_rebates double , '+
    'Scottsdale_hot_water_recirculator_rebates double , Scottsdale_showerhead_rebates double , '+
    'Scottsdale_toilet_rebates double , Scottsdale_turf_rebates double , Scottsdale_attitude_A '+
    'double , Scottsdale_attitude_B double , Scottsdale_attitude_C double , SurveyID double  NOT '+
    'NULL, PRIMARY KEY (SurveyID) )'
  /REPLACE
  /TABLE='SPSS_TEMP'
  /KEEP=ServiceCity, ServiceState, ServiceZip, MeterMake, MeterModel, MeterSize, MeterLocation, 
    dateofaccountinitiation, SampleReads, SampleBegins, SampleEnds, AnnualKgal, SeasonalKgal, 
    NonseasonalKgal, PctSeasonal, Log_AnnualKgal_Bin, wave, language, q8c, q8d, q15a, q15h, q20f, q21a, 
    q31e, q33l, Clayton_attitude_A, Clayton_attitude_B, Clayton_attitude_C, Clayton_attitude_D, 
    survey_year_moved_in, survey_number_of_bedrooms, survey_number_of_adults, 
    survey_number_of_teenagers, survey_number_of_children, survey_number_of_infants, capita, utility, 
    PrimaryFirst, survey_year, survey_number_of_toilets, survey_number_of_bathtub_showers, 
    survey_number_of_bathtub_only, survey_number_of_whirlpools, survey_number_of_shower_only, 
    survey_number_of_utility_sink, survey_number_of_bathtubs, survey_number_of_showers, 
    survey_disposal, survey_ice_maker, survey_dishwasher, survey_clothes_washer_HE, 
    survey_hot_water_tankless, survey_hot_water_on_demand, survey_evap_cooler, survey_humidifier, 
    survey_treatment, survey_aquarium, survey_pets, survey_spa_indoor, survey_water_feature_indoor, 
    survey_greenhouse_indoor, survey_other_features, survey_number_of_toilets_GT16, 
    survey_number_of_toilets_16, survey_number_of_toilets_HET, survey_number_of_toilets_dual, 
    survey_number_of_showers_hydra, survey_number_of_showers_rain, survey_number_of_showers_spray, 
    survey_replaced_toilets_10, survey_replaced_showerheads_10, survey_replaced_clothes_washer_10, 
    survey_replaced_dishwasher_10, survey_leak_toilet, survey_faucet_drips, survey_leak_pool, 
    survey_leak_irrigation, survey_leak_other, survey_hot_water_gas, survey_hot_water_electric, 
    survey_hot_water_propane, survey_hot_water_solar, survey_hot_water_wait, 
    survey_hot_water_wait_kitchen, survey_hot_water_wait_master_bath, survey_hot_water_wait_other_bath, 
    survey_hot_water_wait_other_room, survey_hot_water_waiting, survey_hot_water_wait_bother, 
    survey_irrigation, survey_landscape_no_maintenance, survey_landscaper, survey_landscaper_waters, 
    survey_well, survey_canal_ditch, survey_stream, survey_rain_barrel, survey_roof_direction, 
    survey_gray_water, survey_other_sources_pct, survey_landscape_turf, 
    survey_landscape_trees_and_shrubs, survey_garden_veggie, survey_garden_flower, 
    survey_landscape_low_water, survey_landscape_nonirrigated, survey_manual_irrigation_pct, 
    survey_irrigation_inground, survey_irrigation_inground_timer, survey_irrigation_inground_master, 
    survey_irrigation_inground_bfp, survey_irrigation_inground_drip, survey_irrigation_manual_override, 
    survey_irrigation_sensor_soil, survey_irrigation_sensor_rain, 
    survey_irrigation_inground_timer_adjusted, survey_irrigation_inground_wbic, 
    survey_spa_or_hot_tub_outdoor, survey_spa_or_hot_tub_outdoor_filled, survey_water_feature_outdoor, 
    survey_pool, survey_pool_fill_automatic, survey_pool_cover_chemical, survey_pool_cover, 
    survey_pool_cover_overnight, survey_car_washed, survey_walk_washed, survey_program_participation_3, 
    survey_conservation_last_few, survey_giveaway_3, survey_retrofit_rebate_3, 
    survey_landscape_rebate_3, survey_followed_guidelines, survey_replaced_clothes_washer_HE, 
    survey_conservation_shower_short, survey_replaced_showerheads_LF, survey_toilet_inserts, 
    survey_replaced_toilets_last_few, survey_disposal_used_less, survey_dishwasher_used_less, 
    survey_clothes_washer_used_less, survey_faucet_drips_repaired, survey_audit_last_few, 
    survey_shower_bucket, survey_replaced_dishwasher_HE, survey_car_washed_less_often, 
    survey_irrigation_less_often, survey_irrigation_avoid_heat, survey_landscape_low_water_last_few, 
    survey_irrigation_timer_shortened_last_few, survey_leak_irrigation_repaired, 
    survey_irrigation_inground_monitor, survey_irrigation_inground_cycle, survey_gray_water_last_few, 
    survey_rain_barrel_last_few, survey_drought, survey_household_pays, survey_year_built, 
    survey_age_of_home, survey_years_in_home, survey_renter, survey_homies, survey_adults_employed, 
    survey_baths_per_week, survey_showers_not_at_home, survey_highest_grade, survey_income, 
    survey_participant, reuws2_attitude_A, reuws2_attitude_B, reuws2_attitude_C, reuws2_attitude_D, 
    reuws2_attitude_E, reuws2_attitude_F, reuws2_attitude_G, reuws2_attitude_H, reuws2_attitude_I, 
    reuws2_attitude_J, reuws2_attitude_K, reuws2_attitude_L, reuws2_attitude_M, reuws2_attitude_N, 
    reuws2_attitude_O, reuws2_attitude_P, reuws2_attitude_Q, reuws2_attitude_R, reuws2_attitude_S, 
    imported, MeterSPTypeDesc, Dateactive, SampleDays, AverageGPD, WinterReads, 
    Fort_Collins_attitude_A, PremiseYear, Scottsdale_aerator_rebates, 
    Scottsdale_irrigation_controller_rebates, Scottsdale_hot_water_recirculator_rebates, 
    Scottsdale_showerhead_rebates, Scottsdale_toilet_rebates, Scottsdale_turf_rebates, 
    Scottsdale_attitude_A, Scottsdale_attitude_B, Scottsdale_attitude_C, SurveyID
  /SQL='INSERT INTO tblREUWS2 (ServiceCity, ServiceState, ServiceZip, MeterMake, MeterModel, '+
    'MeterSize, MeterLocation, dateofaccountinitiation, SampleReads, SampleBegins, SampleEnds, '+
    'AnnualKgal, SeasonalKgal, NonseasonalKgal, PctSeasonal, Log_AnnualKgal_Bin, wave, `language`, '+
    'q8c, q8d, q15a, q15h, q20f, q21a, q31e, q33l, Clayton_attitude_A, Clayton_attitude_B, '+
    'Clayton_attitude_C, Clayton_attitude_D, survey_year_moved_in, survey_number_of_bedrooms, '+
    'survey_number_of_adults, survey_number_of_teenagers, survey_number_of_children, '+
    'survey_number_of_infants, capita, utility, PrimaryFirst, survey_year, '+
    'survey_number_of_toilets, survey_number_of_bathtub_showers, survey_number_of_bathtub_only, '+
    'survey_number_of_whirlpools, survey_number_of_shower_only, survey_number_of_utility_sink, '+
    'survey_number_of_bathtubs, survey_number_of_showers, survey_disposal, survey_ice_maker, '+
    'survey_dishwasher, survey_clothes_washer_HE, survey_hot_water_tankless, '+
    'survey_hot_water_on_demand, survey_evap_cooler, survey_humidifier, survey_treatment, '+
    'survey_aquarium, survey_pets, survey_spa_indoor, survey_water_feature_indoor, '+
    'survey_greenhouse_indoor, survey_other_features, survey_number_of_toilets_GT16, '+
    'survey_number_of_toilets_16, survey_number_of_toilets_HET, survey_number_of_toilets_dual, '+
    'survey_number_of_showers_hydra, survey_number_of_showers_rain, '+
    'survey_number_of_showers_spray, survey_replaced_toilets_10, survey_replaced_showerheads_10, '+
    'survey_replaced_clothes_washer_10, survey_replaced_dishwasher_10, survey_leak_toilet, '+
    'survey_faucet_drips, survey_leak_pool, survey_leak_irrigation, survey_leak_other, '+
    'survey_hot_water_gas, survey_hot_water_electric, survey_hot_water_propane, '+
    'survey_hot_water_solar, survey_hot_water_wait, survey_hot_water_wait_kitchen, '+
    'survey_hot_water_wait_master_bath, survey_hot_water_wait_other_bath, '+
    'survey_hot_water_wait_other_room, survey_hot_water_waiting, survey_hot_water_wait_bother, '+
    'survey_irrigation, survey_landscape_no_maintenance, survey_landscaper, '+
    'survey_landscaper_waters, survey_well, survey_canal_ditch, survey_stream, survey_rain_barrel, '+
    'survey_roof_direction, survey_gray_water, survey_other_sources_pct, survey_landscape_turf, '+
    'survey_landscape_trees_and_shrubs, survey_garden_veggie, survey_garden_flower, '+
    'survey_landscape_low_water, survey_landscape_nonirrigated, survey_manual_irrigation_pct, '+
    'survey_irrigation_inground, survey_irrigation_inground_timer, '+
    'survey_irrigation_inground_master, survey_irrigation_inground_bfp, '+
    'survey_irrigation_inground_drip, survey_irrigation_manual_override, '+
    'survey_irrigation_sensor_soil, survey_irrigation_sensor_rain, '+
    'survey_irrigation_inground_timer_adjusted, survey_irrigation_inground_wbic, '+
    'survey_spa_or_hot_tub_outdoor, survey_spa_or_hot_tub_outdoor_filled, '+
    'survey_water_feature_outdoor, survey_pool, survey_pool_fill_automatic, '+
    'survey_pool_cover_chemical, survey_pool_cover, survey_pool_cover_overnight, '+
    'survey_car_washed, survey_walk_washed, survey_program_participation_3, '+
    'survey_conservation_last_few, survey_giveaway_3, survey_retrofit_rebate_3, '+
    'survey_landscape_rebate_3, survey_followed_guidelines, survey_replaced_clothes_washer_HE, '+
    'survey_conservation_shower_short, survey_replaced_showerheads_LF, survey_toilet_inserts, '+
    'survey_replaced_toilets_last_few, survey_disposal_used_less, survey_dishwasher_used_less, '+
    'survey_clothes_washer_used_less, survey_faucet_drips_repaired, survey_audit_last_few, '+
    'survey_shower_bucket, survey_replaced_dishwasher_HE, survey_car_washed_less_often, '+
    'survey_irrigation_less_often, survey_irrigation_avoid_heat, '+
    'survey_landscape_low_water_last_few, survey_irrigation_timer_shortened_last_few, '+
    'survey_leak_irrigation_repaired, survey_irrigation_inground_monitor, '+
    'survey_irrigation_inground_cycle, survey_gray_water_last_few, survey_rain_barrel_last_few, '+
    'survey_drought, survey_household_pays, survey_year_built, survey_age_of_home, '+
    'survey_years_in_home, survey_renter, survey_homies, survey_adults_employed, '+
    'survey_baths_per_week, survey_showers_not_at_home, survey_highest_grade, survey_income, '+
    'survey_participant, reuws2_attitude_A, reuws2_attitude_B, reuws2_attitude_C, '+
    'reuws2_attitude_D, reuws2_attitude_E, reuws2_attitude_F, reuws2_attitude_G, '+
    'reuws2_attitude_H, reuws2_attitude_I, reuws2_attitude_J, reuws2_attitude_K, '+
    'reuws2_attitude_L, reuws2_attitude_M, reuws2_attitude_N, reuws2_attitude_O, '+
    'reuws2_attitude_P, reuws2_attitude_Q, reuws2_attitude_R, reuws2_attitude_S, imported, '+
    'MeterSPTypeDesc, Dateactive, SampleDays, AverageGPD, WinterReads, Fort_Collins_attitude_A, '+
    'PremiseYear, Scottsdale_aerator_rebates, Scottsdale_irrigation_controller_rebates, '+
    'Scottsdale_hot_water_recirculator_rebates, Scottsdale_showerhead_rebates, '+
    'Scottsdale_toilet_rebates, Scottsdale_turf_rebates, Scottsdale_attitude_A, '+
    'Scottsdale_attitude_B, Scottsdale_attitude_C, SurveyID) SELECT ServiceCity, ServiceState, '+
    'ServiceZip, MeterMake, MeterModel, MeterSize, MeterLocation, dateofaccountinitiation, '+
    'SampleReads, SampleBegins, SampleEnds, AnnualKgal, SeasonalKgal, NonseasonalKgal, '+
    'PctSeasonal, Log_AnnualKgal_Bin, wave, `language`, q8c, q8d, q15a, q15h, q20f, q21a, q31e, '+
    'q33l, Clayton_attitude_A, Clayton_attitude_B, Clayton_attitude_C, Clayton_attitude_D, '+
    'survey_year_moved_in, survey_number_of_bedrooms, survey_number_of_adults, '+
    'survey_number_of_teenagers, survey_number_of_children, survey_number_of_infants, capita, '+
    'utility, PrimaryFirst, survey_year, survey_number_of_toilets, '+
    'survey_number_of_bathtub_showers, survey_number_of_bathtub_only, survey_number_of_whirlpools, '+
    'survey_number_of_shower_only, survey_number_of_utility_sink, survey_number_of_bathtubs, '+
    'survey_number_of_showers, survey_disposal, survey_ice_maker, survey_dishwasher, '+
    'survey_clothes_washer_HE, survey_hot_water_tankless, survey_hot_water_on_demand, '+
    'survey_evap_cooler, survey_humidifier, survey_treatment, survey_aquarium, survey_pets, '+
    'survey_spa_indoor, survey_water_feature_indoor, survey_greenhouse_indoor, '+
    'survey_other_features, survey_number_of_toilets_GT16, survey_number_of_toilets_16, '+
    'survey_number_of_toilets_HET, survey_number_of_toilets_dual, survey_number_of_showers_hydra, '+
    'survey_number_of_showers_rain, survey_number_of_showers_spray, survey_replaced_toilets_10, '+
    'survey_replaced_showerheads_10, survey_replaced_clothes_washer_10, '+
    'survey_replaced_dishwasher_10, survey_leak_toilet, survey_faucet_drips, survey_leak_pool, '+
    'survey_leak_irrigation, survey_leak_other, survey_hot_water_gas, survey_hot_water_electric, '+
    'survey_hot_water_propane, survey_hot_water_solar, survey_hot_water_wait, '+
    'survey_hot_water_wait_kitchen, survey_hot_water_wait_master_bath, '+
    'survey_hot_water_wait_other_bath, survey_hot_water_wait_other_room, survey_hot_water_waiting, '+
    'survey_hot_water_wait_bother, survey_irrigation, survey_landscape_no_maintenance, '+
    'survey_landscaper, survey_landscaper_waters, survey_well, survey_canal_ditch, survey_stream, '+
    'survey_rain_barrel, survey_roof_direction, survey_gray_water, survey_other_sources_pct, '+
    'survey_landscape_turf, survey_landscape_trees_and_shrubs, survey_garden_veggie, '+
    'survey_garden_flower, survey_landscape_low_water, survey_landscape_nonirrigated, '+
    'survey_manual_irrigation_pct, survey_irrigation_inground, survey_irrigation_inground_timer, '+
    'survey_irrigation_inground_master, survey_irrigation_inground_bfp, '+
    'survey_irrigation_inground_drip, survey_irrigation_manual_override, '+
    'survey_irrigation_sensor_soil, survey_irrigation_sensor_rain, '+
    'survey_irrigation_inground_timer_adjusted, survey_irrigation_inground_wbic, '+
    'survey_spa_or_hot_tub_outdoor, survey_spa_or_hot_tub_outdoor_filled, '+
    'survey_water_feature_outdoor, survey_pool, survey_pool_fill_automatic, '+
    'survey_pool_cover_chemical, survey_pool_cover, survey_pool_cover_overnight, '+
    'survey_car_washed, survey_walk_washed, survey_program_participation_3, '+
    'survey_conservation_last_few, survey_giveaway_3, survey_retrofit_rebate_3, '+
    'survey_landscape_rebate_3, survey_followed_guidelines, survey_replaced_clothes_washer_HE, '+
    'survey_conservation_shower_short, survey_replaced_showerheads_LF, survey_toilet_inserts, '+
    'survey_replaced_toilets_last_few, survey_disposal_used_less, survey_dishwasher_used_less, '+
    'survey_clothes_washer_used_less, survey_faucet_drips_repaired, survey_audit_last_few, '+
    'survey_shower_bucket, survey_replaced_dishwasher_HE, survey_car_washed_less_often, '+
    'survey_irrigation_less_often, survey_irrigation_avoid_heat, '+
    'survey_landscape_low_water_last_few, survey_irrigation_timer_shortened_last_few, '+
    'survey_leak_irrigation_repaired, survey_irrigation_inground_monitor, '+
    'survey_irrigation_inground_cycle, survey_gray_water_last_few, survey_rain_barrel_last_few, '+
    'survey_drought, survey_household_pays, survey_year_built, survey_age_of_home, '+
    'survey_years_in_home, survey_renter, survey_homies, survey_adults_employed, '+
    'survey_baths_per_week, survey_showers_not_at_home, survey_highest_grade, survey_income, '+
    'survey_participant, reuws2_attitude_A, reuws2_attitude_B, reuws2_attitude_C, '+
    'reuws2_attitude_D, reuws2_attitude_E, reuws2_attitude_F, reuws2_attitude_G, '+
    'reuws2_attitude_H, reuws2_attitude_I, reuws2_attitude_J, reuws2_attitude_K, '+
    'reuws2_attitude_L, reuws2_attitude_M, reuws2_attitude_N, reuws2_attitude_O, '+
    'reuws2_attitude_P, reuws2_attitude_Q, reuws2_attitude_R, reuws2_attitude_S, imported, '+
    'MeterSPTypeDesc, Dateactive, SampleDays, AverageGPD, WinterReads, Fort_Collins_attitude_A, '+
    'PremiseYear, Scottsdale_aerator_rebates, Scottsdale_irrigation_controller_rebates, '+
    'Scottsdale_hot_water_recirculator_rebates, Scottsdale_showerhead_rebates, '+
    'Scottsdale_toilet_rebates, Scottsdale_turf_rebates, Scottsdale_attitude_A, '+
    'Scottsdale_attitude_B, Scottsdale_attitude_C, SurveyID FROM SPSS_TEMP'
  /SQL='DROP TABLE SPSS_TEMP'.
