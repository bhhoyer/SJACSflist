#!/bin/bash
#
# Read the Kenwood TM-v71a CSV file and write out a file compatible
# with the ICOM ID-5100A
# Uncomment following statement for debug echos
DEBUG=1

USER=$(whoami)

KW_FREQ_LIST="Kenwood_TM-V71A.csv"

INPUT_DIR="/home/$USER/dev/github/SJACSflist/reffiles"
INPUT_FILE="$INPUT_DIR/$KW_FREQ_LIST"

OUTPUT_DIR="/home/$USER/tmp/id5100"
OUTPUT_FILE="$OUTPUT_DIR/test_file_100.csv"

ICOM_HEADER="CH No,Frequency,Dup,Offset,TS,Mode,Name,SKIP,TONE,Repeater Tone,TSQL Frequency,DTCS Code,DTCS Polarity,DV SQL,DV CSQL Code,Your Call Sign,RPT1 Call Sign,RPT2 Call Sign"

function dbgecho { if [ ! -z "$DEBUG" ] ; then echo "$*"; fi }

# ===== main

if [ ! -e "$INPUT_FILE" ] ; then
    echo "Could not locate $INPUT_FILE"
    exit 1
fi

if [ ! -d "$OUTPUT_DIR" ] ; then
    mkdir -p "$OUTPUT_DIR"
fi

if [ -e "$OUTPUT_FILE" ] ; then
    echo "Removing existing output file"
    rm "$OUTPUT_FILE"
fi

# Read the Kenwood CSV file line by line
bank_num=0
entry_count=0
OUTPUT_FILE="$OUTPUT_DIR/test_file_$bank_num.csv"

while read freqlist ; do
    chan_status="Err"
    # Read all columns of a csv file line
    channel_number=$(cut -d',' -f1 <<< $freqlist)
    # Channel number can only be 0-99
    ch_no=$(echo $channel_number | tail -c 3)
    # Remove leading zero(s)
    # This did not work.
    # ch_no=${ch_no##+(0)}
    ch_no=$(echo $ch_no | sed 's/^0*//')
    if [ -z "$ch_no" ] ; then
        ch_no=0
    fi

    # Test for first line which is a header
    if [ "$channel_number" == "Location" ] ; then
        echo "$ICOM_HEADER" > $OUTPUT_FILE
        continue;
    fi

    bank_num_max=$((bank_num + 100))
    # Files should be in 100 entry chunks
    if [ "$channel_number" -ge "$bank_num_max" ] ; then
        dbgecho "Entry count: $entry_count, for bank $bank_num"
        bank_num=$((bank_num+100))
        OUTPUT_FILE="$OUTPUT_DIR/test_file_$bank_num.csv"
        echo "$ICOM_HEADER" > $OUTPUT_FILE
        entry_count=0
    fi

    entry_count=$((entry_count + 1))
    Name=$(cut -d',' -f2 <<< $freqlist)
    freq=$(cut -d',' -f3 <<< $freqlist)
    dup=$(cut -d',' -f4 <<< $freqlist)
    if [ -z "$dup" ] ; then
        dup="OFF"
    else
        dup="DUP$dup"
    fi
    offset=$(cut -d',' -f5 <<< $freqlist)
    Tone=$(cut -d',' -f6 <<< $freqlist)
    if [ -z "$Tone" ] ; then
        Tone="OFF"
    else
        # Make upper case
        Tone=$(echo "$Tone" | tr '[a-z]' '[A-Z]')
    fi
    rTone=$(cut -d',' -f7 <<< $freqlist)
    rTone="${rTone}Hz"

    cTone=$(cut -d',' -f8 <<< $freqlist)
    cTone="${cTone}Hz"

    DtcsCode=$(cut -d',' -f9 <<< $freqlist)
    DtcsPolarity=$(cut -d',' -f10 <<< $freqlist)

    if [ "$DtcsPolarity" == "NN" ] ; then
        DtcsPolarity="BOTH N"
    else
        echo "Debug: DtcsPolarity check: -$DtcsPolarity-"
    fi

    # Mode=$(cut -d',' -f11 <<< $freqlist)
    Mode=$(csvtool col 11 - <<< $freqlist)

    #TStep=$(cut -d',' -f12 <<< $freqlist)
    TStep=$(csvtool col 12 - <<< $freqlist)
    TStep="${TStep}kHz"
    Skip=$(cut -d',' -f13 <<< $freqlist)
    # Comment=$(cut -d',' -f14 <<< $freqlist)
    Comment=$(csvtool col 14 - <<< $freqlist)
    #URCALL=$(cut -d',' -f15 <<< $freqlist)
    URCALL=$(csvtool col 15 - <<< $freqlist)
    #RPT1CALL=$(cut -d',' -f16 <<< $freqlist)
    RPT1CALL=$(csvtool col 16 - <<< $freqlist)
    #RPT2Call=$(cut -d',' -f17 <<< $freqlist)
    RPT2Call=$(csvtool col 17 - <<< $freqlist)

    Skip="OFF"
    DvSql="OFF"
    DvSqlCode=0

    echo "$ch_no,$freq,$dup,$offset,$TStep,$Mode,$Name,$Skip,$Tone,$rTone,$cTone,$DtcsCode,$DtcsPolarity,$DvSql,$DvSqlCode,$URCALL,$RPT1CALL,$RPT2CALL" >> $OUTPUT_FILE
    dbgecho "channel number: $ch_no, bank number: $bank_num"
done < $INPUT_FILE

# Display last bank entry count
dbgecho "Entry count: $entry_count, for bank $bank_num"
