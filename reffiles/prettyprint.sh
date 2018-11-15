#!/bin/bash

file_name="HTdualband_noob"

outfile="${file_name}_tmp.csv"
cp ${file_name}.csv $outfile
infile_name="$outfile"
sed -i -e '1 s/^.*$/Loc,ID,Frequency,OFS,Offset,PL,rTone,cToneFreq,DtcsCode,DtcsPolarity,Mode,TStep,Skip,Comment,CALL,RPT1CALL,RPT2CALL/' $outfile

# '[^0-9.]+'
#{
#csvcut -c 1,3,4,2,15,7,6,14 ${file_name}.csv | csvlook
#} > $file_name.md

#PYTHONIOENCODING=utf8 csvcut -c 1,3,4,2,15,7,6,14 HTdualband_noob.csv | PYTHONIOENCODING=utf8 csvlook
#PYTHONIOENCODING=utf8 in2csv HTdualband_noob.csv | PYTHONIOENCODING=utf8 csvcut -c 1,3,4,2,15,7,6,14 | PYTHONIOENCODING=utf8 csvlook
#csvcut -e iso-8859-1 -c 1,3,4,2,15,7,6,14 HTdualband_noob.csv | csvlook -e iso-8859-1
#csvcut -e utf8 -c 1,3,4,2,15,7,6,14 HTdualband_noob.csv | csvlook -e utf8


PYTHONIOENCODING=utf8 csvcut -c 1,3,4,2,15,7,6,14 ${infile_name} | PYTHONIOENCODING=utf8 csvlook > ${file_name}.md

#csvtool col 1,3,4,2,15,7,6,14 ${file_name}.csv | csvtool readable -

#csvtool format '%(1) |  %(3) %(4) %(2) %(15) %(7) %(6) %(14) | ' ${file_name}.csv

#csvtool format ' |  %1  |  %3 | %(4) %(2) %(15) %(7) %(6) %(14) | \n' ${file_name}.csv

#csvtool format ' |  %1  |  %3 | %(4) %(2) %(15) %(7) %(6) %(14) | \n' ${file_name}.csv | csvtool readable -

# csvtool format ' |  %1  |  %3 | %(4) %(2) %(15) %(7) %(6) %(14) | \n' ${file_name}.csv | PYTHONIOENCODING=utf8 csvlook

