GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=MS Access Database;DBQ=Z:\projects\+'+
    'REUWS_2\Task8_Log_Data&Analysis\Denver\Trace_stats\Denver_stats.mdb;DriverId=25;FIL=MS '+
    'Access;MaxBufferSize=2048;PageTimeout=5;'
  /SQL='SELECT * FROM qrySummaryMain'
  /ASSUMEDSTRWIDTH=255.
CACHE.
variable attribute
variables=all
attribute=table('Denver_stats.mdb [qrySummaryMain]').
.
compute Imported=$TIME.
alter type Imported (DATE).

rename variables keycode=filename.
string keycode (A6).
compute keycode=upper(filename).

variable level TotalVolume to Numberofflushesgreaterthan2_2Gal (scale).

if (ToiletEvents>0) pct_flushes_gt_2_2 = Numberofflushesgreaterthan2_2Gal / ToiletEvents.
if (ToiletEvents>0) pct_flushes_lt_2_2 =  Numberofflusheslessthan2_2Gal / ToiletEvents.
execute.

sort cases by keycode.