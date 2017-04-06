#!/bin/bash


while read p
do
	CODEUC=$(echo $p | awk -F"&" '{print $1}' | xargs -0)
	TITLE=$(echo $p | awk -F"&" '{print $2}' | xargs -0)
    CODEUCS=$(echo $CODEUC | sed 's/\\//g' | sed 's/UC/SEQ/g')
	TITLES=$(echo $TITLE | sed 's/\\//g' | xargs -0)
	echo "\\section{Blackbox ${CODEUCS} - ${TITLES}}"
done < lista.txt
