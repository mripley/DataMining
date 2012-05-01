*
* TODO: reform like Toho when data come in
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".

*
* Load Q1000
*. 
insert file="Waterloo/load_Q1000.sps".
SORT CASES BY SurveyID(A).
DATASET NAME Q1000.

compute imported=$TIME.
recode ServiceCity
("Cambridge" = 62.1)
("Waterloo" = 62.2)
into Site
.
compute utility=62.
execute.
formats imported (DATE).
