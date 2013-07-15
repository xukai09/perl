id=0
while read line
do
  id=`expr $id + 1`
	echo "insert into organism (abbreviation, genus, species, common_name)
                     values ('"$1$id"', '"$2"', '"$line"', '"$line"');"
done


