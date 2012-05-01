*
* Creates surveyId_by_keycode.sav
* SPSS can't read the Master Logging sheet for Denver, so I had to resort to making an intermediate file
*.

cd "Z:\Projects\+REUWS_2".
cd "Task6_Logging_Samples".

GET DATA
  /TYPE=XLS
  /FILE='Z:\Docs_Tools\DataLogging\Master Keycode File\Master keycode file 022112.xls'
  /SHEET=name 'S-SingleFamily '
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
EXECUTE.
DATASET NAME DataSet4 WINDOW=FRONT.

select if Client="Water Research Foundation".
execute.

alter type keycode (A6).
sort cases by Keycode.

SAVE OUTFILE='surveyId_by_keycode.sav'
  /keep=Keycode Study SurveyID
  /COMPRESSED.
