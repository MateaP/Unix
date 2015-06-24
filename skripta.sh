#!/bin/bash
if [ "$#" -lt 2 ]
then
	echo "USAGE: $0 logFile user"
	exit 1
fi

file=$1
user=$2
time=`awk '!/^ *#/ { printf "%-15s %-15s %-200s %-7s\n", $1, $2, $5, $14 }' $file | awk '{ o=$2 
	gsub(/[^0-9]:/,"",o)
	tmp=sprintf("%02s", o+2)
	$2=tmp substr($2,3, length($2))  
	}1'`

echo $time

