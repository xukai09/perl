while read line
do
echo $line
name=`echo $line | cut -d "." -f 1`
name2=`echo $name"_sorted.tab.result"`
echo $name2
cat "$name2" "$line" > "$line.unite"
done
