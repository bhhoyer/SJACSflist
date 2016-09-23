#!/usr/bin/env python

import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-v", help="Verbose, debug print enabled",action="store_true")	
args = parser.parse_args()

''' split master csv into individual radio files
open master.csv for read
read header row
for each radio open radio(0-n).csv for write
read master line
write radio 0-n lines
'''