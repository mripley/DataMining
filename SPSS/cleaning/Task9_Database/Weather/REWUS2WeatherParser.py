import csv
import re
import sys

class REWUS2WeatherParser():
	keyField = 0 # counted starting from 0
	nullOutputValue = ""
	skipLines = 0
	delimiter="\t"
	#
	def __init__(self, filename=None):
		self.fieldnames, self.valueres, self.transforms = {}, {}, {}
		self.fieldOrder = []
		self.minFields = 0
		self.importSchema(filename)
	def importSchema(self, filename, newline='', delimiter="\t"):
		with open(filename, newline=newline) as fi:
			cr = csv.reader(fi, delimiter=delimiter)
			for r in cr:
				si, f, e, t = r
				try:
					i = int(si)
					self.fieldOrder.append(i)
					self.fieldnames[i] = f
					self.valueres[i] = re.compile(e)
					self.transforms[i] = eval(t)
				except Exception as e:
					print(e, r, file=sys.stderr)
		self.minFields = self.fieldOrder[-1]
	def parseFile(self, filename, newline='', delimiter=None):
		delimiter = delimiter or self.delimiter
		with open(filename, newline=newline) as fi:
			for r in range(self.skipLines):
				fi.readline()
			cr = csv.reader(fi, delimiter=delimiter)
			for r in cr:
				try:
					if len(r) >= self.minFields:
						#mr = [ self.valueres[i].match(r[i]) for i in self.fieldOrder ]
						mr = dict( [ (i, self.valueres[i].match(r[i])) for i in self.fieldOrder ] )
						if mr[self.keyField]:
							yield [ self.transforms[i](mr[i].groups()) if mr[i] else nullOutputValue for i in self.fieldOrder ]
				except Exception as e:
					print(e, r, file=sys.stderr)
	def getHeader(self):
		return(list(self.fieldnames.values() ))
	def concatenate(self, infiles, outfobj, newline='', delimiter="\t"):
		cw = csv.writer(outfobj, delimiter=delimiter)
		cw.writerow(self.getHeader())
		for ifn in infiles:
			cw.writerows(self.parseFile(ifn, newline=newline))
###