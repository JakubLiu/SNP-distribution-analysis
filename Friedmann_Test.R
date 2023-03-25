#QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------------

friedman_tester <- function(data){
  
  data_new <- as.matrix(read.table(data, sep = ''), sep = ' ')
  
  data_new[,1] = sub(" ", "", data_new[,1])
  unique_genes = unique(data_new[,3])
  final_matrix = matrix(-9, nrow = as.numeric(genes_matrix[1,2]), length(unique_genes))
  
  for(i in 1:length(unique_genes)){
    for(j in 1:data_new[1,2]){
      final_matrix[j,i] = length(which(subset(data_new, data_new[ ,3] == unique_genes[i])[ ,1] == j))}}
  
  colnames(final_matrix) = unique_genes
  final_matrix_transposed = t(final_matrix)
  results = friedman.test(final_matrix_transposed)
  library(PMCMRplus)
  results2 = frdAllPairsConoverTest(final_matrix_transposed, p.adjust.method = "bonf")
  print(basename(data))
  return(results2)
}


friedman_tester(data = "C:/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/results_dir_introns/INTRONS_canonical_human_chr22_genes_with_15_introns.txt")
