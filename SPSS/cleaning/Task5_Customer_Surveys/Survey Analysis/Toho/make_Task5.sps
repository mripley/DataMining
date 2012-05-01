*
* Switch to task 5
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".
insert file="Toho/load_NRC.sps".

cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".
insert file="Toho/Toho_encoding.sps".
EXECUTE.
SORT CASES BY SurveyID(A).
dataset name Surveys.

*
* Load Q1000
*. 
insert file="Toho/load_Q1000.sps".
SORT CASES BY SurveyID(A).
DATASET NAME Q1000.

MATCH FILES /FILE=*
  /TABLE='Surveys'
  /BY surveyID.
EXECUTE.

*
* Switch to task 5
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".
compute imported=$TIME.
if missing(utility) utility=57.
execute.
formats imported (DATE).

*
* Toho drops: WaterMeterSize q35a to q35s q59a to q59g
* Common drops: q1a to q2n q3 q4a to q7e q8a q8b q8e q8f q9 to q14 q15b to q15g q16 to q20e q21b to q31d 
* q32 to q33k q33m to q34 q36 q37 q39 q42 to q47 partic survey_irrigation_inground_wbic1 survey_irrigation_inground_wbic2
* .

SAVE OUTFILE='Toho/Normalized.sav'
  /DROP=
WaterMeterSize q35a to q35s q59a to q59g
q1a to q2n q3 q4a to q7e q8a q8b 
q8e q8f q9 to q14 q15b to q15g q16 to q20e q21b to q31d q32 to q33k q33m to q34 q36 q37 q39 q42 to q47 partic survey_irrigation_inground_wbic1 survey_irrigation_inground_wbic2
  /COMPRESSED.
