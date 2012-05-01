cd "Z:\Projects\+REUWS_2".
cd "Task8_Log_Data&Analysis".
insert file="Denver/load_logging_sheet.sps".
sort cases by Keycode.
dataset name Logging.

insert file="Denver/load_traces.sps".
sort cases by Keycode.

DATASET ACTIVATE Logging.
MATCH FILES /FILE=*
  /FILE='Main'
  /RENAME (has_trace = d0) 
  /BY keycode
  /DROP= d0.
EXECUTE.

cd "Z:\Projects\+REUWS_2".
cd "Task8_Log_Data&Analysis".
SAVE OUTFILE='Denver/Denver_Task8.sav'
  /COMPRESSED.
