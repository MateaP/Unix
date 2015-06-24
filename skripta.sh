#!/bin/bash
if [ "$#" -lt 1 ]
then
	echo "USAGE: $0 logFile"
	exit 1
fi

file=$1
time=`awk '!/^ *#/ { o=$2 
	gsub(/[^0-9]:/,"",o)
	tmp=sprintf("%02s", o+2)
	$2=$1 " " tmp substr($2,3, length($2)) " " $5 " " $14; }1 { print $2; }' $file`

echo $time

