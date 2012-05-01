*
* Switch to task 5
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Responses".
get file="Fort_Collins\Fort Collins.sav".
variable attribute
variables=all
attribute=table('Fort Collins.sav')
.
dataset name surveys.
rename variables id=surveyID.
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
insert file="Fort_Collins/Fort_Collins_encoding.sps".

*
* Switch to task 3
*.
cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections".
GET DATA /TYPE=XLSX
  /FILE='L1 - Fort Collins\Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
variable attribute
variables=all
attribute=table('L1 - Fort Collins\Q1000.xlsx [tblQ1000]')
.
EXECUTE.
DATASET NAME q1000.
SORT CASES BY surveyID(A).

rename variables 
Address=ServiceAddress
City=ServiceCity
St=ServiceState
ZIP=ServiceZip
ManfCode=MeterMake
Model=MeterModel
Nonseasonal=NonSeasonalKgal
.
alter type ServiceAddress (A255).
alter type ServiceCity (A255) ServiceState (A2) ServiceZip (A5).
alter type MeterMake (A255) MeterModel (A255).

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
if missing(utility) utility=53.
execute.
formats imported (DATE).

*
* Fort Collins drops: q35a to q35s
* Common drops: q1a to q2n q3 q4a to q7e q8a q8b q8e q8f q9 to q14 q15b to q15g q16 to q20e q21b to q31d 
* q32 to q33k q33m to q34 q36 q37 q39 q42 to q47 partic survey_irrigation_inground_wbic1 survey_irrigation_inground_wbic2
* .

SAVE OUTFILE='Fort_Collins/Normalized.sav'
  /DROP=q35a to q35s q1a to q2n q3 q4a to q7e q8a q8b q8e q8f q9 to q14 q15b to q15g q16 to q20e q21b to q31d q32 to q33k q33m to q34 q36 q37 q39 q42 to q47 partic survey_irrigation_inground_wbic1 survey_irrigation_inground_wbic2
  /COMPRESSED.
