
MEANS TABLES=NonseasonalKgal BY capita
  /CELLS MEAN COUNT STDDEV.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=capita MEANSD(NonseasonalKgal, 
    1)[name="MEAN_NonseasonalKgal" LOW="MEAN_NonseasonalKgal_LOW" HIGH="MEAN_NonseasonalKgal_HIGH"] 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: capita=col(source(s), name("capita"))
  DATA: MEAN_NonseasonalKgal=col(source(s), name("MEAN_NonseasonalKgal"))
  DATA: LOW=col(source(s), name("MEAN_NonseasonalKgal_LOW"))
  DATA: HIGH=col(source(s), name("MEAN_NonseasonalKgal_HIGH"))
  GUIDE: axis(dim(1), label("Number of Residents"))
  GUIDE: axis(dim(2), label("Indoor Kgal"))
  GUIDE: text.footnote(label("Error Bars: Standard Deviation"))
  GUIDE: text.subfootnote(label("Error Bars: +/- 1 SD"))
  SCALE: linear(dim(1), min(0))
  SCALE: linear(dim(2), min(0))
  ELEMENT: point(position(capita*MEAN_NonseasonalKgal))
  ELEMENT: interval(position(region.spread.range(capita*(LOW+HIGH))), shape.interior(shape.ibeam))
END GPL.

* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=VISIBLE  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='S:\local\home\matt\Dropbox\Data_Mining_project\05-02-12 final report and '+
    'presentation\ImagesPlotsAndGraphs\indoor per capita.pdf'
     EMBEDBOOKMARKS=YES  EMBEDFONTS=YES.
