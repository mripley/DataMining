GET DATA 
  /TYPE=ODBC 
  /CONNECT='DSN=MS Access Database;DBQ=Z:\Projects\+REUWS_2\Task6_Logging_Samples\GIS\Denver\Denver GIS Data\import.accdb;DriverId=25;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;' 
  /SQL='SELECT * FROM tblParcelTypeByKeycode' 
  /ASSUMEDSTRWIDTH=255. 
CACHE.
variable attribute
variables=all
attribute=table('Denver GIS Data\import.accdb [tblParcelTypeByKeycode]').
.
EXECUTE.
alter type all (A=AMIN).
rename variables
Keycode = filename
Keycode6 = Keycode
.
sort cases by Keycode.