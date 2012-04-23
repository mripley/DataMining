
cd 'S:\local\home\matt'.
cd 'csci7000\Project\Dataset'.

GET
  FILE='REUWS2-update-2011\sample3938-normalized-residuals.sav'.

*
* Infants not in youth! 345???
*.
compute number_of_youth=sum(survey_number_of_teenagers, survey_number_of_children).
compute has_youth=(number_of_youth>0).
compute has_infants=(survey_number_of_infants>0).
compute pct_homies=(survey_homies/survey_number_of_adults).
compute has_homies=(pct_homies>0).
execute.

echo "Use normalized by state".
MEANS TABLES=NormalizedAnnual NormalizedNonseasonal NormalizedSeasonal BY has_youth has_infants has_homies
  /CELLS MEAN COUNT STDDEV
  /STATISTICS ANOVA.

echo "Use normalized by number of people".
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT NormalizedNonseasonal
  /METHOD=ENTER capita
  /RESIDUALS ID(SurveyID)
  /save resid(NormalizedNonseasonalResidualByCapita)
.

MEANS TABLES=NormalizedNonseasonalResidualByCapita BY has_youth has_infants has_homies
  /CELLS MEAN COUNT STDDEV
  /STATISTICS ANOVA.


cd 'S:\local\home\matt'.
cd 'Dropbox\Data_Mining_project'.
cd '05-02-12 final report and presentation\ImagesPlotsAndGraphs'.

* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=VISIBLE  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='youth regression 4-22.pdf'
     EMBEDBOOKMARKS=YES  EMBEDFONTS=YES.
