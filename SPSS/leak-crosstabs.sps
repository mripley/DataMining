output new.

MEANS TABLES=Leakgpd BY survey_leak_toilet survey_faucet_drips survey_leak_pool 
    survey_leak_irrigation survey_leak_other survey_faucet_drips_repaired 
    survey_leak_irrigation_repaired
  /CELLS MEAN COUNT STDDEV
  /STATISTICS ANOVA.

compute major_leak=(LeakGPD>24).
execute.

CROSSTABS
  /TABLES=survey_leak_toilet BY major_leak
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=survey_faucet_drips BY major_leak
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=survey_leak_pool BY major_leak
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=survey_leak_irrigation BY major_leak
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=survey_leak_other BY major_leak
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=survey_faucet_drips_repaired BY major_leak
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=survey_leak_irrigation_repaired BY major_leak
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=ALL  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='S:\local\home\matt\Dropbox\Data_Mining_project\05-02-12 final report and '+
    'presentation\ImagesPlotsAndGraphs\leak crosstabs.pdf'
     EMBEDBOOKMARKS=YES  EMBEDFONTS=YES.

