cd 'S:\local\home\matt'.
cd 'csci7000\Project'.
cd 'Dataset'.

insert file="REUWS1/load.sps".
insert file="log_residual_by_family.sps".
*
* Nominal variables:
*
    KEYCODE survey_irrigation_inground_front survey_irrigation_inground_back 
    survey_irrigation_inground_drip survey_irrigation_soaker survey_irrigation_hose_sprinkler 
    survey_irrigation_hand survey_irrigation_other survey_conservation_shower_short 
    survey_replaced_showerheads_LF survey_toilet_inserts survey_replaced_toilets_ulft 
    survey_disposal_used_less survey_dishwasher_used_less survey_clothes_washer_used_less 
    survey_faucet_drips_repaired survey_gray_water_last_few survey_car_washed_less_often 
    survey_irrigation_less_often survey_irrigation_avoid_heat survey_irrigation_xeri 
    survey_irrigation_inground_timer_adjusted_conservation survey_irrigation_efficient_system_installed 
    survey_irrigation_inground_cycle survey_has_been_audited survey_other_conservation 
    survey_number_of_adults_winter survey_number_of_teenagers_winter survey_number_of_children_winter 
    survey_number_of_adults_summer survey_number_of_teenagers_summer survey_number_of_children_summer 
    survey_number_of_toilets survey_number_of_bathtub_showers survey_number_of_bathtub_only 
    survey_number_of_shower_only survey_number_of_whirlpools survey_number_of_bathroom_sinks 
    survey_number_of_kitchen_sinks survey_number_of_utility_sinks survey_number_of_bathtubs 
    survey_number_of_showers survey_disposal survey_clothes_washer_top survey_clothes_washer_front 
    survey_dishwasher survey_pool survey_hot_tub survey_evap_cooler survey_pressure_regulator 
    survey_treatment survey_greenhouse survey_garden_flower survey_garden_veggie survey_clothes_washer 
    survey_aquarium survey_hot_water_solar survey_humidifier survey_ice_maker survey_hot_water_tankless 
    survey_water_feature_outdoor_fountain survey_water_feature_outdoor_pond 
    survey_water_feature_outdoor survey_number_of_showers_lfsh survey_number_of_toilets_16 
    survey_other_sources survey_canal_ditch survey_cistern survey_well survey_stream 
    survey_has_alternative_source survey_rain_barrel survey_roof_direction survey_irrigation 
    survey_irrigation_inground survey_irrigation_HOA Survey_Irrigation_InGround_Front_Automatic 
    Survey_Irrigation_InGround_Back_Automatic survey_irrigation_inground_timer 
    survey_irrigation_sensor_rain survey_irrigation_sensor_soil survey_conservation survey_SFR 
    survey_has_apartment survey_separate_meters survey_household_pays survey_adults_employed 
    survey_floors survey_renter
*.

*
* Ordinal variables:
*
    reuws1_attitude_A survey_drought survey_highest_grade
*.

*
* Scale variables:
*
    irrigated_area_sqft Q3 Q4no Q4year Q5no Q5year Q6 Q13 Q14 Q20 Q23no Q23length Q23width Q23depth survey_year 
    survey_parcel_sqft survey_landscape_pct survey_landscape_turf_pct survey_irrigation_pct 
    Survey_Car_Washed survey_walk_washed survey_number_of_adults survey_number_of_teenagers 
    survey_number_of_children capita survey_homies survey_year_built survey_year_moved_in 
    survey_indoor_sqft survey_monthly_rent survey_home_value survey_household_income TraceLengthDays 
    TotalGPD IndoorGPD OutdoorGPD Bathtubgpd Clotheswashergpd Dishwashergpd Faucetgpd Leakgpd Othergpd 
    Showergpd Toiletgpd Averageclotheswasherloadgal Clotheswasherloadsperday Averageshowerseconds Averageshowergal Averageshowermodeflowgpm Showersperday Showerminutesperday 
    Averagetoiletflushvolume Toiletflushstdev survey_age_of_home pct_flushes_gt_2_2 pct_flushes_lt_2_2 RandomSequence NormalizedAnnual 
    NormalizedNonseasonal NormalizedSeasonal NormalizedAnnualResidualByFamily 
    NormalizedNonseasonalResidualByFamily NormalizedSeasonalResidualByFamily
*.

* OMS.
DATASET DECLARE  Correlations.
OMS
  /SELECT TABLES
  /IF COMMANDS=['Correlations'] SUBTYPES=['Correlations']
  /DESTINATION FORMAT=SAV NUMBERED=TableNumber_
   OUTFILE='Correlations'.

