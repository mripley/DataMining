*
* Define the common SPSS naming conventions for sites with hot water traces. 
* Changes here will be reflected in Tasks 8 and 9
*.

rename variables
TotalVolume = HotVolume
TraceBegins = HotTraceBegins
TraceEnds = HotTraceEnds
TraceLengthDays = HotTraceLengthDays
TotalGPD = HotTotalGPD
IndoorGPD = HotIndoorGPD
OutdoorGPD = HotOutdoorGPD
Indoortotalgal = HotIndoorGal
Outdoortotalgal = HotOutdoorGal
Bathtubtotalgal = HotBathtubGal
Clotheswashertotalgal = HotClothesWasherGal
Dishwashertotalgal = HotDishwasherGal
Faucettotalgal = HotFaucetGal
Leaktotalgal = HotLeakGal
Othertotalgal = HotOtherGal
Showertotalgal = HotShowerGal
Toilettotalgal = HotToiletGal
Bathtubevents = HotBathtubEvents
Clotheswasherevents = HotClothesWasherEvents
Dishwasherevents = HotDishwasherEvents
Faucetevents = HotFaucetEvents
Leakevents = HotLeakEvents
Otherevents = HotOtherEvents
Showerevents = HotShowerEvents
Toiletevents = HotToiletEvents
Bathtubgpd = HotBathtubGPD
Clotheswashergpd = HotClothesWasherGPD
Dishwashergpd = HotDishwasherGPD
Faucetgpd = HotFaucetGPD
Leakgpd = HotLeakGPD
Othergpd = HotOtherGPD
Showergpd = HotShowerGPD
Toiletgpd = HotToiletGPD
Averageclotheswasherloadgal = HotAverageClothesWasherLoadGal
Clotheswasherloadsperday = HotClothesWasherLoadsPerDay
Totalshowerminutes = HotTotalShowerMinutes
Averageshowerseconds = HotAverageShowerSeconds
Totalshowergal = HotTotalShowerGallons
Averageshowergal = HotAverageShowerGallons
Averageshowermodeflowgpm = HotAverageShowerModeFlowGPM
Showersperday = HotShowersPerDay
Showerminutesperday = HotShowerMinutesPerDay
.


variable labels
HotVolume 'Hot Water Total Volume'
HotTraceLengthDays 'Hot Water Trace Length Days'
HotTotalGPD 'Hot Water Total GPD'
HotIndoorGPD 'Hot Water Indoor GPD'
HotOutdoorGPD 'Hot Water Outdoor GPD'
HotIndoorGal 'Hot Water Indoor total gal'
HotOutdoorGal 'Hot Water Outdoor total gal'
HotBathtubGal 'Hot Water Bathtub total gal'
HotClothesWasherGal 'Hot Water Clotheswasher total gal'
HotDishwasherGal 'Hot Water Dishwasher total gal'
HotFaucetGal 'Hot Water Faucet total gal'
HotLeakGal 'Hot Water Leak total gal'
HotOtherGal 'Hot Water Other total gal'
HotShowerGal 'Hot Water Shower total gal'
HotToiletGal 'Hot Water Toilet total gal'
HotBathtubEvents 'Hot Water Bathtub events'
HotClothesWasherEvents 'Hot Water Clotheswasher events'
HotDishwasherEvents 'Hot Water Dishwasher events'
HotFaucetEvents 'Hot Water Faucet events'
HotLeakEvents 'Hot Water Leak events'
HotOtherEvents 'Hot Water Other events'
HotShowerEvents 'Hot Water Shower events'
HotToiletEvents 'Hot Water Toilet events'
HotBathtubGPD 'Hot Water Bathtub gpd'
HotClothesWasherGPD 'Hot Water Clotheswasher gpd'
HotDishwasherGPD 'Hot Water Dishwasher gpd'
HotFaucetGPD 'Hot Water Faucet gpd'
HotLeakGPD 'Hot Water Leak gpd'
HotOtherGPD 'Hot Water Other gpd'
HotShowerGPD 'Hot Water Shower gpd'
HotToiletGPD 'Hot Water Toilet gpd'
HotAverageClothesWasherLoadGal 'Hot Water Average clotheswasher load gal'
HotClothesWasherLoadsPerDay 'Hot Water Clotheswasher loads per day'
HotTotalShowerMinutes 'Hot Water Total shower minutes'
HotAverageShowerSeconds 'Hot Water Average shower seconds'
HotTotalShowerGallons 'Hot Water Total shower gal'
HotAverageShowerGallons 'Hot Water Average shower gal'
HotAverageShowerModeFlowGPM 'Hot Water Average shower mode flow gpm'
HotShowersPerDay 'Hot Water Showers per day'
HotShowerMinutesPerDay 'Hot Water Shower minutes per day'
.


delete variables
 Averagetoiletflushvolume Toiletflushstdev Numberofflusheslessthan2_2Gal 
 Numberofflushesgreaterthan2_2Gal
.
