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

ADD FILES 
/file="Clayton_county/Clayton_county_Task5.sav"
/file="Denver/Denver_Task5.sav"
/file="Fort_Collins/Fort_Collins_Task5.sav"
/file="Peel/Peel_Task5.sav"
/file="San_Antonio/San_Antonio_Task5.sav"
/file="Scottsdale/Scottsdale_Task5.sav"
/file="Tacoma/Tacoma_Task5.sav"
/file="Toho/Toho_Task5.sav"
/file="Waterloo/Waterloo_Task5.sav"
.
dataset name AnalysisTable.
*
* Cleanup (this section may become volatile as site encodings change)
*.
*variable level SurveyID (nominal) NonseasonalKgal (scale) utility (nominal).
*variable level PremiseID to MeterSPTypeDesc (nominal).
*variable level PremID to Phone (nominal).
*variable level ADDRESS_KEY to Method (nominal).

if missing(Site) Site=Utility.
execute.
