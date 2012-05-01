# python 3.2
from collections import defaultdict
import os
import os.path
import re
import sys
#
logger_filename_re = '(?P<serial>0?11\d{3}|0?12\d{3})(\D[^.]*)(?P<extension>[.]?\w*)'

class keycodeMatcher():
	keycode_filename_re = '(Copy( \(\d\))? of )?(?P<yearcode>09|10|11|12|13|14|15)(?P<typecode>[a-zA-Z])(?P<sequence>\d{3})(?P<suffix>\w+)?(?P<extension>[.]?\w*)'
	keycode6_format = "{0.yearcode:02d}{0.typecode}{0.sequence:03d}"
	keycode8_format = keycode6_format+"{0.suffix}"
	common_extensions = [ ".CSV", ".MDB", ".MMDATA", ".TDB", ".TWDB" ]
	#
	def parse(self, groupdict):
		self.yearcode	= int(groupdict['yearcode'])
		self.typecode	= groupdict['typecode'] or ""
		self.sequence	= int(groupdict['sequence'])
		self.suffix		= groupdict['suffix'] or ""
		self.extension	= groupdict['extension'] or ""
	def keycode6(self):
		return(self.keycode6_format.format(self))
	def keycode8(self):
		return(self.keycode8_format.format(self))
	def __init__(self, groupdict):
		self.parse(groupdict)
		if self.typecode:
			self.typecode = self.typecode.upper()
		if self.suffix:
			self.suffix = self.suffix.upper()
#
def find_files_by_keycode(dirname = ".", extensions = None, files_by_keycode = None, unmatched_logger_files = None, other_files = None):
	interesting_extensions = extensions or keycodeMatcher.common_extensions
	keycode_re = re.compile(keycodeMatcher.keycode_filename_re)
	logger_re = re.compile(logger_filename_re)
	#
	files_by_keycode = files_by_keycode or defaultdict(list)
	unmatched_logger_files = unmatched_logger_files or defaultdict(list)
	other_files = other_files or defaultdict(list)
	for root, dirs, files in os.walk(dirname):
		for fn in files:
			path = os.path.join(root, fn)
			head, ext = os.path.splitext(fn)
			if ext.upper() in interesting_extensions:
				m = keycode_re.match(fn)
				if m:
					km = keycodeMatcher(m.groupdict())
					files_by_keycode[km.keycode6()].append(path)
				else:
					m = logger_re.match(fn)
					if m:
						mg = m.groupdict()
						unmatched_logger_files[mg['serial']].append(path)
					else:
						other_files[head].append(path)
	#
	return(files_by_keycode, unmatched_logger_files, other_files)
#
if __name__ == "__main__":
	args = sys.argv[1:] or [ "Task6_Logging_Samples", "Task8_Log_Data&Analysis" ]
	sep = '\t'
	#
	good, bad, ugly = None, None, None
	for dirname in args:
		good, bad, ugly = find_files_by_keycode(dirname, 
												files_by_keycode = good, 
												unmatched_logger_files = bad, 
												other_files = ugly)
	#
	if good:
		print()
		print("Files found by keycode:")
		for k,l in good.items():
			print(k, sep, "{0} files".format(len(l)), sep, sep.join(l))
	if bad:
		print()
		print("Possible traces with logger serial numbers instead of keycodes:")
		for k,l in bad.items():
			print(k, sep, "{0} files".format(len(l)), sep, sep.join(l))
	if ugly:
		print()
		print("Possible traces that you might have to check manually:")
		for k,l in ugly.items():
			print(k, sep, "{0} files".format(len(l)), sep, sep.join(l))
#