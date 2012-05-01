cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections".
GET DATA /TYPE=XLSX
  /FILE='L1 - Waterloo\Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
variable attribute
variables=all
attribute=table('L1 - Waterloo\Q1000.xlsx [tblQ1000]')
.

alter type AccountNo2010 (F7).

rename variables
Address=ServiceAddress
Municipality=ServiceCity
.

alter type CustomerName (A255) ServiceAddress (A255) ServiceCity (A255).

compute Log_AnnualKgal_Bin=mean( Log_AnnualKgal_Bin_Cambridge, Log_AnnualKgal_Bin_Waterloo).
execute.
