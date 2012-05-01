if (AnnualKgal > 0) LogAnnualKgal=Lg10(AnnualKgal).
if (NonseasonalKgal > 0) LogNonseasonalKgal=Lg10(NonseasonalKgal).
if (SeasonalKgal > 0) LogSeasonalKgal=Lg10(SeasonalKgal).
execute.

RANK VARIABLES=LogAnnualKgal (A) BY Site
  /NORMAL into NormalizedAnnual /TIES=MEAN
  /FRACTION=RANKIT.
* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=NormalizedAnnual Site MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: NormalizedAnnual=col(source(s), name("NormalizedAnnual"))
  DATA: Site=col(source(s), name("Site"), unit.category())
  GUIDE: axis(dim(1), label("Normal Score of Annual Use by Site"))
  GUIDE: axis(dim(2), label("Frequency Percent"))
  GUIDE: axis(dim(4), label("Site"), opposite())
  ELEMENT: area(position(summary.percent.count(bin.rect(NormalizedAnnual*1*1*Site), 
    base.all(acrossPanels()))), missing.wings())
END GPL.

RANK VARIABLES=LogNonseasonalKgal (A) BY Site
  /NORMAL into NormalizedNonseasonal /TIES=MEAN
  /FRACTION=RANKIT.
* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=NormalizedNonseasonal Site MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: NormalizedNonseasonal=col(source(s), name("NormalizedNonseasonal"))
  DATA: Site=col(source(s), name("Site"), unit.category())
  GUIDE: axis(dim(1), label("Normal Score of Nonseasonal Use by Site"))
  GUIDE: axis(dim(2), label("Frequency Percent"))
  GUIDE: axis(dim(4), label("Site"), opposite())
  ELEMENT: area(position(summary.percent.count(bin.rect(NormalizedNonseasonal*1*1*Site), 
    base.all(acrossPanels()))), missing.wings())
END GPL.


RANK VARIABLES=LogSeasonalKgal (A) BY Site
  /NORMAL into NormalizedSeasonal /TIES=MEAN
  /FRACTION=RANKIT.
* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=NormalizedSeasonal Site MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: NormalizedSeasonal=col(source(s), name("NormalizedSeasonal"))
  DATA: Site=col(source(s), name("Site"), unit.category())
  GUIDE: axis(dim(1), label("Normal Score of Seasonal Use by Site"))
  GUIDE: axis(dim(2), label("Frequency Percent"))
  GUIDE: axis(dim(4), label("Site"), opposite())
  ELEMENT: area(position(summary.percent.count(bin.rect(NormalizedSeasonal*1*1*Site), 
    base.all(acrossPanels()))), missing.wings())
END GPL.
