SELECT spss.ServiceCity, spss.ServiceState, spss.ServiceZip, spss.MeterMake, spss.MeterModel, spss.MeterSize, Format([dateofaccountinitiation],"yyyy-mm-dd") AS dateofaccountinitiation_d, spss.SampleReads, Format([SampleBegins],"yyyy-mm-dd") AS SampleBegins_d, Format([SampleEnds],"yyyy-mm-dd") AS SampleEnds_d, spss.AnnualKgal, spss.SeasonalKgal, spss.NonseasonalKgal, spss.PctSeasonal, spss.Log_AnnualKgal_Bin, spss.wave, spss.language, spss.q8c, spss.q8d, spss.q15a, spss.q15h, spss.q20f, spss.q21a, spss.q31e, spss.q33l, spss.Clayton_attitude_A, spss.Clayton_attitude_B, spss.Clayton_attitude_C, spss.Clayton_attitude_D, spss.survey_year_moved_in, spss.survey_number_of_bedrooms, spss.survey_number_of_adults, spss.survey_number_of_teenagers, spss.survey_number_of_children, spss.survey_number_of_infants, spss.capita, spss.utility, spss.PrimaryFirst, spss.survey_year, spss.survey_number_of_toilets, spss.survey_number_of_bathtub_showers, spss.survey_number_of_bathtub_only, spss.survey_number_of_whirlpools, spss.survey_number_of_shower_only, spss.survey_number_of_utility_sink, spss.survey_number_of_bathtubs, spss.survey_number_of_showers, spss.survey_disposal, spss.survey_ice_maker, spss.survey_dishwasher, spss.survey_clothes_washer_HE, spss.survey_hot_water_tankless, spss.survey_hot_water_on_demand, spss.survey_evap_cooler, spss.survey_humidifier, spss.survey_treatment, spss.survey_aquarium, spss.survey_pets, spss.survey_spa_indoor, spss.survey_water_feature_indoor, spss.survey_greenhouse_indoor, spss.survey_other_features, spss.survey_number_of_toilets_GT16, spss.survey_number_of_toilets_16, spss.survey_number_of_toilets_HET, spss.survey_number_of_toilets_dual, spss.survey_number_of_showers_hydra, spss.survey_number_of_showers_rain, spss.survey_number_of_showers_spray, spss.survey_replaced_toilets_10, spss.survey_replaced_showerheads_10, spss.survey_replaced_clothes_washer_10, spss.survey_replaced_dishwasher_10, spss.survey_leak_toilet, spss.survey_faucet_drips, spss.survey_leak_pool, spss.survey_leak_irrigation, spss.survey_leak_other, spss.survey_hot_water_gas, spss.survey_hot_water_electric, spss.survey_hot_water_propane, spss.survey_hot_water_solar, spss.survey_hot_water_wait, spss.survey_hot_water_wait_kitchen, spss.survey_hot_water_wait_master_bath, spss.survey_hot_water_wait_other_bath, spss.survey_hot_water_wait_other_room, spss.survey_hot_water_waiting, spss.survey_hot_water_wait_bother, spss.survey_irrigation, spss.survey_landscape_no_maintenance, spss.survey_landscaper, spss.survey_landscaper_waters, spss.survey_well, spss.survey_canal_ditch, spss.survey_stream, spss.survey_rain_barrel, spss.survey_roof_direction, spss.survey_gray_water, spss.survey_other_sources_pct, spss.survey_landscape_turf, spss.survey_landscape_trees_and_shrubs, spss.survey_garden_veggie, spss.survey_garden_flower, spss.survey_landscape_low_water, spss.survey_landscape_nonirrigated, spss.survey_manual_irrigation_pct, spss.survey_irrigation_inground, spss.survey_irrigation_inground_timer, spss.survey_irrigation_inground_master, spss.survey_irrigation_inground_bfp, spss.survey_irrigation_inground_drip, spss.survey_irrigation_manual_override, spss.survey_irrigation_sensor_soil, spss.survey_irrigation_sensor_rain, spss.survey_irrigation_inground_timer_adjusted, spss.survey_irrigation_inground_wbic, spss.survey_spa_or_hot_tub_outdoor, spss.survey_spa_or_hot_tub_outdoor_filled, spss.survey_water_feature_outdoor, spss.survey_pool, spss.survey_pool_fill_automatic, spss.survey_pool_cover_chemical, spss.survey_pool_cover, spss.survey_pool_cover_overnight, spss.survey_car_washed, spss.survey_walk_washed, spss.survey_program_participation_3, spss.survey_conservation_last_few, spss.survey_giveaway_3, spss.survey_retrofit_rebate_3, spss.survey_landscape_rebate_3, spss.survey_followed_guidelines, spss.survey_replaced_clothes_washer_HE, spss.survey_conservation_shower_short, spss.survey_replaced_showerheads_LF, spss.survey_toilet_inserts, spss.survey_replaced_toilets_last_few, spss.survey_disposal_used_less, spss.survey_dishwasher_used_less, spss.survey_clothes_washer_used_less, spss.survey_faucet_drips_repaired, spss.survey_audit_last_few, spss.survey_shower_bucket, spss.survey_replaced_dishwasher_HE, spss.survey_car_washed_less_often, spss.survey_irrigation_less_often, spss.survey_irrigation_avoid_heat, spss.survey_landscape_low_water_last_few, spss.survey_irrigation_timer_shortened_last_few, spss.survey_leak_irrigation_repaired, spss.survey_irrigation_inground_monitor, spss.survey_irrigation_inground_cycle, spss.survey_gray_water_last_few, spss.survey_rain_barrel_last_few, spss.survey_drought, spss.survey_household_pays, spss.survey_year_built, spss.survey_age_of_home, spss.survey_years_in_home, spss.survey_renter, spss.survey_homies, spss.survey_adults_employed, spss.survey_baths_per_week, spss.survey_showers_not_at_home, spss.survey_highest_grade, spss.survey_income, spss.survey_participant, spss.reuws2_attitude_A, spss.reuws2_attitude_B, spss.reuws2_attitude_C, spss.reuws2_attitude_D, spss.reuws2_attitude_E, spss.reuws2_attitude_F, spss.reuws2_attitude_G, spss.reuws2_attitude_H, spss.reuws2_attitude_I, spss.reuws2_attitude_J, spss.reuws2_attitude_K, spss.reuws2_attitude_L, spss.reuws2_attitude_M, spss.reuws2_attitude_N, spss.reuws2_attitude_O, spss.reuws2_attitude_P, spss.reuws2_attitude_Q, spss.reuws2_attitude_R, spss.reuws2_attitude_S, Format([imported],"yyyy-mm-dd") AS imported_d, spss.MeterSPTypeDesc, spss.Dateactive, spss.SampleDays, spss.AverageGPD, spss.WinterReads, spss.Fort_Collins_attitude_A, spss.PremiseYear, spss.Scottsdale_aerator_rebates, spss.Scottsdale_irrigation_controller_rebates, spss.Scottsdale_hot_water_recirculator_rebates, spss.Scottsdale_showerhead_rebates, spss.Scottsdale_toilet_rebates, spss.Scottsdale_turf_rebates, spss.Scottsdale_attitude_A, spss.Scottsdale_attitude_B, spss.Scottsdale_attitude_C, spss.RandomSequence, spss.LogAnnualKgal, spss.LogNonseasonalKgal, spss.LogSeasonalKgal, spss.LogAnnualMean, spss.LogAnnualStDev, spss.LogNonseasonalMean, spss.LogNonseasonalStDev, spss.LogSeasonalMean, spss.LogSeasonalStDev, spss.NormalizedAnnual, spss.NormalizedNonseasonal, spss.NormalizedSeasonal, spss.NormalizedAnnualPredictedByFamily, spss.NormalizedAnnualResidualByFamily, spss.NormalizedNonseasonalPredictedByFamily, spss.NormalizedNonseasonalResidualByFamily, spss.NormalizedSeasonalPredictedByFamily, spss.NormalizedSeasonalResidualByFamily, spss.SurveyID
FROM spss_output AS spss;
