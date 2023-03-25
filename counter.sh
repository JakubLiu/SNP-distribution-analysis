#!/usr/bin/bash

#QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------------

for file in /media/DANE/home/jszyda/Kuba_Liu/CANONICAL/CHR22/EXONS/results_dir/*.txt

do

	snp_count=$(wc -l $file)
	echo $snp_count >> snp_count_per_exon_category_raw.txt
	awk -F ' ' '{print $1}' snp_count_per_exon_category_raw.txt >> holder1.txt
	awk -F 'dir/' '{print $2}' snp_count_per_exon_category_raw.txt >> holder2.txt


	gene_count=$(awk -F ' ' '{print $3}' $file | sort | uniq | wc -l)
	echo $gene_count >> holder3.txt
	name=$(basename $file)
	echo $name >> holder4.txt

done


paste -d ' ' holder1.txt holder2.txt > snp_count_per_exon_category.txt

paste -d ' ' holder3.txt holder4.txt > gene_count_per_exon_category.txt


rm snp_count_per_exon_category_raw.txt
rm holder*.txt
