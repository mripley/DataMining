*
* Before running this,
* Collect city fields: ServiceCity = City serv_city 
* Collect zip code fields: ServiceZip = Postal Zip serv_zip
* Collect meter size fields: MeterSize = MeterSizeDesc meter_size
* Collect meter model fields: MeterModel = ModelDesc Model
* Collect state fields: ServiceState = St serv_state
* Collect meter manufacturer codes: MeterMake = ManfCode manufacturer
*.

*
* Switch to task 5
*.
cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Analysis".
insert file="load_Level_1_all_variables.sps".
insert file="normalize.sps".

*
* Toss irrelevant non-answers from the survey
*.
delete variables
q8c to q21f
q31e q33l
q7miss to q52e capita q41agrp to q41egrp
q58miss q58e
.


