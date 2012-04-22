cd 'S:\local\home\matt'.
cd 'csci7000\Project'.
cd 'Dataset'.

insert file="REUWS1/load.sps".

* MEANS TABLES=AnnualKgal NonseasonalKgal SeasonalKgal BY City
  /CELLS MEAN COUNT STDDEV.
*
* Nominal variables for correlation:
*
    survey_adults_employed survey_aquarium survey_canal_ditch survey_car_washed_less_often survey_cistern 
    survey_clothes_washer survey_clothes_washer_front survey_clothes_washer_top 
    survey_clothes_washer_used_less survey_conservation survey_conservation_shower_short 
    survey_dishwasher survey_dishwasher_used_less survey_disposal survey_disposal_used_less 
    survey_evap_cooler survey_faucet_drips_repaired survey_floors survey_garden_flower 
    survey_garden_veggie survey_gray_water_last_few survey_greenhouse survey_has_alternative_source 
    survey_has_apartment survey_has_been_audited survey_hot_tub survey_hot_water_solar 
    survey_hot_water_tankless survey_household_pays survey_humidifier survey_ice_maker 
    survey_irrigation survey_irrigation_avoid_heat survey_irrigation_efficient_system_installed 
    survey_irrigation_hand survey_irrigation_HOA survey_irrigation_hose_sprinkler 
    survey_irrigation_inground survey_irrigation_inground_back 
    Survey_Irrigation_InGround_Back_Automatic survey_irrigation_inground_cycle 
    survey_irrigation_inground_drip survey_irrigation_inground_front 
    Survey_Irrigation_InGround_Front_Automatic survey_irrigation_inground_timer 
    survey_irrigation_inground_timer_adjusted_conservation survey_irrigation_less_often 
    survey_irrigation_other survey_irrigation_sensor_rain survey_irrigation_sensor_soil 
    survey_irrigation_soaker survey_irrigation_xeri survey_number_of_adults_summer 
    survey_number_of_adults_winter survey_number_of_bathroom_sinks survey_number_of_bathtub_only 
    survey_number_of_bathtub_showers survey_number_of_bathtubs survey_number_of_children_summer 
    survey_number_of_children_winter survey_number_of_kitchen_sinks survey_number_of_shower_only 
    survey_number_of_showers survey_number_of_showers_lfsh survey_number_of_teenagers_summer 
    survey_number_of_teenagers_winter survey_number_of_toilets survey_number_of_toilets_16 
    survey_number_of_utility_sinks survey_number_of_whirlpools survey_other_conservation survey_other_sources survey_pool survey_pressure_regulator survey_rain_barrel survey_renter 
    survey_replaced_showerheads_LF survey_replaced_toilets_ulft survey_roof_direction 
    survey_separate_meters survey_SFR survey_stream survey_toilet_inserts survey_treatment 
    survey_water_feature_outdoor survey_water_feature_outdoor_fountain 
    survey_water_feature_outdoor_pond survey_well
*.

*
* Ordinal variables for correlation:
*
    reuws1_attitude_A survey_drought survey_highest_grade
*.

