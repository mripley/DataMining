
FACTOR
  /VARIABLES reuws2_attitude_A to reuws2_attitude_S
  /MISSING PAIRWISE 
  /ANALYSIS reuws2_attitude_A to reuws2_attitude_S
  /PRINT INITIAL EXTRACTION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG (ALL, reuws_attitude_pca_)
  /METHOD=CORRELATION.

*
* Taking the top 5 values
* There's not enough overlap in Clayton answers to make this interesting.
*.
* FACTOR
  /VARIABLES reuws_attitude_pca_1 to reuws_attitude_pca_5 Clayton_attitude_A to Clayton_attitude_D
  /MISSING PAIRWISE 
  /ANALYSIS reuws_attitude_pca_1 to reuws_attitude_pca_5 Clayton_attitude_A to Clayton_attitude_D
  /PRINT INITIAL EXTRACTION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG (ALL, Clayton_attitude_pca_)
  /METHOD=CORRELATION.

*
* Taking the top 5 values
*.
FACTOR
  /VARIABLES reuws_attitude_pca_1 to reuws_attitude_pca_5 Toho_attitude_E to Toho_attitude_K
  /MISSING PAIRWISE 
  /ANALYSIS reuws_attitude_pca_1 to reuws_attitude_pca_5 Toho_attitude_E to Toho_attitude_K
  /PRINT INITIAL EXTRACTION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG (ALL, Toho_attitude_pca_)
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES survey_landscape_low_water survey_landscape_nonirrigated 
    survey_landscape_trees_and_shrubs survey_landscape_turf survey_garden_flower survey_garden_veggie survey_pool
  /MISSING LISTWISE 
  /ANALYSIS survey_landscape_low_water survey_landscape_nonirrigated 
    survey_landscape_trees_and_shrubs survey_landscape_turf survey_garden_flower survey_garden_veggie survey_pool
  /PRINT INITIAL EXTRACTION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG (ALL, landscape_pca_)
  /METHOD=CORRELATION.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=landscape_pca_1 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: landscape_pca_1=col(source(s), name("landscape_pca_1"))
  GUIDE: axis(dim(1), label("REGR factor score   1 for analysis 1"))
  GUIDE: axis(dim(2), label("Frequency Percent"))
  ELEMENT: interval(position(summary.percent.count(bin.rect(landscape_pca_1), 
    base.all(acrossPanels()))), shape.interior(shape.square))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=landscape_pca_2 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: landscape_pca_2=col(source(s), name("landscape_pca_2"))
  GUIDE: axis(dim(1), label("REGR factor score   2 for analysis 2"))
  GUIDE: axis(dim(2), label("Frequency Percent"))
  ELEMENT: interval(position(summary.percent.count(bin.rect(landscape_pca_2), 
    base.all(acrossPanels()))), shape.interior(shape.square))
END GPL.
