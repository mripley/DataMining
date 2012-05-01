cd "Z:\Projects\+REUWS_2".
cd "Task3_Sample_Selections\L1 - Scottsdale".

GET DATA /TYPE=XLSX
  /FILE='Scottsdale Q1000 (second sampling).xlsx'
  /SHEET=name 'tblQ1000'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
rename variables (Keycode=SurveyID).
echo "Scottsdale has some 0 or lower annual use.".
compute Log_AnnualKgal=LG10(AnnualKgal).

* Visual Binning.
*Log_AnnualKgal.
RECODE  Log_AnnualKgal (MISSING=COPY) (LO THRU 1.31394155802955=1) (LO THRU 1.70345324454853=2) (LO 
    THRU 2.09296493106750=3) (LO THRU 2.48247661758648=4) (LO THRU 2.87198830410545=5) (LO THRU HI=6) 
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
  /KEEP= SurveyID AccountID Log_AnnualKgal_Bin
.
