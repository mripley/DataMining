*
* TODO: reform like Toho when data come in
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".

*
* Load Q1000
*. 
insert file="Peel/load_Q1000.sps".
SORT CASES BY SurveyID(A).
DATASET NAME Q1000.

compute imported=$TIME.
compute utility=61.
execute.
formats imported (DATE).