*
* Scale variables for correlation:
*
    AnnualKgal Averageclotheswasherloadgal Averageshowergal Averageshowermodeflowgpm 
    Averageshowerseconds Averagetoiletflushvolume Bathtubgpd capita Clotheswashergpd 
    Clotheswasherloadsperday Dishwashergpd Faucetgpd IndoorGPD irrigated_area_sqft Leakgpd 
    NonseasonalKgal Othergpd OutdoorGPD SeasonalKgal Showergpd Showerminutesperday Showersperday Survey_Car_Washed survey_home_value survey_homies survey_household_income survey_indoor_sqft 
    survey_irrigation_pct survey_landscape_pct survey_landscape_turf_pct survey_monthly_rent 
    survey_number_of_adults survey_number_of_children survey_number_of_teenagers survey_parcel_sqft 
    survey_walk_washed survey_year_built survey_year_moved_in Toiletflushstdev Toiletgpd TotalGPD survey_age_of_home RandomSequence pct_flushes_gt_2_2 
    pct_flushes_lt_2_2 RandomSequence
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
    survey_adults_employed survey_aquarium survey_canal_ditch survey_car_washed_less_often survey_cistern 
    survey_clothes_washer survey_clothes_washer_front survey_clothes_washer_top 
    survey_clothes_washer_used_less survey_conservation survey_conservation_shower_short 
    survey_dishwasher survey_dishwasher_used_less survey_disposal survey_disposal_used_less 
    survey_evap_cooler survey_faucet_drips_repaired survey_floors survey_garden_flower 
    survey_garden_veggie survey_gray_water_last_few survey_greenhouse survey_has_alternative_source 
    survey_has_apartment survey_has_been_audited survey_hot_tub survey_hot_water_solar 
    survey_hot_water_tankless survey_household_pays survey_humidifier survey_ice_maker 
    survey_irrigation survey_irrigation_avoid_heat survey_irrigation_efficient_system_installed 
    survey_irrigation_hand survey_irrigation_HOA survey_irrigation_hose_sprinkler 
    survey_irrigation_inground survey_irrigation_inground_back 
    Survey_Irrigation_InGround_Back_Automatic survey_irrigation_inground_cycle 
    survey_irrigation_inground_drip survey_irrigation_inground_front 
    Survey_Irrigation_InGround_Front_Automatic survey_irrigation_inground_timer 
    survey_irrigation_inground_timer_adjusted_conservation survey_irrigation_less_often 
    survey_irrigation_other survey_irrigation_sensor_rain survey_irrigation_sensor_soil 
    survey_irrigation_soaker survey_irrigation_xeri survey_number_of_adults_summer 
    survey_number_of_adults_winter survey_number_of_bathroom_sinks survey_number_of_bathtub_only 
    survey_number_of_bathtub_showers survey_number_of_bathtubs survey_number_of_children_summer 
    survey_number_of_children_winter survey_number_of_kitchen_sinks survey_number_of_shower_only 
    survey_number_of_showers survey_number_of_showers_lfsh survey_number_of_teenagers_summer 
    survey_number_of_teenagers_winter survey_number_of_toilets survey_number_of_toilets_16 
    survey_number_of_utility_sinks survey_number_of_whirlpools survey_other_conservation survey_other_sources survey_pool survey_pressure_regulator survey_rain_barrel survey_renter 
    survey_replaced_showerheads_LF survey_replaced_toilets_ulft survey_roof_direction 
    survey_separate_meters survey_SFR survey_stream survey_toilet_inserts survey_treatment 
    survey_water_feature_outdoor survey_water_feature_outdoor_fountain 
    survey_water_feature_outdoor_pond survey_well
    reuws1_attitude_A survey_drought survey_highest_grade
    AnnualKgal Averageclotheswasherloadgal Averageshowergal Averageshowermodeflowgpm 
    Averageshowerseconds Averagetoiletflushvolume Bathtubgpd capita Clotheswashergpd 
    Clotheswasherloadsperday Dishwashergpd Faucetgpd IndoorGPD irrigated_area_sqft Leakgpd 
    NonseasonalKgal Othergpd OutdoorGPD SeasonalKgal Showergpd Showerminutesperday Showersperday Survey_Car_Washed survey_home_value survey_homies survey_household_income survey_indoor_sqft 
    survey_irrigation_pct survey_landscape_pct survey_landscape_turf_pct survey_monthly_rent 
    survey_number_of_adults survey_number_of_children survey_number_of_teenagers survey_parcel_sqft 
    survey_walk_washed survey_year_built survey_year_moved_in Toiletflushstdev Toiletgpd TotalGPD survey_age_of_home RandomSequence pct_flushes_gt_2_2 
    pct_flushes_lt_2_2 RandomSequence
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

