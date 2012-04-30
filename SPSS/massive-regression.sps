

REGRESSION
  /MISSING PAIRWISE
  /STATISTICS COEFF R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT NormalizedNonseasonal
  /method=stepwise survey_number_of_adults survey_number_of_children survey_number_of_infants 
    survey_number_of_teenagers
  /method=stepwise survey_treatment survey_hot_water_on_demand survey_pool survey_replaced_showerheads_10 survey_spa_indoor 
survey_disposal survey_conservation_last_few
  /METHOD=STEPWISE reuws2_attitude_A to reuws2_attitude_S
  /RESIDUALS NORMPROB(ZRESID) ID(SurveyID)
  /save resid (NormalizedNonseasonal_resid)
.

REGRESSION
  /MISSING PAIRWISE
  /STATISTICS COEFF R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT NormalizedNonseasonal
  /method=stepwise survey_number_of_adults survey_number_of_children survey_number_of_infants 
    survey_number_of_teenagers
  /method=stepwise normalized_income survey_adults_employed survey_baths_per_week survey_homies survey_showers_not_at_home 
    survey_number_of_bathtub_only survey_number_of_bathtub_showers survey_number_of_bathtubs 
    survey_number_of_bedrooms survey_number_of_shower_only survey_number_of_showers 
    survey_number_of_showers_hydra survey_number_of_showers_rain survey_number_of_showers_spray 
    survey_number_of_toilets survey_number_of_toilets_16 survey_number_of_toilets_dual 
    survey_number_of_toilets_GT16 survey_number_of_toilets_HET survey_number_of_utility_sink 
    survey_number_of_whirlpools
  /method=stepwise survey_treatment survey_hot_water_on_demand survey_pool survey_replaced_showerheads_10 survey_spa_indoor 
survey_disposal survey_conservation_last_few
  /METHOD=STEPWISE reuws2_attitude_A to reuws2_attitude_S
  /RESIDUALS NORMPROB(ZRESID) ID(SurveyID)
  /save resid (NormalizedNonseasonal_resid2)
.


* OMS.
DATASET DECLARE  ANOVA.
OMS
  /SELECT TABLES
  /IF COMMANDS=['Means'] SUBTYPES=['ANOVA']
  /DESTINATION FORMAT=SAV NUMBERED=TableNumber_
   OUTFILE='ANOVA'.

MEANS TABLES=NormalizedNonseasonal_resid BY survey_aquarium survey_audit_last_few survey_canal_ditch 
    survey_car_washed_less_often survey_clothes_washer_HE survey_clothes_washer_used_less 
    survey_conservation_last_few survey_conservation_shower_short survey_dishwasher 
    survey_dishwasher_used_less survey_disposal survey_disposal_used_less survey_evap_cooler 
    survey_faucet_drips survey_faucet_drips_repaired survey_followed_guidelines
  /CELLS MEAN COUNT STDDEV
  /STATISTICS ANOVA.


MEANS TABLES=NormalizedNonseasonal_resid BY survey_giveaway_3 survey_gray_water 
    survey_gray_water_last_few survey_greenhouse_indoor survey_hot_water_electric survey_hot_water_gas 
    survey_hot_water_on_demand survey_hot_water_propane survey_hot_water_solar 
    survey_hot_water_tankless survey_hot_water_wait survey_hot_water_wait_kitchen 
    survey_hot_water_wait_master_bath survey_hot_water_wait_other_bath survey_hot_water_wait_other_room 
    survey_household_pays survey_humidifier survey_ice_maker
  /CELLS MEAN COUNT STDDEV
  /STATISTICS ANOVA.


MEANS TABLES=NormalizedNonseasonal_resid BY survey_leak_other survey_leak_pool survey_leak_toilet 
    survey_other_features survey_pets survey_pool survey_program_participation_3 survey_renter 
    survey_replaced_clothes_washer_10 survey_replaced_clothes_washer_HE survey_replaced_dishwasher_10 
    survey_replaced_dishwasher_HE survey_replaced_showerheads_10 survey_replaced_showerheads_LF 
    survey_replaced_toilets_10 survey_replaced_toilets_last_few survey_retrofit_rebate_3 
    survey_shower_bucket survey_spa_indoor
  /CELLS MEAN COUNT STDDEV
  /STATISTICS ANOVA.

MEANS TABLES=NormalizedNonseasonal_resid BY survey_stream survey_toilet_inserts survey_treatment 
    survey_water_feature_indoor survey_well
  /CELLS MEAN COUNT STDDEV
  /STATISTICS ANOVA.

omsend.


DESCRIPTIVES VARIABLES=survey_treatment survey_hot_water_on_demand survey_pool survey_replaced_showerheads_10 survey_spa_indoor 
survey_disposal survey_conservation_last_few
  /STATISTICS=MEAN STDDEV MIN MAX.
