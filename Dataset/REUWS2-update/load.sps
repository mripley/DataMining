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
/file="Clayton_county/Normalized.sav"
/file="Denver/Normalized.sav"
/file="Fort_Collins/Normalized.sav"
/file="Scottsdale/Normalized.sav"
.
*
* Cleanup
*.
variable level NonseasonalKgal (scale) utility (nominal).
EXECUTE.

cd 'S:\local\home\matt'.
cd 'csci7000\Project'.
cd 'Dataset'.

insert file="REUWS2-update\cleaning.sps".
insert file="random_number_generation.sps".

