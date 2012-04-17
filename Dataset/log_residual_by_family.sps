insert file="log_normalize_by_state.sps".

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT NormalizedAnnual
  /METHOD=ENTER survey_number_of_adults survey_number_of_children survey_number_of_teenagers
  /RESIDUALS HISTOGRAM(RESID)
  /SAVE PRED(NormalizedAnnualPredictedByFamily) RESID(NormalizedAnnualResidualByFamily).

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT NormalizedNonseasonal
  /METHOD=ENTER survey_number_of_adults survey_number_of_children survey_number_of_teenagers
  /RESIDUALS HISTOGRAM(RESID)
  /SAVE PRED(NormalizedNonseasonalPredictedByFamily) RESID(NormalizedNonseasonalResidualByFamily).

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT NormalizedSeasonal
  /METHOD=ENTER survey_number_of_adults survey_number_of_children survey_number_of_teenagers
  /RESIDUALS HISTOGRAM(RESID)
  /SAVE PRED(NormalizedSeasonalPredictedByFamily) RESID(NormalizedSeasonalResidualByFamily).

variable labels
NormalizedAnnualPredictedByFamily "Standardized Annual predicted by family"
NormalizedNonseasonalPredictedByFamily "Standardized Nonseasonal predicted by family"
NormalizedSeasonalPredictedByFamily "Standardized Seasonal predicted by family"
NormalizedAnnualResidualByFamily "Standardized Annual residual by family"
NormalizedNonseasonalResidualByFamily "Standardized Nonseasonal residual by family"
NormalizedSeasonalResidualByFamily "Standardized Seasonal residual by family"
.

* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=VISIBLE  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='regression_residual_graphs.pdf'
     EMBEDBOOKMARKS=YES  EMBEDFONTS=YES.
