#!/bin/bash
while read line;
do
echo $line > a
name=$(awk 'BEGIN { FS=","} {print $1}' a)
eid=$(awk 'BEGIN { FS=","} {print $2}' a)
phone=$(awk 'BEGIN { FS=","} {print $3}' a)
echo $(grep -w "${eid}" file2.txt| head -1) > row
echo $(grep -w "${phone}" file3.txt| head -1) > row2
if [ $(grep -w "${eid}" file2.txt| wc -l) -eq 0 ]
then
printf "%-15s \t %-17s \t %-10s \t %-15s \t %-19s \t %-22s \n" $eid "$name" $phone " " $(awk 'BEGIN { FS=","} {print $1}' row2 ) $(awk 'BEGIN { FS=","} {print $3}' row2 ) >> merged.txt
else
printf "%-15s \t %-17s \t %-10s \t %-15s \t %-15s \t %-22s \n" $eid "$name" $phone $(awk 'BEGIN { FS=","} {print $2}' row ) $(awk 'BEGIN { FS=","} {print $1}' row2 ) $(awk 'BEGIN { FS=","} {print $3}' row2 ) >> merged.txt
fi
done < file1.txt
sed -i 's/"/ /g' merged.txt
rm a
rm row
rm row2
