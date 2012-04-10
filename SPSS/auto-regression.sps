
*Automatic Linear Modeling. 
LINEAR 
  /FIELDS TARGET=SeasonalKgal INPUTS=Averageclotheswasherloadgal Averageshowergal 
    Averageshowermodeflowgpm Averageshowerseconds Averagetoiletflushvolume Bathtubevents Bathtubgpd 
    Bathtubtotalgal capita City Clotheswasherevents Clotheswashergpd Clotheswasherloadsperday 
    Clotheswashertotalgal Dishwasherevents Dishwashergpd Dishwashertotalgal Faucetevents Faucetgpd 
    Faucettotalgal has_area has_billing has_survey has_survey2 has_trace IndoorGPD Indoortotalgal 
    irrigated_area_sqft Leakevents Leakgpd Leaktotalgal NonseasonalKgal 
    Numberofflushesgreaterthan2_2Gal Numberofflusheslessthan2_2Gal Otherevents Othergpd Othertotalgal 
    Q3 Q6 Q13 Q14 Q20 Q16other Q23depth Q23length Q23no Q23width Q25aother Q4brand Q4no Q4year Q5brand 
    Q5no Q5year reuws1_attitude_A SampleBegins SampleDays SampleEnds Showerevents Showergpd 
    Showerminutesperday Showersperday Showertotalgal State STATID STATID2 study survey_adults_employed 
    survey_alternative_source survey_aquarium survey_canal_ditch Survey_Car_Washed 
    survey_car_washed_less_often survey_cistern survey_clothes_washer survey_clothes_washer_front 
    survey_clothes_washer_top survey_clothes_washer_used_less survey_conservation 
    survey_conservation_shower_short survey_dishwasher survey_dishwasher_used_less survey_disposal 
    survey_disposal_used_less survey_drought survey_evap_cooler survey_faucet_drips_repaired 
    survey_floors survey_garden_flower survey_garden_veggie survey_gray_water_last_few 
    survey_greenhouse survey_has_alternative_source survey_has_apartment survey_has_been_audited 
    survey_highest_grade survey_home_value survey_homies survey_hot_tub survey_hot_water_solar 
    survey_hot_water_tankless survey_household_income survey_household_pays survey_humidifier 
    survey_ice_maker survey_indoor_sqft survey_irrigation survey_irrigation_avoid_heat 
    survey_irrigation_efficient_system_installed survey_irrigation_hand survey_irrigation_HOA 
    survey_irrigation_hose_sprinkler survey_irrigation_inground survey_irrigation_inground_back 
    Survey_Irrigation_InGround_Back_Automatic survey_irrigation_inground_cycle 
    survey_irrigation_inground_drip survey_irrigation_inground_front 
    Survey_Irrigation_InGround_Front_Automatic survey_irrigation_inground_timer 
    survey_irrigation_inground_timer_adjusted_conservation survey_irrigation_less_often 
    survey_irrigation_other survey_irrigation_pct survey_irrigation_sensor_rain 
    survey_irrigation_sensor_soil survey_irrigation_soaker survey_irrigation_xeri survey_landscape_pct 
    survey_landscape_turf_pct survey_monthly_rent survey_number_of_adults 
    survey_number_of_adults_summer survey_number_of_adults_winter survey_number_of_bathroom_sinks 
    survey_number_of_bathtub_only survey_number_of_bathtub_showers survey_number_of_bathtubs 
    survey_number_of_children survey_number_of_children_summer survey_number_of_children_winter 
    survey_number_of_kitchen_sinks survey_number_of_shower_only survey_number_of_showers 
    survey_number_of_showers_lfsh survey_number_of_teenagers survey_number_of_teenagers_summer 
    survey_number_of_teenagers_winter survey_number_of_toilets survey_number_of_toilets_16 
    survey_number_of_utility_sinks survey_number_of_whirlpools survey_other_conservation 
    survey_other_features survey_other_sources survey_parcel_sqft survey_pool survey_pressure_regulator 
    survey_rain_barrel survey_renter survey_replaced_showerheads_LF survey_replaced_toilets_ulft 
    survey_roof_direction survey_separate_meters survey_SFR survey_stream survey_toilet_inserts 
    survey_treatment survey_walk_washed survey_water_feature_outdoor 
    survey_water_feature_outdoor_fountain survey_water_feature_outdoor_pond survey_well survey_year 
    survey_year_built survey_year_moved_in Toiletevents Toiletflushstdev Toiletgpd Toilettotalgal 
    Totalshowergal Totalshowerminutes TotalVolume TraceLengthDays persons_per_sqft_indoor Log_capita 
    Log_survey_indoor_sqft Log_persons_per_sqft_indoor Log_survey_household_income low_density_outlier 
    high_density_outlier 
  /BUILD_OPTIONS OBJECTIVE=STANDARD USE_AUTO_DATA_PREPARATION=TRUE CONFIDENCE_LEVEL=95 
    MODEL_SELECTION=FORWARDSTEPWISE CRITERIA_FORWARD_STEPWISE=AICC REPLICATE_RESULTS=TRUE SEED=54752075
  /ENSEMBLES COMBINING_RULE_CONTINUOUS=MEAN COMPONENT_MODELS_N=10.
