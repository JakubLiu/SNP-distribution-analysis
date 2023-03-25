#!/usr/bin/bash



for file in /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/*introns.txt

do


	echo 'working...'

	counter=$(awk -F ' ' '{print $2}' $file | head -n 1)

	awk -F ' ' '{print $1}' $file > Python_input_genes_with_$counter"_introns.txt"





done	

echo "done"
