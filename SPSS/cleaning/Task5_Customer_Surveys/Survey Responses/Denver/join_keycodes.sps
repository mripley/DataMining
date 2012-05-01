*
* This is no longer used.
*.

cd "Z:\Docs_Tools\DataLogging".

echo "Empty columns in Excel will cause some verbose warnings here.".
GET DATA
  /TYPE=XLS
  /FILE='Master Keycode File\Master keycode file 022112.xls'
  /SHEET=name 'S-SingleFamily '
  /CELLRANGE=range 'A1291:AY1413'
  /READNAMES=off
  /ASSUMEDSTRWIDTH=32767.
EXECUTE.

rename variables
(V1=Keycode)
(V2=Study2)
(V3=SurveyID)
(V4=Type)
(V5=Oldcode)
(V6=CustID)
(V7=AcctName)
(V8=StreetAddress)
(V9=City)
(V10=State)
(V11=Zip)
(V12=Country)
(V13=Phone)
(V14=Email)
(V15=Survey)
(V16=Client)
(V17=STUDY17)
(V18=Path)
(V19=Lat)
(V20=Long)
(V21=AccountNum)
(V22=RegisterNum)
(V23=MeterNum)
(V24=MtrMake)
(V25=MtrModel)
(V26=MtrSize)
(V27=InstallDate)
(V28=InstallTime)
(V29=InstallRead)
(V30=MeterUnits)
(V31=LoggerNum)
(V32=InstalledBy)
(V33=Install_Comment)
(V34=PickupDate)
(V35=PickupTime)
(V36=PickupRead)
(V37=PickupBy)
(V38=Pickup_Comment)
(V39=LoggedVolume)
(V40=TW_Volume)
(V41=RegisterVol)
(V42=CF)
(V43=MeterMasterStatus)
(V44=Analyst)
(V45=Analyst_Comments)
(V46=Checker)
(V47=Checker_Comments)
(V48=Trace_Start_Time)
(V49=Trace_End_Time)
(V50=Trace_Duration)
(V51=Final_Trace_Status)
.

SORT CASES BY SurveyID(A).
dataset name logging.

cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Responses".

get file='Denver\Denver preliminary recoded.sav'.
*
* Because we're using preliminary data, nonunique surveys need to be dropped out:
*.
SORT CASES BY SurveyID(A).
MATCH FILES
  /FILE=*
  /BY SurveyID
  /LAST=PrimaryLast.
select if PrimaryLast.
EXECUTE.
dataset name survey.

DATASET ACTIVATE logging.
MATCH FILES /FILE=*
  /FILE='survey'
  /IN has_survey2
  /BY SurveyID.
select if (keycode ~= "").
execute.

cd "Z:\Projects\+REUWS_2".
cd "Task6_Logging_Samples".

SAVE TRANSLATE OUTFILE='Denver\Denver preliminary recoded.xlsx'
  /TYPE=XLS
  /VERSION=12
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=LABELS
  /DROP=wave PrimaryLast has_survey2.
