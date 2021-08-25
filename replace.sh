awk -v a=$1 '{for(i=1;i<NF;i++)if($i==a)m=i;{print $m}}' merged.txt
