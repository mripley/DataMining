cd 'Z:\Projects\+REUWS_2'.

MATCH FILES /FILE='Task5_Customer_Surveys\Survey Analysis\Denver\Denver_Task5.sav'
  /TABLE='Task6_Logging_Samples\Denver\Denver_Task6.sav'
  /BY SurveyID.
EXECUTE.

sort cases by Keycode SurveyID.

MATCH FILES /FILE=*
  /TABLE='Task8_Log_Data&Analysis\Denver\Denver_Task8.sav'
  /RENAME (Imported PrimaryFirst SurveyID = d0 d1 d2) 
  /BY Keycode
  /DROP= d0 d1 d2.
EXECUTE.
dataset name Tasks.

insert file="Task9_Database\Denver\load_parcels.sps".
DATASET NAME Parcels.

DATASET ACTIVATE Tasks.
sort cases by Keycode.
MATCH FILES /FILE=*
  /RENAME filename=Trace_filename
  /TABLE='Parcels'
  /RENAME filename=GIS_filename
  /in has_aerial
  /BY Keycode.
EXECUTE.

insert file="Task9_Database\Weather\load_weather.sps".
DATASET NAME Weather.

DATASET ACTIVATE Tasks.
sort cases by utility.
MATCH FILES /FILE=*
  /TABLE='Weather'
  /RENAME (SiteName = d0) 
  /BY Utility
  /DROP= d0.
EXECUTE.
