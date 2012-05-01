*
* Switch to task 5
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Responses".
get file="Clayton_County\Clayton County.sav".
variable attribute
variables=all
attribute=table('Clayton County.sav')
.
dataset name surveys.
rename variables id=surveyID.
variable level surveyID (nominal).
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
* Load Clayton encodings
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".
insert file="Clayton_county/Clayton_encoding.sps".
EXECUTE.

*
* Switch to task 3
*.
cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections".
GET DATA /TYPE=XLSX
  /FILE='L1 - Clayton County\Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
EXECUTE.
variable attribute
variables=all
attribute=table('L1 - Clayton County\Q1000.xlsx [tblQ1000]')
.
DATASET NAME q1000.
SORT CASES BY SurveyID(A).

variable level surveyID (nominal).
alter type CustomerName (A255).
alter type ServiceCity (A255) ServiceState (A2) ServiceZip (A5).
alter type MeterMake (A255) MeterModel (A255) MeterSize (A255) MeterLocation (A255).
alter type IrrigationAccountifoneexists (F8) Irrigationcustidifoneexists (F3).

*
* Somehow, this erases values:
*.
* alter type IrrigationAccountifoneexists (F6.0) Irrigationcustidifoneexists (F6.0).

rename variables 
SampleYearBegins=SampleBegins
SampleYearEnds=SampleEnds
.
variable level NonseasonalKgal (scale) SampleReads (scale).
alter type Log_AnnualKgal_Bin (F1.0).

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
if missing(utility) utility=51.
execute.
formats imported (DATE).

*
* Clayton county drops: q35a to q35s
* Common drops: q1a to q2n q3 q4a to q7e q8a q8b q8e q8f q9 to q14 q15b to q15g q16 to q20e q21b to q21d q22 to q25 q26 to q31d
* q32 to q33k q33m to q34 q36 q37 q39 q42 to q47 partic survey_irrigation_inground_wbic1 survey_irrigation_inground_wbic2
* .

SAVE OUTFILE='Clayton_county/Normalized.sav'
  /DROP=q35a to q35s
q1a to q2n q3 q4a to q7e q8a q8b q8e q8f q9 to q14 q15b to q15g q16 to q20e q21b to q21d q22 to q25 q26 to q31d 
q32 to q33k q33m to q34 q36 q37 q39 q42 to q47 partic survey_irrigation_inground_wbic1 survey_irrigation_inground_wbic2
  /COMPRESSED.
