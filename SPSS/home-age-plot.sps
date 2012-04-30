output new.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=survey_year_built MEANCI(NonseasonalKgal, 
    95)[name="MEAN_NonseasonalKgal" LOW="MEAN_NonseasonalKgal_LOW" HIGH="MEAN_NonseasonalKgal_HIGH"] 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: survey_year_built=col(source(s), name("survey_year_built"))
  DATA: MEAN_NonseasonalKgal=col(source(s), name("MEAN_NonseasonalKgal"))
  DATA: LOW=col(source(s), name("MEAN_NonseasonalKgal_LOW"))
  DATA: HIGH=col(source(s), name("MEAN_NonseasonalKgal_HIGH"))
  GUIDE: axis(dim(1), label("Year built"))
  GUIDE: axis(dim(2), label("Average 1995 Indoor"))
  GUIDE: text.footnote(label("Error Bars: 95% CI"))
  ELEMENT: point(position(survey_year_built*MEAN_NonseasonalKgal))
  ELEMENT: interval(position(region.spread.range(survey_year_built*(LOW+HIGH))), 
    shape.interior(shape.ibeam))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=survey_year_built MEANCI(NormalizedNonseasonal, 
    95)[name="MEAN_NormalizedNonseasonal" LOW="MEAN_NormalizedNonseasonal_LOW" 
    HIGH="MEAN_NormalizedNonseasonal_HIGH"] MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: survey_year_built=col(source(s), name("survey_year_built"))
  DATA: MEAN_NormalizedNonseasonal=col(source(s), name("MEAN_NormalizedNonseasonal"))
  DATA: LOW=col(source(s), name("MEAN_NormalizedNonseasonal_LOW"))
  DATA: HIGH=col(source(s), name("MEAN_NormalizedNonseasonal_HIGH"))
  GUIDE: axis(dim(1), label("Year built"))
  GUIDE: axis(dim(2), label("Average 1995 Indoor Normalized by City"))
  GUIDE: text.footnote(label("Error Bars: 95% CI"))
  ELEMENT: point(position(survey_year_built*MEAN_NormalizedNonseasonal))
  ELEMENT: interval(position(region.spread.range(survey_year_built*(LOW+HIGH))), 
    shape.interior(shape.ibeam))
END GPL.

* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=VISIBLE  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='S:\local\home\matt\Dropbox\Data_Mining_project\05-02-12 final report and '+
    'presentation\ImagesPlotsAndGraphs\home age.pdf'
     EMBEDBOOKMARKS=YES  EMBEDFONTS=YES.

