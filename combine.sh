#!/bin/bash
while read line;
do
echo $line > a
name=$(awk 'BEGIN { FS=","} {print $1}' a)
name2=${name// /_}
name=${name2}
eid=$(awk 'BEGIN { FS=","} {print $2}' a)
phone=$(awk 'BEGIN { FS=","} {print $3}' a)
echo $(grep -w "${eid}" file2.txt| head -1) > row
echo $(grep -w "${phone}" file3.txt| head -1) > row2
sal=$(awk 'BEGIN { FS=","} {print $2}' row )
salary=${sal:-"(NULL)"}
em=$(awk 'BEGIN { FS=","} {print $1}' row2 )
email=${em:-"(NULL)"}
yr=$(awk 'BEGIN { FS=","} {print $3}' row2 )
year=${yr:-"(NULL)"}
printf "%-15s\t%-15s\t%-100s\t%-15s\t%-15s\t%-15s\n" $eid "$name" $phone $salary $email $year >> merged.txt
done < file1.txt
sed -i 's/"/ /g' merged.txt
column -t -o"        " merged.txt >> finally
rm a
rm row
rm row2
rm merged.txt
sed -e 's/_/ /g' finally >> merged.txt
rm finally
