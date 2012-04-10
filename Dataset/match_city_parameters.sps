cd "S:\local\home\matt".
cd "Data_Mining_project".

GET DATA
  /TYPE=TXT
  /FILE="Dataset\city_parameters.tab"
  /DELCASE=LINE
  /DELIMITERS="\t;,"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  City A50
  CityAnnualKgalMean F6.2
  CityAnnualKgalStDev F6.2
  CityNonseasonalKgalMean F5.2
  CityNonseasonalKgalStDev F5.2
  CitySeasonalKgalMean F6.2
  CitySeasonalKgalStdev F6.2.
CACHE.
sort cases by City.
EXECUTE.
DATASET NAME parameters.

GET
  FILE='Dataset\sample5574.sav'.
sort cases by City.
MEANS TABLES=AnnualKgal NonseasonalKgal SeasonalKgal BY City
  /CELLS MEAN COUNT STDDEV.

MATCH FILES /FILE=*
  /TABLE='parameters'
  /BY City
.
if missing(CityAnnualKgalMean) CityAnnualKgalMean=195.95.
if missing(CityAnnualKgalStDev) CityAnnualKgalStDev=237.41.
if missing(CityNonseasonalKgalMean) CityNonseasonalKgalMean=62.15.
if missing(CityNonseasonalKgalStDev) CityNonseasonalKgalStDev=37.59.
if missing(CitySeasonalKgalMean) CitySeasonalKgalMean=133.80.
if missing(CitySeasonalKgalStdev) CitySeasonalKgalStdev=228.06.
compute annualNormalizedByCity=(AnnualKgal - CityAnnualKgalMean)/CityAnnualKgalStDev.
compute nonseasonalNormalizedByCity=(NonseasonalKgal - CityNonseasonalKgalMean)/CityNonseasonalKgalStDev.
compute seasonalNormalizedByCity=(SeasonalKgal - CitySeasonalKgalMean)/CitySeasonalKgalStdev.
execute.

