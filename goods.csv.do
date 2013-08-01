redo-ifchange "transform.xsl" "LeapDayGoods.xml"
sed "s/,/;/g" "LeapDayGoods.xml" >temp.txt
xsltproc "transform.xsl" "temp.txt"
rm temp.txt
