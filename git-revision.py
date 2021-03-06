#!/usr/bin/env python

import subprocess
import sys, getopt

def main(argv):

	if len(sys.argv) == 1:
		print("get-revisions - update git_rev_data.h with GIT describe outpout")
		sys.exit(3)
		
	datafile = ''

	try:
		opts, args = getopt.getopt(argv,"ho:")
	except getopt.GetoptError:
		print("get-revisions - update git_rev_data.h with GIT describe outpout")
		sys.exit(2)
		
	for opt, arg in opts:
		if opt == '-h':
			print("git-revisions [-h] -o <filepath>")
			sys.exit(1)
		elif opt == "-o":
			datafile = arg

	try:
		temp = subprocess.check_output(["git", "describe", "--tags", "--long"]).decode('ascii').strip();
	except:
		temp = "no-rev-data"

	try:
		f = open( datafile, "w")
		f.write( "// DO NOT EDIT THIS FILE. AUTOMATICALLY GENERATED\n")
		f.write( "#define GIT_REV_DATA \"" + temp + "\"" )
	except:
		print("Unable to write/create file: " + datafile)
		sys.exit(4)

if __name__ == "__main__":
	main(sys.argv[1:])

