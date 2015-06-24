#!/bin/bash
if [ "$#" -lt 1 ]
then
	echo "USAGE: $0 logFile"
	exit 1
fi

file=$1
time=`awk '!/^ *#/ { $2=$1 " " sprintf("%02s", gsub(/[^0-9]:/,"",$2)+2) substr($2,3, length($2)) " " $5 " " $14; }1 { print $2; }' $file`

echo $time

