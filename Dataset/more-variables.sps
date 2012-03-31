compute BillingTotalGPD=AnnualKgal*1000/365.24.
compute BillingIndoorGPD=NonseasonalKgal*1000/365.24.
compute BillingOutdoorGPD=SeasonalKgal*1000/365.24.
compute LoggingTotalDifferenceGPD=TotalGPD-BillingTotalGPD.
compute LoggingIndoorDifferenceGPD=IndoorGPD-BillingIndoorGPD.
compute LoggingOutdoorDifferenceGPD=OutdoorGPD-BillingOutdoorGPD.
execute.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=TotalGPD BillingGPD MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: TotalGPD=col(source(s), name("TotalGPD"))
  DATA: BillingGPD=col(source(s), name("BillingGPD"))
  GUIDE: axis(dim(1), label("Total GPD"))
  GUIDE: axis(dim(2), label("BillingGPD"))
  ELEMENT: point(position(TotalGPD*BillingGPD))
END GPL.
