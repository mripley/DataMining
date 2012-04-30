
output new.
MEANS TABLES=Leakgpd IndoorGPD BY survey_faucet_drips_repaired survey_has_been_audited
  /CELLS MEAN COUNT STDDEV
  /STATISTICS ANOVA.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=survey_renter survey_faucet_drips_repaired DISPLAY=DEFAULT
  /TABLE survey_renter [COUNT F40.0] BY survey_faucet_drips_repaired
  /CATEGORIES VARIABLES=survey_renter survey_faucet_drips_repaired ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /SIGTEST TYPE=CHISQUARE ALPHA=0.05 INCLUDEMRSETS=YES CATEGORIES=ALLVISIBLE.
