cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections\L1 - Toho".

GET DATA /TYPE=XLSX
  /FILE='Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
rename variables (Keycode=SurveyID).
SELECT IF ~missing(SurveyID).

alter type TrimmedCustomerNumber (F12.0).
alter type TrimmedAccountNumber (F12.0).
alter type SeasonalKgal (F4.0).

compute Log_AnnualKgal=LG10(AnnualKgal).

* Visual Binning.
*Log_AnnualKgal.
RECODE  Log_AnnualKgal (MISSING=COPY) (LO THRU 1.32713579962796=1) (LO THRU 1.59596285367134=2) (LO 
    THRU 1.86478990771472=3) (LO THRU 2.13361696175810=4) (LO THRU 2.40244401580148=5) (LO THRU HI=6) 
    (ELSE=SYSMIS) INTO Log_AnnualKgal_Bin.
VARIABLE LABELS  Log_AnnualKgal_Bin 'Log_AnnualKgal (Binned)'.
FORMATS  Log_AnnualKgal_Bin (F5.0).
VALUE LABELS  Log_AnnualKgal_Bin 1 '' 2 '' 3 '' 4 '' 5 '' 6 ''.
VARIABLE LEVEL  Log_AnnualKgal_Bin (ORDINAL).
EXECUTE.

MEANS TABLES=AnnualKgal BY Log_AnnualKgal_Bin
  /CELLS MEAN MIN MAX COUNT NPCT SPCT.

SAVE TRANSLATE OUTFILE='strata.tab'
  /TYPE=TAB
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES
  /KEEP= SurveyID TrimmedAccountNumber Log_AnnualKgal_Bin
.



