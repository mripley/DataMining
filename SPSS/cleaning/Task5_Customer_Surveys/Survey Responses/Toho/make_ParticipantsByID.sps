cd "Z:\Projects\+REUWS_2".
cd "Task5_Customer_Surveys\Survey Responses".
cd "Toho".

get file="Toho.sav".

recode partic (1=0) (MISSING=1).

select if (partic).
execute.

SAVE TRANSLATE OUTFILE='ParticipantsByID.tab'
  /TYPE=TAB
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES
  /KEEP=id
.

