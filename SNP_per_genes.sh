#!/usr/bin/bash



# this script is for counting the number of SNPs (in a given category) that fall into a given gene

# it aims to show the genes with the most SNPs in a given category

# to run it you have to change the filepaths

# if you analyze introns instead of exons you have to change the word 'exon' for 'intron'




# creating unique genes file--------------------------------------------------------------------------------------------------------------------------------------

for file in /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/INTRONS_canonical_human_chr22_genes_with_*

do
	echo 'creating unqiue gene file...'

	filename=$(basename $file)

	awk '{print $3}' $filename | uniq > $filename"_unique_genes.txt"

done

echo 'done.'

mkdir /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/UNIQUE_GENES

mv *_unique_genes.txt /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/UNIQUE_GENES/

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------



# creating count files ------------------------------------------------------------------------------------------------------------------------------------------

for i in {2..200}

do

	echo 'processing file'
	echo $i
	echo 'out of 200.'


	while read -r line;

	do

		echo $line >> /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/lines.txt

		echo 'grepping...'
		echo $i

		x=$(grep $line INTRONS_canonical_human_chr22_genes_with_$i"_introns.txt" | wc -l)

		echo $x >> /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/counts.txt

	done < /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/UNIQUE_GENES/*canonical_human_chr22_genes_with_$i"_introns.txt_unique_genes.txt"
	
	echo 'pasting...'

	paste /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/lines.txt /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/counts.txt | sort -k 2 -n > /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/SNP_per_gene_$i"_introns.txt"

	rm /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/lines.txt
	rm /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/counts.txt
	
	echo '______________________________________________________________________________________________________________________________________________________'
done


echo 'done'

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
