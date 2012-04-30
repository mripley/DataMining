delete variables
reuws_attitude_pca_cluster
reuws_attitude_pca_radius
.

QUICK CLUSTER reuws_attitude_pca_1 to reuws_attitude_pca_5
  /MISSING=LISTWISE
  /CRITERIA=CLUSTER(5) MXITER(10) CONVERGE(0)
  /METHOD=KMEANS(NOUPDATE)
  /SAVE CLUSTER (reuws_attitude_pca_cluster) DISTANCE (reuws_attitude_pca_radius)
  /PRINT ID(SurveyID) INITIAL.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=reuws_attitude_pca_cluster utility DISPLAY=DEFAULT
  /TABLE reuws_attitude_pca_cluster [C][COLPCT.COUNT] BY utility [C]
  /CATEGORIES VARIABLES=reuws_attitude_pca_cluster ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=utility ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /SIGTEST TYPE=CHISQUARE ALPHA=0.05 INCLUDEMRSETS=YES CATEGORIES=ALLVISIBLE.
