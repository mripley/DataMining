if (capita>0) Log_capita=Lg10(capita).
if (survey_indoor_sqft>0) Log_survey_indoor_sqft=Lg10(survey_indoor_sqft).
if (survey_household_income>0) Log_survey_household_income=Lg10(survey_household_income).
compute Log_persons_per_sqft_indoor=Log_capita - Log_survey_indoor_sqft.
execute.


DESCRIPTIVES VARIABLES=capita Log_capita survey_indoor_sqft Log_survey_indoor_sqft Log_persons_per_sqft_indoor
  /STATISTICS=MEAN STDDEV MIN MAX.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Log_persons_per_sqft_indoor MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Log_persons_per_sqft_indoor=col(source(s), name("Log_persons_per_sqft_indoor"))
  GUIDE: axis(dim(1), label("Persons per Indoor Sqft (Log Scale)"))
  GUIDE: axis(dim(2), label("Frequency Percent"))
  ELEMENT: area(position(summary.percent.count(bin.rect(Log_persons_per_sqft_indoor), 
    base.all(acrossPanels()))), missing.wings())
  ELEMENT: line(position(density.normal(Log_persons_per_sqft_indoor)), color("Normal"))
END GPL.

DESCRIPTIVES VARIABLES=Log_persons_per_sqft_indoor
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX.

compute low_density_outlier=(ZLog_persons_per_sqft_indoor < -1.5).
compute high_density_outlier=(ZLog_persons_per_sqft_indoor > 1.5).

compute Log_survey_parcel_sqft=Lg10(survey_parcel_sqft).
if (SeasonalKgal>0) Log_SeasonalKgal=Lg10(SeasonalKgal).
compute Log_Irrigation_per_sqft=(Log_survey_parcel_sqft - Log_SeasonalKgal).

if (NonseasonalKgal>0)  Log_NonseasonalKgal=Lg10(NonseasonalKgal).

execute.

DESCRIPTIVES VARIABLES=Log_NonseasonalKgal
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX.


* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Log_NonseasonalKgal MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Log_NonseasonalKgal=col(source(s), name("Log_NonseasonalKgal"))
  GUIDE: axis(dim(1), label("Log_NonseasonalKgal"))
  GUIDE: axis(dim(2), label("Frequency"))
  ELEMENT: area(position(summary.count(bin.rect(Log_NonseasonalKgal))), missing.wings())
  ELEMENT: line(position(density.normal(Log_NonseasonalKgal)), color("Normal"))
END GPL.

