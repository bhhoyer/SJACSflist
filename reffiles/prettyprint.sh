#!/bin/bash

infile_name="HTdualband_noob"
outfile_name="HTdualband"

outfile_tmp="${outfile_name}_tmp.csv"
mdfile_tmp=${outfile_name}_tmp.md
cp ${infile_name}.csv $outfile_tmp

# sed -i -e '1 s/^.*$/Loc,ID,Frequency,OFS,Offset,PL,rTone,cToneFreq,DtcsCode,DtcsPolarity,Mode,TStep,Skip,Comment,CALL,RPT1CALL,RPT2CALL/' $outfile_tmp

echo "csv tool start"
csvtool col 1,3,4,2,15,7,6,14 ${infile_name}.csv  > $outfile_tmp
sed -i -e '1 s/^.*$/Loc,Freq,OFS,ID,Call,Tone,PL,Comment/' $outfile_tmp
sed -i 2i' --- , ---- , :---: , ---, :---:, -- , ---, ------- ' $outfile_tmp
echo "csv tool end"

csvformat  -D "|" ${outfile_tmp} > ${mdfile_tmp}
sed -i 's/.*/| & | /' ${mdfile_tmp}

linecnt=0

#line="Stanwood-Camano Is. ****"
#line="| 16|147.5||TAC-16||131.8|Tone|Stanwood-Camano Is.**** |"
#echo "line: $line"
#echo "$(echo \'$line\' | cut -d '|' -f9)"
#exit

while read -r line ; do
linecnt=$((linecnt+1))

if (( linecnt <= 2 )) ; then
    echo "$line"
#    printf "|%s|\n" $line
    continue;
fi

loc_var=$(echo $line | cut -d'|' -f2)
freq_var=$(echo $line | cut -d'|' -f3)
strlen=${#freq_var}
if (( strlen > 7)) ; then
   freq_var=$(printf "%3.4f" "$freq_var")
else
   freq_var=$(printf "%3.3f" "$freq_var")
fi
ofs_var=$(echo $line | cut -d'|' -f4)
if [ -z "$ofs_var" ] ; then
    ofs_var=" "
fi
id_var=$(echo $line | cut -d'|' -f5)
call_var=$(echo $line | cut -d'|' -f6)
tone_var=$(echo $line | cut -d'|' -f7)
# A tone of 88.5 is a place holder for chirp
if [[ "$tone_var" == "88.5"  &&  ( "${id_var:0:3}" == "NET" || "${id_var:0:4}" == "APRS"  || "$loc_var" -ge "110" ) ]]  ; then
    tone_var=" "
else
   tone_var=$(printf "%3.1f" "$tone_var")
fi
pl_var=$(echo $line | cut -d'|' -f8)
comment_var="$(echo \'$line\' | cut -d'|' -f9)"

#let freq_var=$((freq_var))
#echo "loc_var=$loc_var, freq_var=$freq_var, id_var=$id_var"

#printf "| %3s | %s | %1s | %s | %s | %s |\n" "$loc_var" "$freq_var" "$ofs_var" "$id_var" "$call_var" "$tone_var" "$pl_var"
echo "| $loc_var | $freq_var | $ofs_var | $id_var | $call_var | $tone_var | $pl_var | $comment_var|"

done < ${mdfile_tmp} > ${outfile_name}.md

# This text needs to match text in freqlist_bbs_xxxx.txt
{
echo
echo "\`\`\`"
echo "* CS = Carrier Squelch (no tone)"
echo "**    NBFM Repeater CHANNEL 5 output"
echo "***   NBFM Repeater channel 7 output"
echo "****  NBFM Repeater channel 8 input"
echo "\`\`\`"
echo

echo "* TAC = VOICE TAC CHANNEL"
echo "* NET = PACKET CHANNEL"
echo "* ALPHA TAGS are based on NPSTC channel naming convention as used in NIFOG:"
echo "  * FIRST NUMBER = BAND (eg 1 = 144, 2 = 220, 4 = 440) This helps eliminate confusion on dual band radios that may contain two repeaters on diferent bands with the same name/location."
echo "  * SECOND NUMBER = CHANNEL NUMBER"
echo "    * EXAMPLE: TAC-40"
echo "    * TAC = Voice, 4 = 440 band, 0 = Nat. Simplex"
echo "* OFS heading means offset of the repeater split and when set to off inhibits transmit."
} >> ${outfile_name}.md