SAVE TRANSLATE /TYPE=ODBC
  /CONNECT='DSN=MS Access Database;DBQ='+
    'S:\local\home\matt\Data_Mining_project\Dataset\sample5574-normalized.mdb;DriverId=25;FIL=MS '+
    'Access;MaxBufferSize=2048;PageTimeout=5;'
  /ENCRYPTED
  /MISSING=RECODE
  /SQL='CREATE TABLE tblNormalizedBillingByCity (AnnualKgal double , Averageclotheswasherloadgal '+
    'double , Averageshowergal double , Averageshowermodeflowgpm double , Averageshowerseconds '+
    'double , Averagetoiletflushvolume double , Bathtubevents double , Bathtubgpd double , '+
    'Bathtubtotalgal double , capita double , City varchar (50), Clotheswasherevents double , '+
    'Clotheswashergpd double , Clotheswasherloadsperday double , Clotheswashertotalgal double , '+
    'Dishwasherevents double , Dishwashergpd double , Dishwashertotalgal double , Faucetevents '+
    'double , Faucetgpd double , Faucettotalgal double , has_area double , has_billing double , '+
    'has_survey double , has_survey2 double , has_trace double , Imported datetime , IndoorGPD '+
    'double , Indoortotalgal double , irrigated_area_sqft double , KEYCODE double  NOT NULL, '+
    'Leakevents double , Leakgpd double , Leaktotalgal double , meter_size_code varchar (50), '+
    'NonseasonalKgal double , Numberofflushesgreaterthan2_2Gal double , '+
    'Numberofflusheslessthan2_2Gal double , Otherevents double , Othergpd double , Othertotalgal '+
    'double , OutdoorGPD double , Outdoortotalgal double , Q3 double , Q6 double , Q13 double , '+
    'Q14 double , Q20 double , Q16other varchar (255), Q23depth double , Q23length double , Q23no '+
    'double , Q23width double , Q25aother varchar (255), Q4brand varchar (255), Q4no double , '+
    'Q4year double , Q5brand varchar (255), Q5no double , Q5year double , reuws1_attitude_A double '+
    ', SampleBegins datetime , SampleDays double , SampleEnds datetime , SamplingAnnualKgal double '+
    ', SeasonalKgal double , Showerevents double , Showergpd double , Showerminutesperday double , '+
    'Showersperday double , Showertotalgal double , State varchar (50), STATID double , STATID2 '+
    'double , study double , survey_adults_employed double , survey_alternative_source varchar '+
    '(255), survey_aquarium double , survey_canal_ditch double , Survey_Car_Washed double , '+
    'survey_car_washed_less_often double , survey_cistern double , survey_clothes_washer double , '+
    'survey_clothes_washer_front double , survey_clothes_washer_top double , '+
    'survey_clothes_washer_used_less double , survey_conservation double , '+
    'survey_conservation_shower_short double , survey_dishwasher double , '+
    'survey_dishwasher_used_less double , survey_disposal double , survey_disposal_used_less '+
    'double , survey_drought double , survey_evap_cooler double , survey_faucet_drips_repaired '+
    'double , survey_floors double , survey_garden_flower double , survey_garden_veggie double , '+
    'survey_gray_water_last_few double , survey_greenhouse double , survey_has_alternative_source '+
    'double , survey_has_apartment double , survey_has_been_audited double , survey_highest_grade '+
    'double , survey_home_value currency , survey_homies double , survey_hot_tub double , '+
    'survey_hot_water_solar double , survey_hot_water_tankless double , survey_household_income '+
    'currency , survey_household_pays double , survey_humidifier double , survey_ice_maker double '+
    ', survey_indoor_sqft double , survey_irrigation double , survey_irrigation_avoid_heat double '+
    ', survey_irrigation_efficient_system_installed double , survey_irrigation_hand double , '+
    'survey_irrigation_HOA double , survey_irrigation_hose_sprinkler double , '+
    'survey_irrigation_inground double , survey_irrigation_inground_back double , '+
    'Survey_Irrigation_InGround_Back_Automatic double , survey_irrigation_inground_cycle double , '+
    'survey_irrigation_inground_drip double , survey_irrigation_inground_front double , '+
    'Survey_Irrigation_InGround_Front_Automatic double , survey_irrigation_inground_timer double , '+
    'survey_irrigation_inground_timer_adjusted_conservation double , survey_irrigation_less_often '+
    'double , survey_irrigation_other double , survey_irrigation_pct double , '+
    'survey_irrigation_sensor_rain double , survey_irrigation_sensor_soil double , '+
    'survey_irrigation_soaker double , survey_irrigation_xeri double , survey_landscape_pct double '+
    ', survey_landscape_turf_pct double , survey_monthly_rent currency , survey_number_of_adults '+
    'double , survey_number_of_adults_summer double , survey_number_of_adults_winter double , '+
    'survey_number_of_bathroom_sinks double , survey_number_of_bathtub_only double , '+
    'survey_number_of_bathtub_showers double , survey_number_of_bathtubs double , '+
    'survey_number_of_children double , survey_number_of_children_summer double , '+
    'survey_number_of_children_winter double , survey_number_of_kitchen_sinks double , '+
    'survey_number_of_shower_only double , survey_number_of_showers double , '+
    'survey_number_of_showers_lfsh double , survey_number_of_teenagers double , '+
    'survey_number_of_teenagers_summer double , survey_number_of_teenagers_winter double , '+
    'survey_number_of_toilets double , survey_number_of_toilets_16 double , '+
    'survey_number_of_utility_sinks double , survey_number_of_whirlpools double , '+
    'survey_other_conservation double , survey_other_features varchar (255), survey_other_sources '+
    'double , survey_parcel_sqft double , survey_pool double , survey_pressure_regulator double , '+
    'survey_rain_barrel double , survey_renter double , survey_replaced_showerheads_LF double , '+
    'survey_replaced_toilets_ulft double , survey_roof_direction double , survey_separate_meters '+
    'double , survey_SFR double , survey_stream double , survey_toilet_inserts double , '+
    'survey_treatment double , survey_walk_washed double , survey_water_feature_outdoor double , '+
    'survey_water_feature_outdoor_fountain double , survey_water_feature_outdoor_pond double , '+
    'survey_well double , survey_year double , survey_year_built double , survey_year_moved_in '+
    'double , Toiletevents double , Toiletflushstdev double , Toiletgpd double , Toilettotalgal '+
    'double , TotalGPD double , Totalshowergal double , Totalshowerminutes double , TotalVolume '+
    'double , TraceBegins datetime , TraceEnds datetime , TraceLengthDays double , '+
    'CityAnnualKgalMean double , CityAnnualKgalStDev double , CityNonseasonalKgalMean double , '+
    'CityNonseasonalKgalStDev double , CitySeasonalKgalMean double , CitySeasonalKgalStdev double '+
    ', annualNormalizedByCity double , nonseasonalNormalizedByCity double , '+
    'seasonalNormalizedByCity double , PRIMARY KEY (KEYCODE) )'
  /REPLACE
  /TABLE='SPSS_TEMP'
  /KEEP=AnnualKgal, Averageclotheswasherloadgal, Averageshowergal, Averageshowermodeflowgpm, 
    Averageshowerseconds, Averagetoiletflushvolume, Bathtubevents, Bathtubgpd, Bathtubtotalgal, capita, 
    City, Clotheswasherevents, Clotheswashergpd, Clotheswasherloadsperday, Clotheswashertotalgal, 
    Dishwasherevents, Dishwashergpd, Dishwashertotalgal, Faucetevents, Faucetgpd, Faucettotalgal, 
    has_area, has_billing, has_survey, has_survey2, has_trace, Imported, IndoorGPD, Indoortotalgal, 
    irrigated_area_sqft, KEYCODE, Leakevents, Leakgpd, Leaktotalgal, meter_size_code, NonseasonalKgal, 
    Numberofflushesgreaterthan2_2Gal, Numberofflusheslessthan2_2Gal, Otherevents, Othergpd, 
    Othertotalgal, OutdoorGPD, Outdoortotalgal, Q3, Q6, Q13, Q14, Q20, Q16other, Q23depth, Q23length, 
    Q23no, Q23width, Q25aother, Q4brand, Q4no, Q4year, Q5brand, Q5no, Q5year, reuws1_attitude_A, 
    SampleBegins, SampleDays, SampleEnds, SamplingAnnualKgal, SeasonalKgal, Showerevents, Showergpd, 
    Showerminutesperday, Showersperday, Showertotalgal, State, STATID, STATID2, study, 
    survey_adults_employed, survey_alternative_source, survey_aquarium, survey_canal_ditch, 
    Survey_Car_Washed, survey_car_washed_less_often, survey_cistern, survey_clothes_washer, 
    survey_clothes_washer_front, survey_clothes_washer_top, survey_clothes_washer_used_less, 
    survey_conservation, survey_conservation_shower_short, survey_dishwasher, 
    survey_dishwasher_used_less, survey_disposal, survey_disposal_used_less, survey_drought, 
    survey_evap_cooler, survey_faucet_drips_repaired, survey_floors, survey_garden_flower, 
    survey_garden_veggie, survey_gray_water_last_few, survey_greenhouse, survey_has_alternative_source, 
    survey_has_apartment, survey_has_been_audited, survey_highest_grade, survey_home_value, 
    survey_homies, survey_hot_tub, survey_hot_water_solar, survey_hot_water_tankless, 
    survey_household_income, survey_household_pays, survey_humidifier, survey_ice_maker, 
    survey_indoor_sqft, survey_irrigation, survey_irrigation_avoid_heat, 
    survey_irrigation_efficient_system_installed, survey_irrigation_hand, survey_irrigation_HOA, 
    survey_irrigation_hose_sprinkler, survey_irrigation_inground, survey_irrigation_inground_back, 
    Survey_Irrigation_InGround_Back_Automatic, survey_irrigation_inground_cycle, 
    survey_irrigation_inground_drip, survey_irrigation_inground_front, 
    Survey_Irrigation_InGround_Front_Automatic, survey_irrigation_inground_timer, 
    survey_irrigation_inground_timer_adjusted_conservation, survey_irrigation_less_often, 
    survey_irrigation_other, survey_irrigation_pct, survey_irrigation_sensor_rain, 
    survey_irrigation_sensor_soil, survey_irrigation_soaker, survey_irrigation_xeri, 
    survey_landscape_pct, survey_landscape_turf_pct, survey_monthly_rent, survey_number_of_adults, 
    survey_number_of_adults_summer, survey_number_of_adults_winter, survey_number_of_bathroom_sinks, 
    survey_number_of_bathtub_only, survey_number_of_bathtub_showers, survey_number_of_bathtubs, 
    survey_number_of_children, survey_number_of_children_summer, survey_number_of_children_winter, 
    survey_number_of_kitchen_sinks, survey_number_of_shower_only, survey_number_of_showers, 
    survey_number_of_showers_lfsh, survey_number_of_teenagers, survey_number_of_teenagers_summer, 
    survey_number_of_teenagers_winter, survey_number_of_toilets, survey_number_of_toilets_16, 
    survey_number_of_utility_sinks, survey_number_of_whirlpools, survey_other_conservation, 
    survey_other_features, survey_other_sources, survey_parcel_sqft, survey_pool, 
    survey_pressure_regulator, survey_rain_barrel, survey_renter, survey_replaced_showerheads_LF, 
    survey_replaced_toilets_ulft, survey_roof_direction, survey_separate_meters, survey_SFR, 
    survey_stream, survey_toilet_inserts, survey_treatment, survey_walk_washed, 
    survey_water_feature_outdoor, survey_water_feature_outdoor_fountain, 
    survey_water_feature_outdoor_pond, survey_well, survey_year, survey_year_built, 
    survey_year_moved_in, Toiletevents, Toiletflushstdev, Toiletgpd, Toilettotalgal, TotalGPD, 
    Totalshowergal, Totalshowerminutes, TotalVolume, TraceBegins, TraceEnds, TraceLengthDays, 
    CityAnnualKgalMean, CityAnnualKgalStDev, CityNonseasonalKgalMean, CityNonseasonalKgalStDev, 
    CitySeasonalKgalMean, CitySeasonalKgalStdev, annualNormalizedByCity, nonseasonalNormalizedByCity, 
    seasonalNormalizedByCity
  /SQL='INSERT INTO tblNormalizedBillingByCity (AnnualKgal, Averageclotheswasherloadgal, '+
    'Averageshowergal, Averageshowermodeflowgpm, Averageshowerseconds, Averagetoiletflushvolume, '+
    'Bathtubevents, Bathtubgpd, Bathtubtotalgal, capita, City, Clotheswasherevents, '+
    'Clotheswashergpd, Clotheswasherloadsperday, Clotheswashertotalgal, Dishwasherevents, '+
    'Dishwashergpd, Dishwashertotalgal, Faucetevents, Faucetgpd, Faucettotalgal, has_area, '+
    'has_billing, has_survey, has_survey2, has_trace, Imported, IndoorGPD, Indoortotalgal, '+
    'irrigated_area_sqft, KEYCODE, Leakevents, Leakgpd, Leaktotalgal, meter_size_code, '+
    'NonseasonalKgal, Numberofflushesgreaterthan2_2Gal, Numberofflusheslessthan2_2Gal, '+
    'Otherevents, Othergpd, Othertotalgal, OutdoorGPD, Outdoortotalgal, Q3, Q6, Q13, Q14, Q20, '+
    'Q16other, Q23depth, Q23length, Q23no, Q23width, Q25aother, Q4brand, Q4no, Q4year, Q5brand, '+
    'Q5no, Q5year, reuws1_attitude_A, SampleBegins, SampleDays, SampleEnds, SamplingAnnualKgal, '+
    'SeasonalKgal, Showerevents, Showergpd, Showerminutesperday, Showersperday, Showertotalgal, '+
    'State, STATID, STATID2, study, survey_adults_employed, survey_alternative_source, '+
    'survey_aquarium, survey_canal_ditch, Survey_Car_Washed, survey_car_washed_less_often, '+
    'survey_cistern, survey_clothes_washer, survey_clothes_washer_front, '+
    'survey_clothes_washer_top, survey_clothes_washer_used_less, survey_conservation, '+
    'survey_conservation_shower_short, survey_dishwasher, survey_dishwasher_used_less, '+
    'survey_disposal, survey_disposal_used_less, survey_drought, survey_evap_cooler, '+
    'survey_faucet_drips_repaired, survey_floors, survey_garden_flower, survey_garden_veggie, '+
    'survey_gray_water_last_few, survey_greenhouse, survey_has_alternative_source, '+
    'survey_has_apartment, survey_has_been_audited, survey_highest_grade, survey_home_value, '+
    'survey_homies, survey_hot_tub, survey_hot_water_solar, survey_hot_water_tankless, '+
    'survey_household_income, survey_household_pays, survey_humidifier, survey_ice_maker, '+
    'survey_indoor_sqft, survey_irrigation, survey_irrigation_avoid_heat, '+
    'survey_irrigation_efficient_system_installed, survey_irrigation_hand, survey_irrigation_HOA, '+
    'survey_irrigation_hose_sprinkler, survey_irrigation_inground, '+
    'survey_irrigation_inground_back, Survey_Irrigation_InGround_Back_Automatic, '+
    'survey_irrigation_inground_cycle, survey_irrigation_inground_drip, '+
    'survey_irrigation_inground_front, Survey_Irrigation_InGround_Front_Automatic, '+
    'survey_irrigation_inground_timer, survey_irrigation_inground_timer_adjusted_conservation, '+
    'survey_irrigation_less_often, survey_irrigation_other, survey_irrigation_pct, '+
    'survey_irrigation_sensor_rain, survey_irrigation_sensor_soil, survey_irrigation_soaker, '+
    'survey_irrigation_xeri, survey_landscape_pct, survey_landscape_turf_pct, survey_monthly_rent, '+
    'survey_number_of_adults, survey_number_of_adults_summer, survey_number_of_adults_winter, '+
    'survey_number_of_bathroom_sinks, survey_number_of_bathtub_only, '+
    'survey_number_of_bathtub_showers, survey_number_of_bathtubs, survey_number_of_children, '+
    'survey_number_of_children_summer, survey_number_of_children_winter, '+
    'survey_number_of_kitchen_sinks, survey_number_of_shower_only, survey_number_of_showers, '+
    'survey_number_of_showers_lfsh, survey_number_of_teenagers, survey_number_of_teenagers_summer, '+
    'survey_number_of_teenagers_winter, survey_number_of_toilets, survey_number_of_toilets_16, '+
    'survey_number_of_utility_sinks, survey_number_of_whirlpools, survey_other_conservation, '+
    'survey_other_features, survey_other_sources, survey_parcel_sqft, survey_pool, '+
    'survey_pressure_regulator, survey_rain_barrel, survey_renter, survey_replaced_showerheads_LF, '+
    'survey_replaced_toilets_ulft, survey_roof_direction, survey_separate_meters, survey_SFR, '+
    'survey_stream, survey_toilet_inserts, survey_treatment, survey_walk_washed, '+
    'survey_water_feature_outdoor, survey_water_feature_outdoor_fountain, '+
    'survey_water_feature_outdoor_pond, survey_well, survey_year, survey_year_built, '+
    'survey_year_moved_in, Toiletevents, Toiletflushstdev, Toiletgpd, Toilettotalgal, TotalGPD, '+
    'Totalshowergal, Totalshowerminutes, TotalVolume, TraceBegins, TraceEnds, TraceLengthDays, '+
    'CityAnnualKgalMean, CityAnnualKgalStDev, CityNonseasonalKgalMean, CityNonseasonalKgalStDev, '+
    'CitySeasonalKgalMean, CitySeasonalKgalStdev, annualNormalizedByCity, '+
    'nonseasonalNormalizedByCity, seasonalNormalizedByCity) SELECT AnnualKgal, '+
    'Averageclotheswasherloadgal, Averageshowergal, Averageshowermodeflowgpm, '+
    'Averageshowerseconds, Averagetoiletflushvolume, Bathtubevents, Bathtubgpd, Bathtubtotalgal, '+
    'capita, City, Clotheswasherevents, Clotheswashergpd, Clotheswasherloadsperday, '+
    'Clotheswashertotalgal, Dishwasherevents, Dishwashergpd, Dishwashertotalgal, Faucetevents, '+
    'Faucetgpd, Faucettotalgal, has_area, has_billing, has_survey, has_survey2, has_trace, '+
    'Imported, IndoorGPD, Indoortotalgal, irrigated_area_sqft, KEYCODE, Leakevents, Leakgpd, '+
    'Leaktotalgal, meter_size_code, NonseasonalKgal, Numberofflushesgreaterthan2_2Gal, '+
    'Numberofflusheslessthan2_2Gal, Otherevents, Othergpd, Othertotalgal, OutdoorGPD, '+
    'Outdoortotalgal, Q3, Q6, Q13, Q14, Q20, Q16other, Q23depth, Q23length, Q23no, Q23width, '+
    'Q25aother, Q4brand, Q4no, Q4year, Q5brand, Q5no, Q5year, reuws1_attitude_A, SampleBegins, '+
    'SampleDays, SampleEnds, SamplingAnnualKgal, SeasonalKgal, Showerevents, Showergpd, '+
    'Showerminutesperday, Showersperday, Showertotalgal, State, STATID, STATID2, study, '+
    'survey_adults_employed, survey_alternative_source, survey_aquarium, survey_canal_ditch, '+
    'Survey_Car_Washed, survey_car_washed_less_often, survey_cistern, survey_clothes_washer, '+
    'survey_clothes_washer_front, survey_clothes_washer_top, survey_clothes_washer_used_less, '+
    'survey_conservation, survey_conservation_shower_short, survey_dishwasher, '+
    'survey_dishwasher_used_less, survey_disposal, survey_disposal_used_less, survey_drought, '+
    'survey_evap_cooler, survey_faucet_drips_repaired, survey_floors, survey_garden_flower, '+
    'survey_garden_veggie, survey_gray_water_last_few, survey_greenhouse, '+
    'survey_has_alternative_source, survey_has_apartment, survey_has_been_audited, '+
    'survey_highest_grade, survey_home_value, survey_homies, survey_hot_tub, '+
    'survey_hot_water_solar, survey_hot_water_tankless, survey_household_income, '+
    'survey_household_pays, survey_humidifier, survey_ice_maker, survey_indoor_sqft, '+
    'survey_irrigation, survey_irrigation_avoid_heat, '+
    'survey_irrigation_efficient_system_installed, survey_irrigation_hand, survey_irrigation_HOA, '+
    'survey_irrigation_hose_sprinkler, survey_irrigation_inground, '+
    'survey_irrigation_inground_back, Survey_Irrigation_InGround_Back_Automatic, '+
    'survey_irrigation_inground_cycle, survey_irrigation_inground_drip, '+
    'survey_irrigation_inground_front, Survey_Irrigation_InGround_Front_Automatic, '+
    'survey_irrigation_inground_timer, survey_irrigation_inground_timer_adjusted_conservation, '+
    'survey_irrigation_less_often, survey_irrigation_other, survey_irrigation_pct, '+
    'survey_irrigation_sensor_rain, survey_irrigation_sensor_soil, survey_irrigation_soaker, '+
    'survey_irrigation_xeri, survey_landscape_pct, survey_landscape_turf_pct, survey_monthly_rent, '+
    'survey_number_of_adults, survey_number_of_adults_summer, survey_number_of_adults_winter, '+
    'survey_number_of_bathroom_sinks, survey_number_of_bathtub_only, '+
    'survey_number_of_bathtub_showers, survey_number_of_bathtubs, survey_number_of_children, '+
    'survey_number_of_children_summer, survey_number_of_children_winter, '+
    'survey_number_of_kitchen_sinks, survey_number_of_shower_only, survey_number_of_showers, '+
    'survey_number_of_showers_lfsh, survey_number_of_teenagers, survey_number_of_teenagers_summer, '+
    'survey_number_of_teenagers_winter, survey_number_of_toilets, survey_number_of_toilets_16, '+
    'survey_number_of_utility_sinks, survey_number_of_whirlpools, survey_other_conservation, '+
    'survey_other_features, survey_other_sources, survey_parcel_sqft, survey_pool, '+
    'survey_pressure_regulator, survey_rain_barrel, survey_renter, survey_replaced_showerheads_LF, '+
    'survey_replaced_toilets_ulft, survey_roof_direction, survey_separate_meters, survey_SFR, '+
    'survey_stream, survey_toilet_inserts, survey_treatment, survey_walk_washed, '+
    'survey_water_feature_outdoor, survey_water_feature_outdoor_fountain, '+
    'survey_water_feature_outdoor_pond, survey_well, survey_year, survey_year_built, '+
    'survey_year_moved_in, Toiletevents, Toiletflushstdev, Toiletgpd, Toilettotalgal, TotalGPD, '+
    'Totalshowergal, Totalshowerminutes, TotalVolume, TraceBegins, TraceEnds, TraceLengthDays, '+
    'CityAnnualKgalMean, CityAnnualKgalStDev, CityNonseasonalKgalMean, CityNonseasonalKgalStDev, '+
    'CitySeasonalKgalMean, CitySeasonalKgalStdev, annualNormalizedByCity, '+
    'nonseasonalNormalizedByCity, seasonalNormalizedByCity FROM SPSS_TEMP'
  /SQL='DROP TABLE SPSS_TEMP'.
