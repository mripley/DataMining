cd "Z:\Projects\+REUWS_2".
cd "Task6_Logging_Samples".

GET
  FILE='Scottsdale\Scottsdale_logging_sample.sav'.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Selectedforlogging Alternateforlogging AnnualKgal DISPLAY=DEFAULT
  /TABLE Selectedforlogging [C] + Alternateforlogging [C] BY AnnualKgal [S][UCOUNT F40.0, MEAN, 
    STDDEV]
  /CATEGORIES VARIABLES=Selectedforlogging Alternateforlogging ORDER=A KEY=VALUE EMPTY=EXCLUDE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Log_AnnualKgal_Bin Selectedforlogging Alternateforlogging DISPLAY=DEFAULT
  /TABLE Log_AnnualKgal_Bin [C] BY Selectedforlogging [C][COLPCT.COUNT PCT40.1] + 
    Alternateforlogging [C][COLPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=Log_AnnualKgal_Bin ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=Selectedforlogging Alternateforlogging ORDER=A KEY=VALUE EMPTY=EXCLUDE.

select if SelectedForLogging.
execute.

begin program python.
import sys
sys.path.append("s:/local/home/matt/python")
from spssaux2 import FindEmptyVars

for v in FindEmptyVars(delete=True):
   print "Deleted empty variable:", v
end program.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=MeterMake MeterSize DISPLAY=DEFAULT
  /TABLE MeterMake [C] > MeterSize [C][COUNT F40.0, TABLEPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=MeterMake MeterSize ORDER=A KEY=VALUE EMPTY=EXCLUDE.

SAVE TRANSLATE OUTFILE='Scottsdale\Scottsdale_logging_selection.xlsx'
  /TYPE=XLS
  /VERSION=12
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=LABELS
  /DROP=Selectedforlogging Alternateforlogging.

* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=ALL  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='Scottsdale\make_logging_selection.pdf'
     EMBEDBOOKMARKS=YES  EMBEDFONTS=YES.
