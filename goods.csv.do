redo-ifchange "goods.csv.do.xsl" "LeapDayGoods.xml"
sed "s/,/;/g" "LeapDayGoods.xml" >temp.txt
xsltproc "goods.csv.do.xsl" "temp.txt"
rm temp.txt
