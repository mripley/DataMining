cd "Z:\projects\+REUWS_2".
cd "Task8_Log_Data&Analysis".

insert file="Denver/Trace_stats/load_main.sps".
compute has_trace=1.
dataset name Main.

insert file="Denver/Trace_stats/load_hot.sps".
dataset name Hot.

DATASET ACTIVATE Main.
MATCH FILES /FILE=*
  /FILE='Hot'
  /RENAME (Imported = d0) 
  /IN has_hot_trace
  /BY keycode
  /DROP= d0.
EXECUTE.