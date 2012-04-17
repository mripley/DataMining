insert file="log_transform.sps".

* OMS.
DATASET DECLARE  Means.
OMS
  /SELECT TABLES
  /IF COMMANDS=['CTables'] SUBTYPES=['Custom Table']
  /DESTINATION FORMAT=SAV NUMBERED=TableNumber_
   OUTFILE='Means'.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=ServiceCity LogAnnualKgal LogNonseasonalKgal LogSeasonalKgal DISPLAY=DEFAULT
  /TABLE ServiceCity [C] BY LogAnnualKgal [S][MEAN, COUNT F40.0, STDDEV] + LogNonseasonalKgal [S][MEAN, 
    COUNT F40.0, STDDEV] + LogSeasonalKgal [S][MEAN, COUNT F40.0, STDDEV]
  /CATEGORIES VARIABLES=ServiceCity ORDER=A KEY=VALUE EMPTY=EXCLUDE.

omsend.

dataset activate means.
rename variables 
Var2=ServiceCity 
Mean=CityLogAnnualMean StandardDeviation=CityLogAnnualStDev 
Mean_A=CityLogNonseasonalMean StandardDeviation_A=CityLogNonseasonalStDev 
Mean_B=CityLogSeasonalMean StandardDeviation_B=CityLogSeasonalStDev
.
sort cases by ServiceCity.

dataset activate AnalysisTable.
alter type ServiceCity (AMIN).
sort cases by ServiceCity.
*
* This type of join is accomplished in the GUI by:
* Selecting the bigger table
* Data -> Add Variables
* Selecting the smaller table
* Non-active dataset is the keyed table
* Moving the join variable name into keys
*.
MATCH FILES /FILE=*
  /TABLE='Means'
  /RENAME (Command_ Count Count_A Count_B Label_ Subtype_ TableNumber_ Var1 = d0 d1 d2 d3 d4 d5 d6 
    d7) 
  /BY ServiceCity
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7.
compute CityNormalizedAnnual=(LogAnnualKgal - CityLogAnnualMean)/CityLogAnnualStDev.
compute CityNormalizedNonseasonal=(LogNonseasonalKgal - CityLogNonseasonalMean)/CityLogNonseasonalStDev.
compute CityNormalizedSeasonal=(LogSeasonalKgal - CityLogSeasonalMean)/CityLogSeasonalStDev.
EXECUTE.
