*
* Using the Mersenne Twister RNG
*.
set rng=mt.
set seed=20120415.

compute RandomSequence=RV.UNIFORM(0,1).
execute.

SORT CASES BY RandomSequence(A).
compute RandomSequence=$CASENUM.
execute.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=RandomSequence MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: RandomSequence=col(source(s), name("RandomSequence"))
  GUIDE: axis(dim(1), label("RandomSequence"))
  GUIDE: axis(dim(2), label("Frequency Percent"))
  GUIDE: text.title(label("All Cases"))
  ELEMENT: area(position(summary.percent.count(bin.rect(RandomSequence), 
    base.all(acrossPanels()))), missing.wings())
END GPL.
