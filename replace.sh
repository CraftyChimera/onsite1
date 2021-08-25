#!/bin/bash
echo $(cat merged.txt | head -1) > a
column=$(awk -v a=$1 '{for(i=1;i<=NF;i++)if($i==a)print i}' a)
var=$(awk -v col=$column -v a="$2" -v b="$3" 'BEGIN{OFS=FS="        "}{gsub(a,b,$col)} 1' merged.txt)
echo "$var" > merged.txt
rm a
