cd "Z:\projects\+REUWS_2".
cd "Task9_Database\Denver".

insert file="load.sps".
compute TraceProjectedKgal=IndoorGPD*365.24/1000.
select if has_aerial.
execute.

cd "Z:\projects\+REUWS_2".
cd "Task9_Database\Denver".
SAVE TRANSLATE OUTFILE='Outdoor\Denver_outdoor.xlsx'
  /TYPE=XLS
  /VERSION=12
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES
  /keep=Keycode AnnualKgal NonseasonalKgal SeasonalKgal TraceProjectedKgal
House_Outlines to Xeriscape_Gravel BillingYearGrossET to BillingYearNetET
.
