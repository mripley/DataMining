import sys
from REWUS2WeatherParser import REWUS2WeatherParser as parser

class DenverParser(parser):
	months = "Jan Feb March April May June July Aug Sept Oct Nov Dec".split()
	skipLines = 5
	delimiter="\t"
	#
	@staticmethod
	def run():
		p = DenverParser("Denver/fields.tab")
		with open("Denver-output.tab", 'w', newline="") as fo:
			p.concatenate([ "Denver/Admin{0}2010.tab".format(mn) for mn in DenverParser.months ], fo)
###
class FortCollinsParser(parser):
	skipLines = 1
	delimiter="\t"
	#
	@staticmethod
	def run():
		p = FortCollinsParser("Fort_Collins/header.tab")
		with open("Fort_Collins-output.tab", 'w', newline="") as fo:
			p.concatenate(["Fort_Collins/aerc-{0}.tab".format(x) for x in range(2009,2012)], fo)
###
class SanAntonioParser(parser):
	skipLines = 1
	delimiter=","
	#
	@staticmethod
	def run():
		p = SanAntonioParser("San_Antonio/fields.tab")
		with open("San_Antonio-output.tab", 'w', newline="") as fo:
			p.concatenate(["San_Antonio/San_Antonio_North.csv", ], fo)
###
class ScottsdaleParser(parser):
	skipLines = 0
	delimiter=","
	#
	@staticmethod
	def run():
		p = ScottsdaleParser("Scottsdale/fields.tab")
		with open("Scottsdale-output.tab", 'w', newline="") as fo:
			p.concatenate(["Scottsdale/ag.arizona.edu/azmet/data/27{0:02d}rd.txt".format(x) for x in range(7,12) ], fo)
###
if __name__=='__main__':
	for c in [ DenverParser, FortCollinsParser, SanAntonioParser, ScottsdaleParser ]:
		c.run()