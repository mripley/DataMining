cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".

*
* survey_year must be defined prior to common_reuws2_encoding.sps 
*.
compute survey_year=2011.

insert file="common_reuws2_encoding.sps".

echo "Question 35 might be Scottsdale-specific".
recode q35a to q35s
(1=1) (2=0.5) (3=-0.5) (4=-1.0) (5=0) into
reuws2_attitude_A
reuws2_attitude_B
reuws2_attitude_C
reuws2_attitude_D
reuws2_attitude_E
reuws2_attitude_F
reuws2_attitude_G
reuws2_attitude_H
reuws2_attitude_I
reuws2_attitude_J
reuws2_attitude_K
reuws2_attitude_L
reuws2_attitude_M
reuws2_attitude_N
reuws2_attitude_O
reuws2_attitude_P
reuws2_attitude_Q
reuws2_attitude_R
reuws2_attitude_S
.
variable level reuws2_attitude_A to reuws2_attitude_S (ORDINAL).
value labels reuws2_attitude_A to reuws2_attitude_S
1.0 "Strongly agree"	
0.5 "Somewhat agree"	
-0.5 "Somewhat disagree"	
-1.0 "Strongly disagree"	
0.0 "Not applicable"	
.

echo "Q48 - Q50 are Scottsdale-specific".
missing values q48 (3).
rename variables
q48 = Scottsdale_attitude_A
q49 = Scottsdale_attitude_B
q50 = Scottsdale_attitude_C
.
EXECUTE.
