cd "S:\local\home\matt".
cd "Data_Mining_project\Dataset".
cd "REUWS2-update\correlations".

get file="SPSS_correlation_output.sav".
dataset name SPSS_correlation_output.

* For by-level only: *.
* value labels TableNumber_ 1 "Scale" 2 "Ordinal" 3 "Nominal".

compute r_row=any(Var2, "Pearson Correlation").
compute sig_row=any(Var2, "Sig. (2-tailed)").
compute n_row=any(Var2, "N").
execute.

echo "Creating coefficient matrix copy".
DATASET COPY  r.
DATASET ACTIVATE  r.
FILTER OFF.
USE ALL.
SELECT IF r_row.
EXECUTE.
SAVE TRANSLATE OUTFILE='coeffs-tabular.tab'
  /TYPE=TAB
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES
  /DROP=TableNumber_ to Label_ Var2 r_row to n_row.

echo "Creating significance matrix copy".
DATASET ACTIVATE SPSS_correlation_output.
DATASET COPY  sig.
DATASET ACTIVATE  sig.
FILTER OFF.
USE ALL.
SELECT IF sig_row.
EXECUTE.
SAVE TRANSLATE OUTFILE='significance-tabular.tab'
  /TYPE=TAB
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES
  /DROP=TableNumber_ to Label_ Var2 r_row to n_row.

echo "Creating count matrix copy".
DATASET ACTIVATE SPSS_correlation_output.
DATASET COPY  n.
DATASET ACTIVATE  n.
FILTER OFF.
USE ALL.
SELECT IF n_row.
EXECUTE.
SAVE TRANSLATE OUTFILE='count-tabular.tab'
  /TYPE=TAB
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES
  /DROP=TableNumber_ to Label_ Var2 r_row to n_row.


* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=ALL  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /TEXT  DOCUMENTFILE='make_tabular_files.log'
     ENCODING=LOCALE  NOTESCAPTIONS=YES  SEPARATOR=SPACE
     COLUMNWIDTH=AUTOFIT  ROWBORDER='-'  COLUMNBORDER='|'
     IMAGEFORMAT=PNG
  /PNG  PERCENTSIZE=100  DEPTH=TRUE32BIT.
