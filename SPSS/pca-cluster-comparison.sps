compute has_survey=(survey_year>0).
execute.

FACTOR
  /VARIABLES survey_disposal to survey_greenhouse_indoor survey_other_features
  /MISSING PAIRWISE 
  /ANALYSIS survey_disposal to survey_greenhouse_indoor survey_other_features
  /SELECT=has_survey(1)
  /PRINT INITIAL EXTRACTION
  /FORMAT SORT
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL, fixtures_pca_)
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES survey_irrigation survey_landscape_turf to survey_landscape_nonirrigated survey_water_feature_outdoor survey_pool
  /MISSING PAIRWISE 
  /ANALYSIS survey_irrigation survey_landscape_turf to survey_landscape_nonirrigated survey_water_feature_outdoor survey_pool
  /SELECT=has_survey(1)
  /PRINT INITIAL EXTRACTION
  /FORMAT SORT
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL, landscaping_pca_)
  /METHOD=CORRELATION.

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

variable labels fixtures_pca_1 "" landscaping_pca_1 "" attitude_pca_1 "" indoor_measures_pca_1 "" outdoor_measures_pca_1 "".

QUICK CLUSTER survey_disposal survey_greenhouse_indoor survey_other_features
survey_irrigation survey_landscape_turf to survey_landscape_nonirrigated survey_water_feature_outdoor survey_pool 
reuws2_attitude_A to reuws2_attitude_S survey_drought 
survey_program_participation_3 to survey_rain_barrel_last_few
  /MISSING=PAIRWISE
  /CRITERIA=CLUSTER(6) MXITER(10) CONVERGE(0)
  /METHOD=KMEANS(NOUPDATE)
  /SAVE CLUSTER (big_cluster) DISTANCE (big_cluster_distance)
  /PRINT ID(SurveyID) INITIAL.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=big_cluster utility DISPLAY=DEFAULT
  /TABLE big_cluster [C] BY utility [C][COLPCT.COUNT]
  /CATEGORIES VARIABLES=big_cluster ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=utility [51.00, 52.00, 53.00, 54.00, 55.00, 57.00] EMPTY=EXCLUDE TOTAL=YES 
    POSITION=AFTER
  /TITLES
    CORNER='60 attitude and behaviour ordinal attributes'.

QUICK CLUSTER fixtures_pca_1 to outdoor_measures_pca_3
  /MISSING=PAIRWISE
  /CRITERIA=CLUSTER(6) MXITER(10) CONVERGE(0)
  /METHOD=KMEANS(NOUPDATE)
  /SAVE CLUSTER (pca_all_cluster) DISTANCE (pca_all_cluster_distance)
  /PRINT ID(SurveyID) INITIAL.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=pca_all_cluster utility DISPLAY=DEFAULT
  /TABLE pca_all_cluster [C] BY utility [C][COLPCT.COUNT]
  /CATEGORIES VARIABLES=pca_all_cluster ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=utility [51.00, 52.00, 53.00, 54.00, 55.00, 57.00] EMPTY=EXCLUDE TOTAL=YES 
    POSITION=AFTER
  /TITLES
    CORNER='All 17 PCA factors'.

QUICK CLUSTER fixtures_pca_1 landscaping_pca_1 attitude_pca_1 indoor_measures_pca_1 outdoor_measures_pca_1
  /MISSING=PAIRWISE
  /CRITERIA=CLUSTER(6) MXITER(10) CONVERGE(0)
  /METHOD=KMEANS(NOUPDATE)
  /SAVE CLUSTER (pca_1_cluster) DISTANCE (pca_1_cluster_distance)
  /PRINT ID(SurveyID) INITIAL.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=pca_1_cluster utility DISPLAY=DEFAULT
  /TABLE pca_1_cluster [C] BY utility [C][COLPCT.COUNT]
  /CATEGORIES VARIABLES=pca_1_cluster ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=utility [51.00, 52.00, 53.00, 54.00, 55.00, 57.00] EMPTY=EXCLUDE TOTAL=YES 
    POSITION=AFTER
  /TITLES
    CORNER='5 PCA first factors'.

* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=VISIBLE  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='S:\local\home\matt\Dropbox\Data_Mining_project\05-02-12 final report and '+
    'presentation\ImagesPlotsAndGraphs\pca clustering.pdf'
     EMBEDBOOKMARKS=YES  EMBEDFONTS=YES.
output new.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=big_cluster pca_all_cluster pca_1_cluster utility DISPLAY=DEFAULT
  /TABLE big_cluster [C][COLPCT.COUNT PCT40.1] + pca_all_cluster [C][COLPCT.COUNT PCT40.1] + 
    pca_1_cluster [C][COLPCT.COUNT PCT40.1] BY utility [C]
  /CATEGORIES VARIABLES=big_cluster pca_all_cluster pca_1_cluster ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=utility ORDER=A KEY=VALUE EMPTY=INCLUDE.

