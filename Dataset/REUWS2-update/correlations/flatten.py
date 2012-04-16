import csv

min_support = 60

r_matrix_fn="coeffs-tabular.tab"
n_matrix_fn="count-tabular.tab"
p_matrix_fn="significance-tabular.tab"

with open(r_matrix_fn) as fi:
	cr=csv.reader(fi, delimiter='\t')
	r_matrix=[ r for r in cr ]

with open(n_matrix_fn) as fi:
	cr=csv.reader(fi, delimiter='\t')
	n_matrix=[ r for r in cr ]

with open(p_matrix_fn) as fi:
	cr=csv.reader(fi, delimiter='\t')
	p_matrix=[ r for r in cr ]
#
# Checking headers
#
header = r_matrix[0]
if (header != n_matrix[0]):
	print "%s and %s don't match" %(r_matrix_fn, n_matrix_fn)
if (header != p_matrix[0]):
	print "%s and %s don't match" %(r_matrix_fn, p_matrix_fn)

varn = len(header)
#varn = 9

with open("coeffs.csv", 'wb') as fo:
	co=csv.writer(fo)
	co.writerow(["var1", "var2", "Pearson coefficient (r)", "r-squared", "Significance", "p-value", "Support (n)"])
	for i in xrange(1, varn):
		var1 = header[i]
		for j in xrange(i+1, varn):
			var2 = header[j]
			n = int(n_matrix[i][j])
			if (n>=min_support):
				try:
					r = float(r_matrix[i][j])
				except:
					r = 0
				try:
					p = float(p_matrix[i][j])
				except:
					p = 1
				co.writerow([var1, var2, "%1.3f" % r, "%1.3f" % (r*r), "Yes" if (p<0.05) else "No", "%0.3f" % p, n])