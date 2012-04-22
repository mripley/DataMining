cd 'S:\local\home\matt'.
cd 'csci7000\Project'.
cd 'Dataset'.

insert file="REUWS1/load.sps".
*
* log_residual_by_family.sps also pulls in normalization by state:
*.
insert file="log_residual_by_family.sps".
execute.

SAVE OUTFILE='REUWS1/sample5574-normalized-residuals.sav'
  /COMPRESSED.

SAVE TRANSLATE /TYPE=ODBC
  /CONNECT='DSN=MS Access Database;DBQ='+
    'S:\local\home\matt\csci7000\Project\Dataset\REUWS1\sample5574-normalized-residuals.mdb;DriverI'+
    'd=25;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;'
  /ENCRYPTED
  /MISSING=RECODE
  /SQL='CREATE TABLE spss_output (ServiceCity varchar (50), ServiceState varchar (2), '+
    'meter_size_code varchar (50), SamplingAnnualKgal double , SampleBegins datetime , SampleEnds '+
    'datetime , SampleDays double , irrigated_area_sqft double , NonseasonalKgal double , '+
    'SeasonalKgal double , AnnualKgal double , Imported datetime , STATID double , STATID2 double '+
    ', Q3 double , survey_other_features varchar (255), Q4no double , Q4year double , Q4brand '+
    'varchar (255), Q5no double , Q5year double , Q5brand varchar (255), Q6 double , Q13 double , '+
    'Q14 double , survey_alternative_source varchar (255), survey_irrigation_inground_front double '+
    ', survey_irrigation_inground_back double , survey_irrigation_inground_drip double , '+
    'survey_irrigation_soaker double , survey_irrigation_hose_sprinkler double , '+
    'survey_irrigation_hand double , survey_irrigation_other double , Q20 double , Q23no double , '+
    'Q23length double , Q23width double , Q23depth double , survey_conservation_shower_short '+
    'double , survey_replaced_showerheads_LF double , survey_toilet_inserts double , '+
    'survey_replaced_toilets_ulft double , survey_disposal_used_less double , '+
    'survey_dishwasher_used_less double , survey_clothes_washer_used_less double , '+
    'survey_faucet_drips_repaired double , survey_gray_water_last_few double , '+
    'survey_car_washed_less_often double , survey_irrigation_less_often double , '+
    'survey_irrigation_avoid_heat double , survey_irrigation_xeri double , '+
    'survey_irrigation_inground_timer_adjusted_conservation double , '+
    'survey_irrigation_efficient_system_installed double , survey_irrigation_inground_cycle double '+
    ', survey_has_been_audited double , survey_other_conservation double , '+
    'survey_number_of_adults_winter double , survey_number_of_teenagers_winter double , '+
    'survey_number_of_children_winter double , survey_number_of_adults_summer double , '+
    'survey_number_of_teenagers_summer double , survey_number_of_children_summer double , study '+
    'double , has_survey double , survey_year double , survey_number_of_toilets double , '+
    'survey_number_of_bathtub_showers double , survey_number_of_bathtub_only double , '+
    'survey_number_of_shower_only double , survey_number_of_whirlpools double , '+
    'survey_number_of_bathroom_sinks double , survey_number_of_kitchen_sinks double , '+
    'survey_number_of_utility_sinks double , survey_number_of_bathtubs double , '+
    'survey_number_of_showers double , survey_disposal double , survey_clothes_washer_top double , '+
    'survey_clothes_washer_front double , survey_dishwasher double , survey_pool double , '+
    'survey_hot_tub double , survey_evap_cooler double , survey_pressure_regulator double , '+
    'survey_treatment double , survey_greenhouse double , survey_garden_flower double , '+
    'survey_garden_veggie double , survey_clothes_washer double , survey_aquarium double , '+
    'survey_hot_water_solar double , survey_humidifier double , survey_ice_maker double , '+
    'survey_hot_water_tankless double , survey_water_feature_outdoor_fountain double , '+
    'survey_water_feature_outdoor_pond double , survey_water_feature_outdoor double , '+
    'survey_number_of_showers_lfsh double , survey_number_of_toilets_16 double , '+
    'survey_parcel_sqft double , survey_landscape_pct double , survey_landscape_turf_pct double , '+
    'survey_irrigation_pct double , survey_other_sources double , survey_canal_ditch double , '+
    'survey_cistern double , survey_well double , survey_stream double , '+
    'survey_has_alternative_source double , survey_rain_barrel double , survey_roof_direction '+
    'double , survey_irrigation double , survey_irrigation_inground double , survey_irrigation_HOA '+
    'double , Survey_Irrigation_InGround_Front_Automatic double , '+
    'Survey_Irrigation_InGround_Back_Automatic double , survey_irrigation_inground_timer double , '+
    'survey_irrigation_sensor_rain double , survey_irrigation_sensor_soil double , '+
    'Survey_Car_Washed double , survey_walk_washed double , reuws1_attitude_A double , '+
    'survey_conservation double , survey_drought double , survey_SFR double , survey_has_apartment '+
    'double , survey_separate_meters double , survey_household_pays double , '+
    'survey_number_of_adults double , survey_number_of_teenagers double , '+
    'survey_number_of_children double , capita double , survey_adults_employed double , '+
    'survey_homies double , survey_year_built double , survey_year_moved_in double , '+
    'survey_indoor_sqft double , survey_floors double , survey_renter double , survey_monthly_rent '+
    'currency , survey_home_value currency , survey_highest_grade double , survey_household_income '+
    'currency , TotalVolume double , TraceBegins datetime , TraceEnds datetime , TraceLengthDays '+
    'double , TotalGPD double , IndoorGPD double , OutdoorGPD double , Indoortotalgal double , '+
    'Outdoortotalgal double , Bathtubtotalgal double , Clotheswashertotalgal double , '+
    'Dishwashertotalgal double , Faucettotalgal double , Leaktotalgal double , Othertotalgal '+
    'double , Showertotalgal double , Toilettotalgal double , Bathtubevents double , '+
    'Clotheswasherevents double , Dishwasherevents double , Faucetevents double , Leakevents '+
    'double , Otherevents double , Showerevents double , Toiletevents double , Bathtubgpd double , '+
    'Clotheswashergpd double , Dishwashergpd double , Faucetgpd double , Leakgpd double , Othergpd '+
    'double , Showergpd double , Toiletgpd double , Averageclotheswasherloadgal double , '+
    'Clotheswasherloadsperday double , Totalshowerminutes double , Averageshowerseconds double , '+
    'Totalshowergal double , Averageshowergal double , Averageshowermodeflowgpm double , '+
    'Showersperday double , Showerminutesperday double , Averagetoiletflushvolume double , '+
    'Toiletflushstdev double , Numberofflusheslessthan2_2Gal double , '+
    'Numberofflushesgreaterthan2_2Gal double , has_area double , has_billing double , has_survey2 '+
    'double , has_trace double , survey_age_of_home double , pct_flushes_gt_2_2 double , '+
    'pct_flushes_lt_2_2 double , RandomSequence double , LogAnnualKgal double , LogNonseasonalKgal '+
    'double , LogSeasonalKgal double , LogAnnualMean double , LogAnnualStDev double , '+
    'LogNonseasonalMean double , LogNonseasonalStDev double , LogSeasonalMean double , '+
    'LogSeasonalStDev double , NormalizedAnnual double , NormalizedNonseasonal double , '+
    'NormalizedSeasonal double , NormalizedAnnualPredictedByFamily double , '+
    'NormalizedAnnualResidualByFamily double , NormalizedNonseasonalPredictedByFamily double , '+
    'NormalizedNonseasonalResidualByFamily double , NormalizedSeasonalPredictedByFamily double , '+
    'NormalizedSeasonalResidualByFamily double , KEYCODE double  NOT NULL, PRIMARY KEY (KEYCODE) )'
  /REPLACE
  /TABLE='SPSS_TEMP'
  /KEEP=ServiceCity, ServiceState, meter_size_code, SamplingAnnualKgal, SampleBegins, SampleEnds, 
    SampleDays, irrigated_area_sqft, NonseasonalKgal, SeasonalKgal, AnnualKgal, Imported, STATID, 
    STATID2, Q3, survey_other_features, Q4no, Q4year, Q4brand, Q5no, Q5year, Q5brand, Q6, Q13, Q14, 
    survey_alternative_source, survey_irrigation_inground_front, survey_irrigation_inground_back, 
    survey_irrigation_inground_drip, survey_irrigation_soaker, survey_irrigation_hose_sprinkler, 
    survey_irrigation_hand, survey_irrigation_other, Q20, Q23no, Q23length, Q23width, Q23depth, 
    survey_conservation_shower_short, survey_replaced_showerheads_LF, survey_toilet_inserts, 
    survey_replaced_toilets_ulft, survey_disposal_used_less, survey_dishwasher_used_less, 
    survey_clothes_washer_used_less, survey_faucet_drips_repaired, survey_gray_water_last_few, 
    survey_car_washed_less_often, survey_irrigation_less_often, survey_irrigation_avoid_heat, 
    survey_irrigation_xeri, survey_irrigation_inground_timer_adjusted_conservation, 
    survey_irrigation_efficient_system_installed, survey_irrigation_inground_cycle, 
    survey_has_been_audited, survey_other_conservation, survey_number_of_adults_winter, 
    survey_number_of_teenagers_winter, survey_number_of_children_winter, 
    survey_number_of_adults_summer, survey_number_of_teenagers_summer, 
    survey_number_of_children_summer, study, has_survey, survey_year, survey_number_of_toilets, 
    survey_number_of_bathtub_showers, survey_number_of_bathtub_only, survey_number_of_shower_only, 
    survey_number_of_whirlpools, survey_number_of_bathroom_sinks, survey_number_of_kitchen_sinks, 
    survey_number_of_utility_sinks, survey_number_of_bathtubs, survey_number_of_showers, 
    survey_disposal, survey_clothes_washer_top, survey_clothes_washer_front, survey_dishwasher, 
    survey_pool, survey_hot_tub, survey_evap_cooler, survey_pressure_regulator, survey_treatment, 
    survey_greenhouse, survey_garden_flower, survey_garden_veggie, survey_clothes_washer, 
    survey_aquarium, survey_hot_water_solar, survey_humidifier, survey_ice_maker, 
    survey_hot_water_tankless, survey_water_feature_outdoor_fountain, 
    survey_water_feature_outdoor_pond, survey_water_feature_outdoor, survey_number_of_showers_lfsh, 
    survey_number_of_toilets_16, survey_parcel_sqft, survey_landscape_pct, survey_landscape_turf_pct, 
    survey_irrigation_pct, survey_other_sources, survey_canal_ditch, survey_cistern, survey_well, 
    survey_stream, survey_has_alternative_source, survey_rain_barrel, survey_roof_direction, 
    survey_irrigation, survey_irrigation_inground, survey_irrigation_HOA, 
    Survey_Irrigation_InGround_Front_Automatic, Survey_Irrigation_InGround_Back_Automatic, 
    survey_irrigation_inground_timer, survey_irrigation_sensor_rain, survey_irrigation_sensor_soil, 
    Survey_Car_Washed, survey_walk_washed, reuws1_attitude_A, survey_conservation, survey_drought, 
    survey_SFR, survey_has_apartment, survey_separate_meters, survey_household_pays, 
    survey_number_of_adults, survey_number_of_teenagers, survey_number_of_children, capita, 
    survey_adults_employed, survey_homies, survey_year_built, survey_year_moved_in, survey_indoor_sqft, 
    survey_floors, survey_renter, survey_monthly_rent, survey_home_value, survey_highest_grade, 
    survey_household_income, TotalVolume, TraceBegins, TraceEnds, TraceLengthDays, TotalGPD, IndoorGPD, 
    OutdoorGPD, Indoortotalgal, Outdoortotalgal, Bathtubtotalgal, Clotheswashertotalgal, 
    Dishwashertotalgal, Faucettotalgal, Leaktotalgal, Othertotalgal, Showertotalgal, Toilettotalgal, 
    Bathtubevents, Clotheswasherevents, Dishwasherevents, Faucetevents, Leakevents, Otherevents, 
    Showerevents, Toiletevents, Bathtubgpd, Clotheswashergpd, Dishwashergpd, Faucetgpd, Leakgpd, 
    Othergpd, Showergpd, Toiletgpd, Averageclotheswasherloadgal, Clotheswasherloadsperday, 
    Totalshowerminutes, Averageshowerseconds, Totalshowergal, Averageshowergal, 
    Averageshowermodeflowgpm, Showersperday, Showerminutesperday, Averagetoiletflushvolume, 
    Toiletflushstdev, Numberofflusheslessthan2_2Gal, Numberofflushesgreaterthan2_2Gal, has_area, 
    has_billing, has_survey2, has_trace, survey_age_of_home, pct_flushes_gt_2_2, pct_flushes_lt_2_2, 
    RandomSequence, LogAnnualKgal, LogNonseasonalKgal, LogSeasonalKgal, LogAnnualMean, LogAnnualStDev, 
    LogNonseasonalMean, LogNonseasonalStDev, LogSeasonalMean, LogSeasonalStDev, NormalizedAnnual, 
    NormalizedNonseasonal, NormalizedSeasonal, NormalizedAnnualPredictedByFamily, 
    NormalizedAnnualResidualByFamily, NormalizedNonseasonalPredictedByFamily, 
    NormalizedNonseasonalResidualByFamily, NormalizedSeasonalPredictedByFamily, 
    NormalizedSeasonalResidualByFamily, KEYCODE
  /SQL='INSERT INTO spss_output (ServiceCity, ServiceState, meter_size_code, SamplingAnnualKgal, '+
    'SampleBegins, SampleEnds, SampleDays, irrigated_area_sqft, NonseasonalKgal, SeasonalKgal, '+
    'AnnualKgal, Imported, STATID, STATID2, Q3, survey_other_features, Q4no, Q4year, Q4brand, '+
    'Q5no, Q5year, Q5brand, Q6, Q13, Q14, survey_alternative_source, '+
    'survey_irrigation_inground_front, survey_irrigation_inground_back, '+
    'survey_irrigation_inground_drip, survey_irrigation_soaker, survey_irrigation_hose_sprinkler, '+
    'survey_irrigation_hand, survey_irrigation_other, Q20, Q23no, Q23length, Q23width, Q23depth, '+
    'survey_conservation_shower_short, survey_replaced_showerheads_LF, survey_toilet_inserts, '+
    'survey_replaced_toilets_ulft, survey_disposal_used_less, survey_dishwasher_used_less, '+
    'survey_clothes_washer_used_less, survey_faucet_drips_repaired, survey_gray_water_last_few, '+
    'survey_car_washed_less_often, survey_irrigation_less_often, survey_irrigation_avoid_heat, '+
    'survey_irrigation_xeri, survey_irrigation_inground_timer_adjusted_conservation, '+
    'survey_irrigation_efficient_system_installed, survey_irrigation_inground_cycle, '+
    'survey_has_been_audited, survey_other_conservation, survey_number_of_adults_winter, '+
    'survey_number_of_teenagers_winter, survey_number_of_children_winter, '+
    'survey_number_of_adults_summer, survey_number_of_teenagers_summer, '+
    'survey_number_of_children_summer, study, has_survey, survey_year, survey_number_of_toilets, '+
    'survey_number_of_bathtub_showers, survey_number_of_bathtub_only, '+
    'survey_number_of_shower_only, survey_number_of_whirlpools, survey_number_of_bathroom_sinks, '+
    'survey_number_of_kitchen_sinks, survey_number_of_utility_sinks, survey_number_of_bathtubs, '+
    'survey_number_of_showers, survey_disposal, survey_clothes_washer_top, '+
    'survey_clothes_washer_front, survey_dishwasher, survey_pool, survey_hot_tub, '+
    'survey_evap_cooler, survey_pressure_regulator, survey_treatment, survey_greenhouse, '+
    'survey_garden_flower, survey_garden_veggie, survey_clothes_washer, survey_aquarium, '+
    'survey_hot_water_solar, survey_humidifier, survey_ice_maker, survey_hot_water_tankless, '+
    'survey_water_feature_outdoor_fountain, survey_water_feature_outdoor_pond, '+
    'survey_water_feature_outdoor, survey_number_of_showers_lfsh, survey_number_of_toilets_16, '+
    'survey_parcel_sqft, survey_landscape_pct, survey_landscape_turf_pct, survey_irrigation_pct, '+
    'survey_other_sources, survey_canal_ditch, survey_cistern, survey_well, survey_stream, '+
    'survey_has_alternative_source, survey_rain_barrel, survey_roof_direction, survey_irrigation, '+
    'survey_irrigation_inground, survey_irrigation_HOA, '+
    'Survey_Irrigation_InGround_Front_Automatic, Survey_Irrigation_InGround_Back_Automatic, '+
    'survey_irrigation_inground_timer, survey_irrigation_sensor_rain, '+
    'survey_irrigation_sensor_soil, Survey_Car_Washed, survey_walk_washed, reuws1_attitude_A, '+
    'survey_conservation, survey_drought, survey_SFR, survey_has_apartment, '+
    'survey_separate_meters, survey_household_pays, survey_number_of_adults, '+
    'survey_number_of_teenagers, survey_number_of_children, capita, survey_adults_employed, '+
    'survey_homies, survey_year_built, survey_year_moved_in, survey_indoor_sqft, survey_floors, '+
    'survey_renter, survey_monthly_rent, survey_home_value, survey_highest_grade, '+
    'survey_household_income, TotalVolume, TraceBegins, TraceEnds, TraceLengthDays, TotalGPD, '+
    'IndoorGPD, OutdoorGPD, Indoortotalgal, Outdoortotalgal, Bathtubtotalgal, '+
    'Clotheswashertotalgal, Dishwashertotalgal, Faucettotalgal, Leaktotalgal, Othertotalgal, '+
    'Showertotalgal, Toilettotalgal, Bathtubevents, Clotheswasherevents, Dishwasherevents, '+
    'Faucetevents, Leakevents, Otherevents, Showerevents, Toiletevents, Bathtubgpd, '+
    'Clotheswashergpd, Dishwashergpd, Faucetgpd, Leakgpd, Othergpd, Showergpd, Toiletgpd, '+
    'Averageclotheswasherloadgal, Clotheswasherloadsperday, Totalshowerminutes, '+
    'Averageshowerseconds, Totalshowergal, Averageshowergal, Averageshowermodeflowgpm, '+
    'Showersperday, Showerminutesperday, Averagetoiletflushvolume, Toiletflushstdev, '+
    'Numberofflusheslessthan2_2Gal, Numberofflushesgreaterthan2_2Gal, has_area, has_billing, '+
    'has_survey2, has_trace, survey_age_of_home, pct_flushes_gt_2_2, pct_flushes_lt_2_2, '+
    'RandomSequence, LogAnnualKgal, LogNonseasonalKgal, LogSeasonalKgal, LogAnnualMean, '+
    'LogAnnualStDev, LogNonseasonalMean, LogNonseasonalStDev, LogSeasonalMean, LogSeasonalStDev, '+
    'NormalizedAnnual, NormalizedNonseasonal, NormalizedSeasonal, '+
    'NormalizedAnnualPredictedByFamily, NormalizedAnnualResidualByFamily, '+
    'NormalizedNonseasonalPredictedByFamily, NormalizedNonseasonalResidualByFamily, '+
    'NormalizedSeasonalPredictedByFamily, NormalizedSeasonalResidualByFamily, KEYCODE) SELECT '+
    'ServiceCity, ServiceState, meter_size_code, SamplingAnnualKgal, SampleBegins, SampleEnds, '+
    'SampleDays, irrigated_area_sqft, NonseasonalKgal, SeasonalKgal, AnnualKgal, Imported, STATID, '+
    'STATID2, Q3, survey_other_features, Q4no, Q4year, Q4brand, Q5no, Q5year, Q5brand, Q6, Q13, '+
    'Q14, survey_alternative_source, survey_irrigation_inground_front, '+
    'survey_irrigation_inground_back, survey_irrigation_inground_drip, survey_irrigation_soaker, '+
    'survey_irrigation_hose_sprinkler, survey_irrigation_hand, survey_irrigation_other, Q20, '+
    'Q23no, Q23length, Q23width, Q23depth, survey_conservation_shower_short, '+
    'survey_replaced_showerheads_LF, survey_toilet_inserts, survey_replaced_toilets_ulft, '+
    'survey_disposal_used_less, survey_dishwasher_used_less, survey_clothes_washer_used_less, '+
    'survey_faucet_drips_repaired, survey_gray_water_last_few, survey_car_washed_less_often, '+
    'survey_irrigation_less_often, survey_irrigation_avoid_heat, survey_irrigation_xeri, '+
    'survey_irrigation_inground_timer_adjusted_conservation, '+
    'survey_irrigation_efficient_system_installed, survey_irrigation_inground_cycle, '+
    'survey_has_been_audited, survey_other_conservation, survey_number_of_adults_winter, '+
    'survey_number_of_teenagers_winter, survey_number_of_children_winter, '+
    'survey_number_of_adults_summer, survey_number_of_teenagers_summer, '+
    'survey_number_of_children_summer, study, has_survey, survey_year, survey_number_of_toilets, '+
    'survey_number_of_bathtub_showers, survey_number_of_bathtub_only, '+
    'survey_number_of_shower_only, survey_number_of_whirlpools, survey_number_of_bathroom_sinks, '+
    'survey_number_of_kitchen_sinks, survey_number_of_utility_sinks, survey_number_of_bathtubs, '+
    'survey_number_of_showers, survey_disposal, survey_clothes_washer_top, '+
    'survey_clothes_washer_front, survey_dishwasher, survey_pool, survey_hot_tub, '+
    'survey_evap_cooler, survey_pressure_regulator, survey_treatment, survey_greenhouse, '+
    'survey_garden_flower, survey_garden_veggie, survey_clothes_washer, survey_aquarium, '+
    'survey_hot_water_solar, survey_humidifier, survey_ice_maker, survey_hot_water_tankless, '+
    'survey_water_feature_outdoor_fountain, survey_water_feature_outdoor_pond, '+
    'survey_water_feature_outdoor, survey_number_of_showers_lfsh, survey_number_of_toilets_16, '+
    'survey_parcel_sqft, survey_landscape_pct, survey_landscape_turf_pct, survey_irrigation_pct, '+
    'survey_other_sources, survey_canal_ditch, survey_cistern, survey_well, survey_stream, '+
    'survey_has_alternative_source, survey_rain_barrel, survey_roof_direction, survey_irrigation, '+
    'survey_irrigation_inground, survey_irrigation_HOA, '+
    'Survey_Irrigation_InGround_Front_Automatic, Survey_Irrigation_InGround_Back_Automatic, '+
    'survey_irrigation_inground_timer, survey_irrigation_sensor_rain, '+
    'survey_irrigation_sensor_soil, Survey_Car_Washed, survey_walk_washed, reuws1_attitude_A, '+
    'survey_conservation, survey_drought, survey_SFR, survey_has_apartment, '+
    'survey_separate_meters, survey_household_pays, survey_number_of_adults, '+
    'survey_number_of_teenagers, survey_number_of_children, capita, survey_adults_employed, '+
    'survey_homies, survey_year_built, survey_year_moved_in, survey_indoor_sqft, survey_floors, '+
    'survey_renter, survey_monthly_rent, survey_home_value, survey_highest_grade, '+
    'survey_household_income, TotalVolume, TraceBegins, TraceEnds, TraceLengthDays, TotalGPD, '+
    'IndoorGPD, OutdoorGPD, Indoortotalgal, Outdoortotalgal, Bathtubtotalgal, '+
    'Clotheswashertotalgal, Dishwashertotalgal, Faucettotalgal, Leaktotalgal, Othertotalgal, '+
    'Showertotalgal, Toilettotalgal, Bathtubevents, Clotheswasherevents, Dishwasherevents, '+
    'Faucetevents, Leakevents, Otherevents, Showerevents, Toiletevents, Bathtubgpd, '+
    'Clotheswashergpd, Dishwashergpd, Faucetgpd, Leakgpd, Othergpd, Showergpd, Toiletgpd, '+
    'Averageclotheswasherloadgal, Clotheswasherloadsperday, Totalshowerminutes, '+
    'Averageshowerseconds, Totalshowergal, Averageshowergal, Averageshowermodeflowgpm, '+
    'Showersperday, Showerminutesperday, Averagetoiletflushvolume, Toiletflushstdev, '+
    'Numberofflusheslessthan2_2Gal, Numberofflushesgreaterthan2_2Gal, has_area, has_billing, '+
    'has_survey2, has_trace, survey_age_of_home, pct_flushes_gt_2_2, pct_flushes_lt_2_2, '+
    'RandomSequence, LogAnnualKgal, LogNonseasonalKgal, LogSeasonalKgal, LogAnnualMean, '+
    'LogAnnualStDev, LogNonseasonalMean, LogNonseasonalStDev, LogSeasonalMean, LogSeasonalStDev, '+
    'NormalizedAnnual, NormalizedNonseasonal, NormalizedSeasonal, '+
    'NormalizedAnnualPredictedByFamily, NormalizedAnnualResidualByFamily, '+
    'NormalizedNonseasonalPredictedByFamily, NormalizedNonseasonalResidualByFamily, '+
    'NormalizedSeasonalPredictedByFamily, NormalizedSeasonalResidualByFamily, KEYCODE FROM SPSS_TEMP'
  /SQL='DROP TABLE SPSS_TEMP'.
