*
* Switch to task 5
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Responses".
get file="San_Antonio\San Antonio.sav".
variable attribute
variables=all
attribute=table('San Antonio.sav')
.
dataset name surveys.
rename variables id=surveyID.
SORT CASES BY surveyID(A) wave(A).

echo 'Deleting the subsequent waves of duplicate entries'.
SELECT IF ~duplicate.

*
* Switch to analysis
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".
insert file="San_Antonio/San_Antonio_encoding.sps".

*
* Switch to task 3
*.
cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections".
GET DATA /TYPE=XLSX
  /FILE='L1 - San Antonio\Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
variable attribute
variables=all
attribute=table('L1 - San Antonio\Q1000.xlsx [tblQ1000]')
.
EXECUTE.
DATASET NAME q1000.
SORT CASES BY SurveyID(A).

variable level CombinedMeter SeparateMeters (nominal).

rename variables
CUSTOMER_NAME=CustomerName
SERVICE_ZIP=ServiceZip
Metersizeinches=MeterSize
.

if MeterSize="" and ~missing(METERSZ) MeterSize=String(METERSZ, F4.3).
execute.

alter type SERNO (F8) UNITID (F8).

string ServiceCity (A255) ServiceState (A2).
compute ServiceCity="San Antonio".
compute ServiceState="TX".
execute.

alter type CustomerName (A255).
alter type ServiceCity (A255) ServiceState (A2) ServiceZip (A5).
alter type MeterMake (A255) MeterSize (A255).
* alter type Log_AnnualKgal_Bin (F1.0).

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
if missing(utility) utility=54.
execute.
formats imported (DATE).

*
* San Antonio drops: q35a to q35s METERSZ
* Common drops: q1a to q2n q3 q4a to q7e q8a q8b q8e q8f q9 to q14 q15b to q15g q16 to q20e q21b to q31d 
* q32 to q33k q33m to q34 q36 q37 q39 q42 to q47 partic survey_irrigation_inground_wbic1 survey_irrigation_inground_wbic2
* .

SAVE OUTFILE='San_Antonio/Normalized.sav'
  /DROP=q35a to q35s METERSZ
q1a to q2n q3 q4a to q7e q8a q8b 
q8e q8f q9 to q14 q15b to q15g q16 to q20e q21b to q31d q32 to q33k q33m to q34 q36 q37 q39 q42 to q47 partic survey_irrigation_inground_wbic1 survey_irrigation_inground_wbic2
  /COMPRESSED.
