#!/bin/bash
if [ "$#" -lt 1 ]
then
	echo "USAGE: $0 logFile"
	exit 1
fi

file=$1
awk '!/^ *#/ { gsub(/[^0-9]:/,"",$2)  
$2=sprintf("%02s", $2+2) substr($2,3, length($2)); }1 { print $1, $2, $5, $14; }' $file

