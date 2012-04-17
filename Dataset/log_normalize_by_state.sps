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
  /VLABELS VARIABLES=ServiceState LogAnnualKgal LogNonseasonalKgal LogSeasonalKgal DISPLAY=DEFAULT
  /TABLE ServiceState [C] BY LogAnnualKgal [S][MEAN, COUNT F40.0, STDDEV] + LogNonseasonalKgal [S][MEAN, 
    COUNT F40.0, STDDEV] + LogSeasonalKgal [S][MEAN, COUNT F40.0, STDDEV]
  /CATEGORIES VARIABLES=ServiceState ORDER=A KEY=VALUE EMPTY=EXCLUDE.

omsend.

dataset activate means.
rename variables 
Var2=ServiceState 
Mean=LogAnnualMean StandardDeviation=LogAnnualStDev 
Mean_A=LogNonseasonalMean StandardDeviation_A=LogNonseasonalStDev 
Mean_B=LogSeasonalMean StandardDeviation_B=LogSeasonalStDev
.
sort cases by ServiceState.

dataset activate AnalysisTable.
alter type ServiceState (AMIN).
sort cases by ServiceState.
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
  /BY ServiceState
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7.
compute NormalizedAnnual=(LogAnnualKgal - LogAnnualMean)/LogAnnualStDev.
compute NormalizedNonseasonal=(LogNonseasonalKgal - LogNonseasonalMean)/LogNonseasonalStDev.
compute NormalizedSeasonal=(LogSeasonalKgal - LogSeasonalMean)/LogSeasonalStDev.
EXECUTE.
