cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections\L1 - San Antonio".

GET DATA /TYPE=XLSX
  /FILE='Q1000.xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
compute Log_AnnualKgal=LG10(AnnualKgal).

* Visual Binning.
*Log_AnnualKgal.
RECODE  Log_AnnualKgal (MISSING=COPY) (LO THRU 1.41783047789998=1) (LO THRU 1.68076108472140=2) (LO 
    THRU 1.94369169154282=3) (LO THRU 2.20662229836424=4) (LO THRU 2.46955290518567=5) (LO THRU HI=6) 
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
  /KEEP= SurveyID PrclKey Log_AnnualKgal_Bin
.
