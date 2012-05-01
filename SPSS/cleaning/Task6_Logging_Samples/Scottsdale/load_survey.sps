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
dataset name Survey.

select if any(utility, 55).
execute.

begin program python.
import sys
sys.path.append("s:/local/home/matt/python")
from spssaux2 import FindEmptyVars

for v in FindEmptyVars(delete=True):
   print "Deleted empty variable:", v
end program.

*
* Scottsdale-specific:
*.
compute has_better_meter=any(upper(rtrim(MeterMake)), "BADGER", "NEPTUNE").
compute has_meter_location=(rtrim(MeterLocation) ~= "").
compute has_rebate=sum(0, AeratorRebate to TurfRebate)>0.
compute preferred_logging=has_better_meter and has_meter_location.
execute.


