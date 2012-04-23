#! python 2.6

from collections import defaultdict
import csv
#from operator import itemgetter
from os.path import sep as officialsep
import sys

#input_table_filename="../Dataset/REUWS1-1996/correlations/standardized.csv"

mysep = "/"
for input_table_filename in sys.argv[1:]:
	try:
		output_table_filename = "-".join(input_table_filename.split(mysep)[-3:])+"-highest_rsquared_for_each_variable.csv"
	except:
		output_table_filename = input_table_filename.split(mysep)[-1]+"-highest_rsquared_for_each_variable.csv"
	with open(input_table_filename) as fi:
		header = fi.readline()
		print "Header:", header
		cr=csv.reader(fi)
		#table=sorted(cr, key=itemgetter(3), reverse=True)
		table=sorted(cr, key=lambda x: float(x[3]), reverse=True)
	#
	# make highest_rsquared_for_each_variable
	#
	highest_rsquared_for_each_variable = {}
	for row in table:
		var1, var2, Pr, Pr2, sig, p, N = row
		for v in [ var1, var2 ]:
			if v not in highest_rsquared_for_each_variable:
				if row not in highest_rsquared_for_each_variable.values():
					highest_rsquared_for_each_variable[v] = row
	print "Writing", len(highest_rsquared_for_each_variable), "variables into", output_table_filename
	with open(output_table_filename, "wb") as fo:
		fo.write(header)
		cw=csv.writer(fo)
		cw.writerows(highest_rsquared_for_each_variable.itervalues())
	#