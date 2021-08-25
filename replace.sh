column=$(awk -v a=$1 '{for(i=1;i<=NF;i++)if($i==a)print i}' merged.txt)
awk -v a="$2" -v b="$3" '{gsub(a,b,$6)} 1' merged.txt > pipe
column -t pipe>a
