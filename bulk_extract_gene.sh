

id=0
while read line
do
	echo $line
	perl '/home/xukai/research/scripts/grab_gene.pl' $line $1 > $line.$1
  id=`expr $id + 1`

done
echo "read $id files\n"



