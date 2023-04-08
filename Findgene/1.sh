#!/usr/bin/env bash 
for i in *.txt
do
	mv $i ${i%.*}.bed
	perl -p -i -e 's/ /\t/g' ${i%.*}.bed
	bedtools intersect -a ${i%.*}.bed  -b ./protein_coding.Mm.position  -wa -wb > ${i%.*}-symbol.txt
done
