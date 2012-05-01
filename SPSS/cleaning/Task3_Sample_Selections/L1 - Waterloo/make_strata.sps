cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections\L1 - Waterloo".

GET DATA /TYPE=XLSX
  /FILE='Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
alter type AccountNo2010 (F12.0).
alter type PropertyCode (F3.0).
alter type SeasonalKgal (F4.0).
compute Log_AnnualKgal=LG10(AnnualKgal).

AUTORECODE VARIABLES=LUGroup 
  /INTO LUGroup_code
  /BLANK=MISSING
  /PRINT.

execute.

* Cambridge is highly variable *.
RECODE  Log_AnnualKgal (MISSING=COPY) (LO THRU 1.34718129095656=1) (LO THRU 1.49389562339742=2) (LO 
    THRU 1.64060995583829=3) (LO THRU 1.78732428827915=4) (LO THRU 1.93403862072002=5) (LO THRU HI=6) 
    (ELSE=SYSMIS) INTO Log_AnnualKgal_Bin_Cambridge.

* Waterloo is more log-normal *.
RECODE  Log_AnnualKgal (MISSING=COPY) (LO THRU 1.44302583934598=1) (LO THRU 1.61230214087582=2) (LO 
    THRU 1.78157844240567=3) (LO THRU 1.95085474393551=4) (LO THRU 2.12013104546535=5) (LO THRU HI=6) 
    (ELSE=SYSMIS) INTO Log_AnnualKgal_Bin_Waterloo.

missing values Log_AnnualKgal_Bin_Cambridge Log_AnnualKgal_Bin_Waterloo (-1).

if any(Municipality, "Cambridge") Log_AnnualKgal_Bin_Waterloo=-1.
if any(Municipality, "Waterloo") Log_AnnualKgal_Bin_Cambridge=-1.
execute.

MEANS TABLES=AnnualKgal BY Log_AnnualKgal_Bin_Cambridge Log_AnnualKgal_Bin_Waterloo
  /CELLS MEAN MIN MAX COUNT NPCT SPCT.

SAVE TRANSLATE OUTFILE='strata.tab'
  /TYPE=TAB
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES
  /KEEP= SurveyID AccountNo Municipality Log_AnnualKgal_Bin_Cambridge Log_AnnualKgal_Bin_Waterloo
.
