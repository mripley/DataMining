
*
* Somehow, this fails:
*.
* GET DATA /TYPE=XLSX
  /FILE='Task9_Database\Weather\Soil_Moisture_Balance.xlsx'
  /SHEET=name 'DataTable'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.

get file="Task9_Database\Weather\Weather.sav".

variable attribute
variables=all
attribute=table('Soil_Moisture_Balance.xlsx [DataTable]').
.
EXECUTE.
sort cases by utility.