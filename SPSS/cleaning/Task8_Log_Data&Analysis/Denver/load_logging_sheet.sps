*
* To work around a bug in SPSS, you need to first make a copy of the logging sheet, and then load it here.
* Other sites may not have this problem. 
*.

cd "Z:\Projects\+REUWS_2".
cd "Task8_Log_Data&Analysis".

GET DATA
  /TYPE=XLS
  /FILE='Denver\Denver Master Logging Sheet-SPSS.xls'
  /SHEET=name 'GoodTraces_Den'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
EXECUTE.
variable attribute
variables=all
attribute=table("Denver Master Logging Sheet-SPSS.xls [GoodTraces_Den]")
.
rename variables 
Keycode=logging_filename
AcctName=CustomerName
Phone=CustomerPhone
Email=CustomerEmail
FinalTraceStatus=has_trace
RegisterVol = RegisterVolume
.

alter type InstallRead (F7) PickupRead (F7).
alter type LoggedVolume (F5) RegisterVolume (F5) TWVolume (F5).
alter type CF (F3.2).

string Keycode (A6).
compute Keycode=upper(logging_filename).
select if any(rtrim(Type), "Baseline").

* Identify Duplicate Cases.
SORT CASES BY Keycode(A).
MATCH FILES
  /FILE=*
  /BY Keycode
  /FIRST=PrimaryFirst
  /LAST=PrimaryLast.
select if PrimaryFirst.
EXECUTE.

*
* Denver drops:
* Type StreetAddress City State Zip Country SIC NAICS Survey Client Job ZillowRpt MeterNum MtrMake MtrSize InstallTime PickupTime V50 to V59
*
*.

delete variables
Type StreetAddress City State Zip Country SIC NAICS Survey Client Job ZillowRpt MeterNum MtrMake MtrSize InstallTime PickupTime V50 to V59
.
