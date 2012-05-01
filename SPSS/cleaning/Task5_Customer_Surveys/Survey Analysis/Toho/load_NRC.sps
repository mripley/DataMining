cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Responses".
get file="Toho/Toho.sav".
variable attribute
variables=all
attribute=table('Toho.sav')
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
execute.
