cd 'Z:\Projects\+REUWS_2'.
cd 'Task9_Database\REUS1'.

get file='sample_intervals.sav'.
rename variables (AnnualKgal=SamplingAnnualKgal).
dataset name sample_intervals.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=MS Access Database;DBQ=Z:\Inactive_Projects\REUS\BigDataBase\REUWS.mdb;DriverId='+
    '281;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;'
  /SQL='SELECT KEYCODE, [IRRIGATED AREA (SF)] AS irrigated_area_sqft FROM [IRRIGATED AREA DATA];'
  /ASSUMEDSTRWIDTH=255.
CACHE.
SORT CASES BY KEYCODE(A).
EXECUTE.
dataset name area.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=MS Access Database;DBQ=Z:\Inactive_Projects\REUS\BigDataBase\REUWS.mdb;DriverId='+
    '281;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;'
  /SQL='SELECT KEYCODE, [INDOOR -- ANNUAL]/1000 As NonseasonalKgal, [OUTDOOR -- ANNUAL]/1000 as '+
    'SeasonalKgal, NonseasonalKgal+SeasonalKgal As AnnualKgal FROM [OUTDOOR USE];'
  /ASSUMEDSTRWIDTH=255.
CACHE.
SORT CASES BY KEYCODE(A).
EXECUTE.
DATASET NAME billing.

DATASET ACTIVATE sample_intervals.
MATCH FILES /FILE=*
  /FILE='area'
  /IN has_area
  /FILE='billing'
  /IN has_billing
  /FILE='survey.sav'
  /IN has_survey2
  /FILE='traces.sav'
  /IN has_trace
  /BY KEYCODE.
dataset name AnalysisTable.

*
* Cleanup
*.
rename variables City=ServiceCity State=ServiceState.
compute survey_age_of_home=survey_year-survey_year_built.
compute pct_flushes_gt_2_2 = Numberofflushesgreaterthan2_2Gal / ToiletEvents.
compute pct_flushes_lt_2_2 =  Numberofflusheslessthan2_2Gal / ToiletEvents.
execute.
variable level Keycode survey_irrigation_inground survey_irrigation_inground_timer (nominal).
variable level reuws1_attitude_A survey_drought survey_highest_grade (ordinal).
if missing(AnnualKgal) AnnualKgal=SamplingAnnualKgal.
execute.

SORT CASES BY KEYCODE(A).

cd 'S:\local\home\matt'.
cd 'csci7000\Project'.
cd 'Dataset'.

insert file="REUWS1\cleaning.sps".
insert file="random_number_generation.sps".
execute.

dataset close area.
dataset close billing.

*SAVE OUTFILE='REUWS1\sample5574.sav'
  /COMPRESSED.
