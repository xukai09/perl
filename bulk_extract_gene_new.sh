#! /bin/bash

id=0
while read line
do
	echo $line
	perl '/home/xukai/Desktop/bioperl_test/genomes/grab_gene_new.pl' $line $1 > $line.$1
  id=`expr $id + 1`

done
echo "read $id files"

