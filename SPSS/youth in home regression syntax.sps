compute children=survey_number_of_children+survey_number_of_infants.
compute youth=(children+survey_number_of_teenagers)>0.
execute.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT LogAnnualKgal
  /METHOD=ENTER capita
  /RESIDUALS HISTOGRAM(ZRESID) ID(SurveyID)
  /save resid(StandardizedAnnualByPeople)
.
