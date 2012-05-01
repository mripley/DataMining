cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections".
GET DATA /TYPE=XLSX
  /FILE='L1 - Toho\Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
variable attribute
variables=all
attribute=table('L1 - Toho\Q1000.xlsx [tblQ1000]')
.
rename variables keycode=SurveyID.
delete variables
queryendshere
.
variable level SurveyID (nominal) CombinedMeter (nominal) tblCustomerInfo_HasPotableIrrigation (nominal) tblCustomerInfo_HasReclaimed (nominal).
alter type TrimmedAccountNumber (F10) TrimmedCustomerNumber (F10).
alter type IrrMeter (F10) ReclmMeter (F10) WaterMeter (F10).

select if ~missing(SurveyID).

alter type Name (A255).
alter type ServiceAddress (A255).
*
* KISSIMME used instead of KISSIMMEE because of incoming mispelling.
* HARMONY FL
* SAINT CLOUD FL
* Saint Cloud FL
* NEW HAVEN CT
* KISSIMME FL
* KISSIMMEE FL
*.
string ServiceCity (A255).
string ServiceState (A2).
*
* missing(string) doesn't work as expected, so must initialize to default values.
*.
compute ServiceCity="Kissimmee?".
compute ServiceState="FL".

do if any(1,
CHAR.INDEX(ServiceAddress,"KISSIMME FL")>0,
CHAR.INDEX(ServiceAddress,"KISSIMMEE, FL")>0,
CHAR.INDEX(ServiceAddress,"KISSIMMEEE FL")>0,
CHAR.INDEX(ServiceAddress,"KISSIMME FL")>0,
CHAR.INDEX(ServiceAddress,"KISSIMMEE FL")>0,
CHAR.INDEX(ServiceAddress,"kissimmee fl")>0
).
compute has_city_in_service_address=1.
compute ServiceCity = "Kissimmee".
compute ServiceState = "FL".
end if.

do if CHAR.INDEX(ServiceAddress,"HARMONY FL")>0.
compute has_city_in_service_address=1.
compute ServiceCity = "Harmony".
compute ServiceState = "FL".
end if.
execute.

do if CHAR.INDEX(ServiceAddress,"NEW HAVEN CT")>0.
compute has_city_in_service_address=1.
compute has_out_of_state_service_address=1.
compute ServiceCity = "New Haven".
compute ServiceState = "CT".
end if.

do if any(1,
CHAR.INDEX(ServiceAddress,"SAINT CLOUD FL")>0,
CHAR.INDEX(ServiceAddress,"Saint Cloud FL")>0
).
compute has_city_in_service_address=1.
compute ServiceCity = "Saint Cloud".
compute ServiceState = "FL".
end if.

do if ~has_city_in_service_address.
if any(1, 
CHAR.INDEX(ServiceAddress2,"KISSIMMEE FL")>0, 
CHAR.INDEX(ServiceAddress2,"KISSIMMEE, FL")>0, 
CHAR.INDEX(ServiceAddress2,"KISSIMMEEE FL")>0,
CHAR.INDEX(ServiceAddress2,"KISSIMME FL")>0
) ServiceCity = "Kissimmee".
if CHAR.INDEX(ServiceAddress2,"SAINT CLOUD FL")>0 ServiceCity = "Saint Cloud".
if CHAR.INDEX(ServiceAddress2,"WINTER GARDEN FL")>0 ServiceCity = "Winter Garden".
end if.

string MeterSize (A255).
recode WaterMeterSize
(0.625="5/8")
(0.75="3/4")
(1="1")
into MeterSize.

EXECUTE.
