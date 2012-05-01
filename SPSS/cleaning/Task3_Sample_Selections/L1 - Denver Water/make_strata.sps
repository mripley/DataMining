cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections\L1 - Denver Water".

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
RECODE  Log_AnnualKgal (MISSING=COPY) (LO THRU 1.49235118573256=1) (LO THRU 1.74975309030624=2) (LO 
    THRU 2.00715499487991=3) (LO THRU 2.26455689945358=4) (LO THRU 2.52195880402726=5) (ELSE=SYSMIS) 
    INTO Log_AnnualKgal_Bin.
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
  /KEEP= SurveyID PremiseID Log_AnnualKgal_Bin
.

