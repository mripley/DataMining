*
* survey_year must be defined prior to common_reuws2_encoding.sps 
*.
compute survey_year=2011.

cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".

insert file="common_reuws2_encoding.sps".

echo "Question 35 might be Toho-specific".
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

echo "Q58-59 are Toho-specific".
RECODE q58a to q58d (MISSING=0).
rename variables
q58a = Toho_attitude_A
q58b = Toho_attitude_B
q58c = Toho_attitude_C
q58d = Toho_attitude_D
.
value labels Toho_attitude_A to Toho_attitude_D
0 'No' 1 'Yes'
.

recode q59a to q59g
(1=1) (2=0.5) (3=-0.5) (4=-1.0) (5=0) into
Toho_attitude_E
Toho_attitude_F
Toho_attitude_G
Toho_attitude_H
Toho_attitude_I
Toho_attitude_J
Toho_attitude_K
.
variable level Toho_attitude_E to Toho_attitude_K (ORDINAL).
value labels Toho_attitude_E to Toho_attitude_K
1.0 "Strongly agree"	
0.5 "Somewhat agree"	
-0.5 "Somewhat disagree"	
-1.0 "Strongly disagree"	
0.0 "Not applicable"	
.
variable labels
Toho_attitude_E 'My water utility should use warnings and fines if people irrigate off schedule or too often'
Toho_attitude_F 'Water utility promotions, such as free shower heads, faucet aerators, toilet rebates, are effective in increasing water conservation awareness'	
Toho_attitude_G 'I would attend irrigation courses created by my water utility if they were free of charge'
Toho_attitude_H 'I would attend water conservation events/seminars sponsored by my water utility if they were free of charge and offered at a convenient time/place'	
Toho_attitude_I 'My water utility should be able to do on-site water usage evaluations (if asked) free of charge'
Toho_attitude_J 'My water utility should contact me when I am consuming too much water'
Toho_attitude_K 'My water utility should provide free updates using social media or text messaging methods if I choose to subscribe'
.
