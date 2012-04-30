compute has_survey=(survey_year>0).
execute.

FACTOR
  /VARIABLES reuws2_attitude_A to reuws2_attitude_S survey_drought
  /MISSING LISTWISE 
  /ANALYSIS reuws2_attitude_A to reuws2_attitude_S survey_drought
  /SELECT=has_survey(1)
  /PRINT INITIAL EXTRACTION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL, attitude_pca_)
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES survey_program_participation_3 to survey_audit_last_few
  /MISSING LISTWISE 
  /ANALYSIS survey_program_participation_3 to survey_audit_last_few
  /SELECT=has_survey(1)
  /PRINT INITIAL EXTRACTION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL, indoor_measures_pca_)
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES survey_audit_last_few to survey_rain_barrel_last_few
  /MISSING LISTWISE 
  /ANALYSIS survey_audit_last_few to survey_rain_barrel_last_few
  /SELECT=has_survey(1)
  /PRINT INITIAL EXTRACTION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL, outdoor_measures_pca_)
  /METHOD=CORRELATION.

QUICK CLUSTER reuws2_attitude_A to reuws2_attitude_S survey_drought survey_program_participation_3 to survey_rain_barrel_last_few
  /MISSING=PAIRWISE
  /CRITERIA=CLUSTER(6) MXITER(10) CONVERGE(0)
  /METHOD=KMEANS(NOUPDATE)
  /SAVE CLUSTER (big_cluster) DISTANCE (big_cluster_distance)
  /PRINT ID(SurveyID) INITIAL.

QUICK CLUSTER attitude_pca_1 outdoor_measures_pca_3
  /MISSING=PAIRWISE
  /CRITERIA=CLUSTER(6) MXITER(10) CONVERGE(0)
  /METHOD=KMEANS(NOUPDATE)
  /SAVE CLUSTER (pca_cluster) DISTANCE (pca_cluster_distance)
  /PRINT ID(SurveyID) INITIAL.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=big_cluster utility DISPLAY=DEFAULT
  /TABLE big_cluster [C] BY utility [C][COLPCT.COUNT]
  /CATEGORIES VARIABLES=big_cluster ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=utility [51.00, 52.00, 53.00, 54.00, 55.00, 57.00] EMPTY=EXCLUDE TOTAL=YES 
    POSITION=AFTER
  /TITLES
    CORNER='48 attitude and behaviour attributes'.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=pca_cluster utility DISPLAY=DEFAULT
  /TABLE pca_cluster [C] BY utility [C][COLPCT.COUNT]
  /CATEGORIES VARIABLES=pca_cluster ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=utility [51.00, 52.00, 53.00, 54.00, 55.00, 57.00] EMPTY=EXCLUDE TOTAL=YES 
    POSITION=AFTER
  /TITLES
    CORNER='13 PCA factors'.