CORRELATIONS
  /VARIABLES=
    KEYCODE survey_irrigation_inground_front survey_irrigation_inground_back 
    survey_irrigation_inground_drip survey_irrigation_soaker survey_irrigation_hose_sprinkler 
    survey_irrigation_hand survey_irrigation_other survey_conservation_shower_short 
    survey_replaced_showerheads_LF survey_toilet_inserts survey_replaced_toilets_ulft 
    survey_disposal_used_less survey_dishwasher_used_less survey_clothes_washer_used_less 
    survey_faucet_drips_repaired survey_gray_water_last_few survey_car_washed_less_often 
    survey_irrigation_less_often survey_irrigation_avoid_heat survey_irrigation_xeri 
    survey_irrigation_inground_timer_adjusted_conservation survey_irrigation_efficient_system_installed 
    survey_irrigation_inground_cycle survey_has_been_audited survey_other_conservation 
    survey_number_of_adults_winter survey_number_of_teenagers_winter survey_number_of_children_winter 
    survey_number_of_adults_summer survey_number_of_teenagers_summer survey_number_of_children_summer 
    survey_number_of_toilets survey_number_of_bathtub_showers survey_number_of_bathtub_only 
    survey_number_of_shower_only survey_number_of_whirlpools survey_number_of_bathroom_sinks 
    survey_number_of_kitchen_sinks survey_number_of_utility_sinks survey_number_of_bathtubs 
    survey_number_of_showers survey_disposal survey_clothes_washer_top survey_clothes_washer_front 
    survey_dishwasher survey_pool survey_hot_tub survey_evap_cooler survey_pressure_regulator 
    survey_treatment survey_greenhouse survey_garden_flower survey_garden_veggie survey_clothes_washer 
    survey_aquarium survey_hot_water_solar survey_humidifier survey_ice_maker survey_hot_water_tankless 
    survey_water_feature_outdoor_fountain survey_water_feature_outdoor_pond 
    survey_water_feature_outdoor survey_number_of_showers_lfsh survey_number_of_toilets_16 
    survey_other_sources survey_canal_ditch survey_cistern survey_well survey_stream 
    survey_has_alternative_source survey_rain_barrel survey_roof_direction survey_irrigation 
    survey_irrigation_inground survey_irrigation_HOA Survey_Irrigation_InGround_Front_Automatic 
    Survey_Irrigation_InGround_Back_Automatic survey_irrigation_inground_timer 
    survey_irrigation_sensor_rain survey_irrigation_sensor_soil survey_conservation survey_SFR 
    survey_has_apartment survey_separate_meters survey_household_pays survey_adults_employed 
    survey_floors survey_renter
    reuws1_attitude_A survey_drought survey_highest_grade
    irrigated_area_sqft Q3 Q4no Q4year Q5no Q5year Q6 Q13 Q14 Q20 Q23no Q23length Q23width Q23depth survey_year 
    survey_parcel_sqft survey_landscape_pct survey_landscape_turf_pct survey_irrigation_pct 
    Survey_Car_Washed survey_walk_washed survey_number_of_adults survey_number_of_teenagers 
    survey_number_of_children capita survey_homies survey_year_built survey_year_moved_in 
    survey_indoor_sqft survey_monthly_rent survey_home_value survey_household_income TraceLengthDays 
    TotalGPD IndoorGPD OutdoorGPD Bathtubgpd Clotheswashergpd Dishwashergpd Faucetgpd Leakgpd Othergpd 
    Showergpd Toiletgpd Averageclotheswasherloadgal Clotheswasherloadsperday Averageshowerseconds Averageshowergal Averageshowermodeflowgpm Showersperday Showerminutesperday 
    Averagetoiletflushvolume Toiletflushstdev survey_age_of_home pct_flushes_gt_2_2 pct_flushes_lt_2_2 RandomSequence NormalizedAnnual 
    NormalizedNonseasonal NormalizedSeasonal NormalizedAnnualResidualByFamily 
    NormalizedNonseasonalResidualByFamily NormalizedSeasonalResidualByFamily
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

omsend.

cd 'REUWS1/correlations'.
dataset activate Correlations.
compute r_row=any(Var2, "Pearson Correlation").
compute sig_row=any(Var2, "Sig. (2-tailed)").
compute n_row=any(Var2, "N").
execute.

echo "Creating coefficient matrix copy".
DATASET COPY  r.
DATASET ACTIVATE  r.
FILTER OFF.
USE ALL.
SELECT IF r_row.
EXECUTE.
SAVE TRANSLATE OUTFILE='coeffs-tabular.tab'
  /TYPE=TAB
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES
  /DROP=TableNumber_ to Label_ Var2 r_row to n_row.

echo "Creating significance matrix copy".
DATASET ACTIVATE Correlations.
DATASET COPY  sig.
DATASET ACTIVATE  sig.
FILTER OFF.
USE ALL.
SELECT IF sig_row.
EXECUTE.
SAVE TRANSLATE OUTFILE='significance-tabular.tab'
  /TYPE=TAB
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES
  /DROP=TableNumber_ to Label_ Var2 r_row to n_row.

echo "Creating count matrix copy".
DATASET ACTIVATE Correlations.
DATASET COPY  n.
DATASET ACTIVATE  n.
FILTER OFF.
USE ALL.
SELECT IF n_row.
EXECUTE.
SAVE TRANSLATE OUTFILE='count-tabular.tab'
  /TYPE=TAB
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES
  /DROP=TableNumber_ to Label_ Var2 r_row to n_row.

