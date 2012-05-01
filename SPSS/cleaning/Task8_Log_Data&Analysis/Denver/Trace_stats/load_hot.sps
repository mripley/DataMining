cd 'Z:\Projects\+REUWS_2'.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=MS Access Database;DBQ=Z:\projects\+'+
    'REUWS_2\Task8_Log_Data&Analysis\Denver\Trace_stats\Denver_stats.mdb;DriverId=25;FIL=MS '+
    'Access;MaxBufferSize=2048;PageTimeout=5;'
  /SQL='SELECT * FROM qrySummaryHot'
  /ASSUMEDSTRWIDTH=255.
CACHE.
variable attribute
variables=all
attribute=table('Denver_stats.mdb [qrySummaryHot]').
.
compute Imported=$TIME.
alter type Imported (DATE).

alter type keycode6 (A6).
rename variables keycode6=keycode.

variable level TotalVolume to Numberofflushesgreaterthan2_2Gal (scale).

insert file="Task7_Hot_Water_Samples/common_hot_encoding.sps".
execute.
sort cases by keycode.
