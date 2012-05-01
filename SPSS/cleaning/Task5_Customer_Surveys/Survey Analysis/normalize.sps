cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".

RANK VARIABLES=survey_income (A) BY Site
  /PROPORTION INTO uniform_income /TIES=MEAN
  /FRACTION=RANKIT.
variable role
/both uniform_income
.

insert file="log_normalize.sps".


