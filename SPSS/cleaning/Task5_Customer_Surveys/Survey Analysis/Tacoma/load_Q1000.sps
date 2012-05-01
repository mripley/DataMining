cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections".
GET DATA /TYPE=XLSX
  /FILE='L1 - Tacoma\Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
variable attribute
variables=all
attribute=table('L1 - Tacoma\Q1000.xlsx [tblQ1000]')
.

alter type Log_AnnualKgal_Bin (F1).

rename variables
City=ServiceCity
PostalCode=ServiceZip
State=ServiceState
Manufacturer=MeterMake
ModelNumber=MeterModel
Location=MeterLocation
.

alter type ServiceCity (A255) ServiceZip (A5) ServiceState (A2).
alter type MeterMake (A255) MeterModel (A255) MeterSize (A255) MeterLocation (A255).

missing values MODate (265621593600).

