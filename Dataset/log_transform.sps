if (AnnualKgal > 0) LogAnnualKgal=Lg10(AnnualKgal).
if (NonseasonalKgal > 0) LogNonseasonalKgal=Lg10(NonseasonalKgal).
if (SeasonalKgal > 0) LogSeasonalKgal=Lg10(SeasonalKgal).
execute.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=AnnualKgal LogAnnualKgal NonseasonalKgal LogNonseasonalKgal SeasonalKgal 
    LogSeasonalKgal DISPLAY=DEFAULT
  /TABLE AnnualKgal [S][MEAN, COUNT F40.0, STDDEV, MINIMUM, PTILE 25, MEDIAN, PTILE 75, MAXIMUM] + 
    LogAnnualKgal [S][MEAN, COUNT F40.0, STDDEV, MINIMUM, PTILE 25, MEDIAN, PTILE 75, MAXIMUM] + 
    NonseasonalKgal [S][MEAN, COUNT F40.0, STDDEV, MINIMUM, PTILE 25, MEDIAN, PTILE 75, MAXIMUM] + 
    LogNonseasonalKgal [S][MEAN, COUNT F40.0, STDDEV, MINIMUM, PTILE 25, MEDIAN, PTILE 75, MAXIMUM] + 
    SeasonalKgal [S][MEAN, COUNT F40.0, STDDEV, MINIMUM, PTILE 25, MEDIAN, PTILE 75, MAXIMUM] + 
    LogSeasonalKgal [S][MEAN, COUNT F40.0, STDDEV, MINIMUM, PTILE 25, MEDIAN, PTILE 75, MAXIMUM].
