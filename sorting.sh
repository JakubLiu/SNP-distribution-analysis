#!/usr/bin/bash


maxfiles=200       # uwaga potem, trzeba manualnie zrobić plik na 172 exony
i=1
echo "start"
while [ $maxfiles -ge $i ]
do
  echo creating: genes_with_$i"_exons.txt"  
  awk -F ',' '$2 == '$i' {print $1,$2,$3}' canonical_human_chr22_genes.txt > canonical_human_chr22_genes_with_$i"_exons.txt"


  i=$[ $i+1 ]
done

echo 'done'

