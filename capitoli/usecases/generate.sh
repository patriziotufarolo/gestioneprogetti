#!/bin/bash


while read p
do
	CODEUC=$(echo $p | awk -F"&" '{print $1}' | xargs -0)
	TITLE=$(echo $p | awk -F"&" '{print $2}' | xargs -0)
    CODEUCS=$(echo $CODEUC | sed 's/\\//g')
	TITLES=$(echo $TITLE | sed 's/\\//g')
	cp uc_template.tex $CODEUCS.tex
	sed -i "s/<ID>/$CODEUCS/g" $CODEUCS.tex
	sed -i "s/<TITLE>/$TITLES/g" $CODEUCS.tex
	echo "\\subfile{capitoli/usecases/$CODEUCS}"
done < lista.txt
