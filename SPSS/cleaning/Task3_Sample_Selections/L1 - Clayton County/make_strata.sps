cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections\L1 - Clayton County".

GET DATA /TYPE=XLSX
  /FILE='Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
alter type SeasonalKgal (F4.0).
compute Log_AnnualKgal=LG10(AnnualKgal).

* Visual Binning.
*Log_AnnualKgal.
RECODE  Log_AnnualKgal (MISSING=COPY) (LO THRU 1.20253347388171=1) (LO THRU 1.45080732903930=2) (LO 
    THRU 1.69908118419688=3) (LO THRU 1.94735503935446=4) (LO THRU 2.19562889451205=5) (LO THRU HI=6) 
    (ELSE=SYSMIS) INTO Log_AnnualKgal_Bin.
VARIABLE LABELS  Log_AnnualKgal_Bin 'Log_AnnualKgal (Binned)'.
FORMATS  Log_AnnualKgal_Bin (F5.0).
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
  /KEEP= SurveyID AccountId Log_AnnualKgal_Bin
.


