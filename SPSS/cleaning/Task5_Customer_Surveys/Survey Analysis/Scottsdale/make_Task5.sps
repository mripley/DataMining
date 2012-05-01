*
* Switch to task 5
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Responses".
get file="Scottsdale\ScottsdaleALL.sav".
variable attribute
variables=all
attribute=table('ScottsdaleALL.sav')
.
dataset name surveys.
rename variables keycode=surveyID.
SORT CASES BY surveyID(A) wave(A).

echo 'Deleting the subsequent waves of duplicate entries'.
MATCH FILES
  /FILE=*
  /BY surveyID
  /FIRST=PrimaryFirst.
VARIABLE LABELS  PrimaryFirst 'Indicator of each first matching case as Primary'.
SELECT IF PrimaryFirst.
FREQUENCIES VARIABLES=PrimaryFirst.

*
* Switch to analysis
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".
insert file="Scottsdale/Scottsdale_encoding.sps".

*
* Switch to task 3
* Scottsdale is different than other sites: it draws Q1000 from an updated database rather than an Excel sheet.
*.
GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=MS Access Database;DBQ=Z:\Projects\+REUWS_2\Task3_Sample_Selections\L1 - '+
    'Scottsdale\Second_sample\import.accdb;DriverId=25;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;'
  /SQL='SELECT *  FROM tblQ1000'
  /ASSUMEDSTRWIDTH=255.
CACHE.
variable attribute
variables=all
attribute=table('Scottsdale\Second_sample\import.accdb [tblQ1000]')
.
EXECUTE.
DATASET NAME q1000.

*
* Cleanup
*.
alter type SeasonalKgal (F3.0).
variable level SeasonalKgal (scale).

variable level Keycode (nominal) AccountID (nominal) debtor_no (nominal) meter_no (nominal).
alter type serv_zip (A9).
compute serv_zip=LTRIM(serv_zip).

rename variables keycode=SurveyID.
SORT CASES BY SurveyID(A).

rename variables
Name=CustomerName
serv_city=ServiceCity
serv_state=ServiceState
serv_zip=ServiceZip
manufacturer=MeterMake
meter_size=MeterSize
.
alter type CustomerName (A255).
alter type ServiceCity (A255) ServiceState (A2) ServiceZip (A5).
alter type MeterMake (A255) MeterSize (A255) MeterLocation (A255).

* rename variables
AERATORRebate=Scottsdale_aerator_rebates
CONTROLLERRebate=Scottsdale_irrigation_controller_rebates
HOTWATERRECIRCULATORRebate=Scottsdale_hot_water_recirculator_rebates 
SHOWERHEADRebate=Scottsdale_showerhead_rebates 
TOILETRebate=Scottsdale_toilet_rebates 
TURFRebate=Scottsdale_turf_rebates
.
* variable level Scottsdale_aerator_rebates to Scottsdale_turf_rebates (scale).
variable level AERATORRebate to TURFRebate (scale).

MATCH FILES /FILE=*
  /TABLE='surveys'
  /BY surveyID.
EXECUTE.

*
* Switch to task 5
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".
compute imported=$TIME.
if missing(utility) utility=55.
execute.
formats imported (DATE).

*
* Scottsdale drops: mail_addr1 mail_addr2 mail_city mail_state mail_zip q35a to q35s id round
* Common drops: q1a to q2n q3 q4a to q7e q8a q8b q8e q8f q9 to q14 q15b to q15g q16 to q20e q21b to q31d 
* q32 to q33k q33m to q34 q36 q37 q39 q42 to q47 partic survey_irrigation_inground_wbic1 survey_irrigation_inground_wbic2
* .

SAVE OUTFILE='Scottsdale/Normalized.sav'
  /DROP=mail_addr1 mail_addr2 mail_city mail_state mail_zip q35a to q35s id round
q1a to q2n q3 q4a to q7e q8a q8b 
q8e q8f q9 to q14 q15b to q15g q16 to q20e q21b to q31d q32 to q33k q33m to q34 q36 q37 q39 q42 to q47 partic survey_irrigation_inground_wbic1 survey_irrigation_inground_wbic2
  /COMPRESSED.
