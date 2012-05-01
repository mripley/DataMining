cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".
*
* survey_year must be defined prior to common_reuws2_encoding.sps 
*.
compute survey_year=2011.

*
* common_reuws2_encoding.sps does not EXECUTE
*.
insert file="common_reuws2_encoding.sps".

echo "Question 35 might be Denver-specific".
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
variable labels
reuws2_attitude_A 'Most households in my community know where their water comes from when they turn on the tap.'
reuws2_attitude_B 'Residents should be allowed to track their household water use via the web or by reading their own water meter.'
reuws2_attitude_C 'Households would conserve more water if they had an easier way to monitor their water use.'
reuws2_attitude_D 'Without looking at past bills, I know about how much my average (typical) household water bill was (in dollars) last year.'
reuws2_attitude_E 'Without looking at past bills, I know about how much water my household used in an average (typical) billing period last year.'
reuws2_attitude_F 'The cost of water is an important factor for me when deciding how much water to use indoors (e.g. for washing dishes,'
reuws2_attitude_G 'The cost of water is an important factor for me when deciding how much water to use outdoors (e.g., for watering the lawn or garden, etc.).'
reuws2_attitude_H 'I take into account the cost of wastewater (sewer) service when deciding how much water to use.* *If you are charged a flat rate for wasterwater/sewer service, mark "not applicable."'
reuws2_attitude_I 'Conservation of water is critical for the future of my community.'
reuws2_attitude_J 'There should be strong financial penalties for people who use too much water.'
reuws2_attitude_K 'I am aware of rebates offered by my water utility.'
reuws2_attitude_L 'Water rates should be increased to encourage water conservation.'
reuws2_attitude_M 'I conserve water to save money.'
reuws2_attitude_N 'I conserve water to save energy.'
reuws2_attitude_O 'I conserve water because it is the right thing to do.'
reuws2_attitude_P 'People who use more water should pay more per gallon for their water.'
reuws2_attitude_Q 'My water utility should be more active in promoting water conservation on the part of households and businesses.'
reuws2_attitude_R 'My water utility should provide financial incentives to conserve water.'
reuws2_attitude_S 'My water utility should promote water use guidelines.'
.

EXECUTE.