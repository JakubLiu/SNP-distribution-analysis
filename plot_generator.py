#QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------------


# input_file_path   ===> path to the input .txt file (for example Python_input_genes_with_23_exons.txt)
# output_file_path  ===> file to the output file (a pdf plot)
# introns_or_exons  ===> 'introns' or 'exons'
# number  ===> the number of introns or exons (for example 23)

def occurence_counter(input_file_path, output_file_path, introns_or_exons, number):
    
    file = open(input_file_path, 'r')
    data = file.read()
    data_list = data.split("\n")
    data_list.pop(-1)
    file.close()
    
    holder_set = set(data_list)
    uniq_list = list(holder_set)
    uniq_list_int = []

    for elem in uniq_list:
        elem2 = int(elem)
        uniq_list_int.append(elem2)

    sorted_uniq_list = sorted(uniq_list_int)
    occurence_list = []
    
    for i in sorted_uniq_list:
        element = data_list.count(str(i))
        occurence_list.append(element)
        
    import numpy as np
    import matplotlib.pyplot as plt
    
    plt.figure(figsize=(10,5))
    plt.bar(sorted_uniq_list, occurence_list, color = 'blue', width = 0.4)
    plt.xlabel(introns_or_exons)
    plt.ylabel('number of SNPs')
    title = 'genes with' + ' ' + str(number) + ' ' + introns_or_exons
    plt.title(title)
    plt.savefig(output_file_path, format="pdf", bbox_inches="tight")
    plt.show()

