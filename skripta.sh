#!/bin/bash
if [ "$#" -lt 2 ]
then
	echo "USAGE: $0 logFile user"
	exit 1
fi

file=$1
user=$2
time=`cat $file | sed -n '/[0-9][0-9]:[0-9][0-9]:[0-9][0-9] */p' | grep '/' | awk '{ printf "%-15s %-200s %-7s\n", $2, $5, $14 }' | awk '{ o=$1 
	gsub(/[^0-9]:/,"",o)
	tmp=sprintf("%02s", o+2)
	$1=tmp substr($1,3, length($1))  
	}1'`

echo $time

