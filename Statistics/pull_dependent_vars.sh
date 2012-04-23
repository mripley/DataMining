#!/bin/sh

header="var1,var2,Pearson coefficient (r),r-squared,Significance,p-value,Support (n)"

for var in \
{Annual,Nonseasonal,Seasonal}Kgal \
Normalized{Annual,Nonseasonal,Seasonal} \
Standardized{Annual,Nonseasonal,Seasonal}residualbyfamily
do
	output_filename=REUWS1-1996-${var}-correlations.csv
	{
		echo $header
		grep --no-filename -i "$var" ../Dataset/REUWS1-1996/correlations/{,un}standardized.csv
	} > $output_filename
done

for var in \
{Annual,Nonseasonal,Seasonal}Kgal \
Normalized{Annual,Nonseasonal,Seasonal} \
Standardized{Annual,Nonseasonal,Seasonal}residualbyfamily
do
	output_filename=REUWS2-update-2011-${var}-correlations.csv
	{
		echo $header
		grep --no-filename -i "$var" ../Dataset/REUWS1-1996/correlations/{,un}standardized.csv
	} > $output_filename
done