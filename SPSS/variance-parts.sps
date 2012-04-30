output new.
* Custom Tables.
CTABLES
  /VLABELS VARIABLES=ServiceState Bathtubgpd Clotheswashergpd Dishwashergpd Faucetgpd Leakgpd 
    Othergpd Showergpd Toiletgpd IndoorGPD OutdoorGPD 
    DISPLAY=DEFAULT
  /TABLE ServiceState [C] BY Bathtubgpd [S][MEAN] + Clotheswashergpd [S][MEAN] + Dishwashergpd 
    [S][MEAN] + Faucetgpd [S][MEAN] + Leakgpd [S][MEAN] + Othergpd [S][MEAN] + Showergpd [S][MEAN] + 
    Toiletgpd [S][MEAN] + IndoorGPD [S][MEAN] + OutdoorGPD [S][MEAN]
  /CATEGORIES VARIABLES=ServiceState ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=ServiceState Bathtubgpd Clotheswashergpd Dishwashergpd Faucetgpd Leakgpd 
    Othergpd Showergpd Toiletgpd IndoorGPD OutdoorGPD 
    DISPLAY=DEFAULT
  /TABLE ServiceState [C] BY Bathtubgpd [S][VARIANCE] + Clotheswashergpd [S][VARIANCE] + 
    Dishwashergpd [S][VARIANCE] + Faucetgpd [S][VARIANCE] + Leakgpd [S][VARIANCE] + Othergpd 
    [S][VARIANCE] + Showergpd [S][VARIANCE] + Toiletgpd [S][VARIANCE] + IndoorGPD [S][VARIANCE] + 
    OutdoorGPD [S][VARIANCE]
  /CATEGORIES VARIABLES=ServiceState ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=survey_irrigation_inground IndoorGPD OutdoorGPD TotalGPD DISPLAY=DEFAULT
  /TABLE survey_irrigation_inground [C] BY IndoorGPD [S][VARIANCE] + OutdoorGPD [S][VARIANCE] + 
    TotalGPD [S][VARIANCE]
  /CATEGORIES VARIABLES=survey_irrigation_inground ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=AFTER.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=survey_pool IndoorGPD OutdoorGPD TotalGPD DISPLAY=DEFAULT
  /TABLE survey_pool [C] BY IndoorGPD [S][VARIANCE] + OutdoorGPD [S][VARIANCE] + 
    TotalGPD [S][VARIANCE]
  /CATEGORIES VARIABLES=survey_pool ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=AFTER.
