cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections".
GET DATA /TYPE=XLSX
  /FILE='L1 - Peel\Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
variable attribute
variables=all
attribute=table('L1 - Peel\Q1000.xlsx [tblQ1000]')
.

rename variables
City=ServiceCity
Province=ServiceState
METER_MAKE=MeterMake
METER_DESCR=MeterModel
Reads=SampleReads
.

alter type ServiceCity (A255) ServiceState (A2).
alter type MeterMake (A255) MeterModel (A255).

alter type ACCOUNT_NUMBER (F8) METER_SERIAL_NUMBER (F8).

delete variables
tableendshere
.
